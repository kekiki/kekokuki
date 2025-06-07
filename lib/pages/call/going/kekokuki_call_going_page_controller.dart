import 'dart:async';

import 'package:get/get.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kekokuki/common/utils/kekokuki_loading_util.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
import 'package:kekokuki/services/config/kekokuki_config_service.dart';
import 'package:kekokuki/services/database/kekokuki_database.dart';
import 'package:kekokuki/services/profile/kekokuki_profile_mixin.dart';
import 'package:kekokuki/services/profile/kekokuki_profile_service.dart';

import '../../../common/utils/kekokuki_log_util.dart';
import '../../../generated/assets.dart';
import '../../../services/api/kekokuki_api_client.dart';
import '../../../services/api/kekokuki_api_error_code.dart';
import '../../../services/preference/kekokuki_app_preference.dart';
import '../../../services/profile/kekokuki_profile_model.dart';
import '../../../services/routes/kekokuki_routes.dart';
import '../../explore/anchor_detail/kekokuk_anchor_model.dart';
import '../../explore/anchor_detail/kekokuki_anchor_mixin.dart';
import '../../explore/anchor_detail/kekokuki_anchor_repository.dart';
import '../ai/kekokuki_aiv_anchor_model.dart';
import '../calling/kekokuki_calling_model.dart';
import '../services/kekokuki_call_model.dart';
import '../services/kekokuki_call_service.dart';
import 'kekokuki_call_channel_model.dart';
import 'kekokuki_call_going_model.dart';

class KekokukiCallGoingPageController extends GetxController with KekokukiAnchorMixin, KekokukiProfileMixin {
  final _tag = 'CallGoing';

  final _apiClient = Get.find<KekokukiApiClient>();
  final _callService = Get.find<KekokukiCallService>();
  final _anchorRepository = Get.find<KekokukiAnchorRepository>();

  late KekokukiCallGoingModel _goingModel;
  final anchorObs = const KekokukiAnchorModel().obs;
  KekokukiProfileModel? _profileModel;

  static const int _waitingSeconds = 25;
  Timer? _waitingTimer;
  AudioPlayer? _audioPlayer;

  int _channelId = 0;
  bool get _isSendCallInvitation => _channelId != 0;
  final _isAnchorReceivedInvitationObs = false.obs;
  KekokukiCallChannelModel? _channelModel;
  bool _isSelfJoined = false;
  bool _isAnchorJoined = false;

  bool get _canCreateCall {
    final minCallPrice = Get.find<KekokukiConfigService>().configModel.callPrice;
    final balance = _profileModel?.remainDiamonds ?? 0;
    final callCardNum = _profileModel?.callCardNum ?? 0;
    return callCardNum > 0 || balance >= minCallPrice;
  }

  @override
  void onInit() {
    _goingModel = Get.arguments;
    super.onInit();

    _profileModel = Get.find<KekokukiProfileService>().profileModel;
    addAnchorInfoListener(_goingModel.anchorId, anchorObs.call);
    addProfileChangedListener((m) => _profileModel = m);
  }

  @override
  void onReady() {
    super.onReady();

    _createCallOrAiv();
    _startAudioPlayer();
    _startInviteTimer();
    _anchorRepository.fetchAnchorInfo(anchorId: _goingModel.anchorId, useCache: true);
  }

  @override
  void onClose() {
    _stopInviteTimer();
    _stopAudioPlayer();
    removeProfileChangedListener();
    removeAnchorInfoListener();
    super.onClose();
  }

  Future<void> _hangupCall(KekokukiCallEndStatus status, String message) async {
    // 如果是手动挂断,此时主播已经接受了邀请,则不允许挂断了
    if (status == KekokukiCallEndStatus.hangUp && _isAnchorReceivedInvitationObs.value) {
      KekokukiLoadingUtil.showToast('对方已接受了你的通话邀请,请耐心等待哦~');
      return;
    }
    KekokukiLoadingUtil.showToast(message);
    if (_isSendCallInvitation) {
      await _cancelCallInvitation(status);
    }
    await _callService.release();
    Get.until((route) => route.settings.name == KekokukiRoutes.callGoing);
    Get.back();
  }

  Future<void> _createCallOrAiv() async {
    if (_canCreateCall) {
      await _createCall();
    } else {
      await _fetchFreeVideo();
    }
  }

  Future<void> _createCall() async {
    final path = '${_goingModel.callType.value}/${_goingModel.anchorId}';
    final response = await _apiClient.createCall(path).response;
    if (!response.isSuccess) {
      if (response.code == KekokukiApiErrorCode.otherCanNotCall.value) {
        final anchor = anchorObs.value.copyWith(onlineStatus: KekokukOnlineStatus.busy);
        Get.find<KekokukiDatabase>().anchorDao.updateAnchor(anchor);
        await _hangupCall(KekokukiCallEndStatus.otherError, response.msg);
      } else if (response.code == KekokukiApiErrorCode.balanceNotEnough.value) {
        await _hangupCall(KekokukiCallEndStatus.balanceNotEnough, response.msg);
      } else if (response.code == KekokukiApiErrorCode.callError.value) {
        await _hangupCall(KekokukiCallEndStatus.callError, response.msg);
      } else {
        final status = KekokukiCallEndStatus.values.firstWhereOrNull((e) => e.value == response.code);
        await _hangupCall(status ?? KekokukiCallEndStatus.callError, response.msg);
      }
      return;
    }
    final channelId = response.data.toString();
    await _sendCallInvitation(channelId);
  }

  Future<void> _fetchFreeVideo() async {
    final response = await _apiClient.fetchFreeVideo(_goingModel.anchorId).response;
    if (response.isSuccess && response.data != null) {
      final aivModel = response.data!;
      if (aivModel.canCreateCall) {
        await _createCall();
      } else if (aivModel.canPlayAiv) {
        await _startAivCall(aivModel.copyWith(voiceFlag: 1));
      } else {
        await _hangupCall(KekokukiCallEndStatus.balanceNotEnough, '余额不足');
      }
    } else {
      await _hangupCall(KekokukiCallEndStatus.networkError, response.msg);
    }
  }

  Future<void> _sendCallInvitation(String channelId) async {
    _channelId = int.tryParse(channelId) ?? 0;
    await _callService.sendCallInvitation(
      anchorId: _goingModel.anchorId,
      channelId: channelId,
      callType: _goingModel.callType,
      handle: KekokukiCallInvitationHandle(
        onAnchorReceivedInvitation: (_) => _isAnchorReceivedInvitationObs.value = true,
        onAnchorAcceptedInvitation: (_) => _joinCallChannel(),
        onAnchorRefusededInvitation: (_) => _hangupCall(KekokukiCallEndStatus.localCallReject, '对方拒绝通话'),
      ),
    );
  }

  Future<void> _cancelCallInvitation(KekokukiCallEndStatus status) async {
    int? matchMode = KekokukiAppPreference.user.privacyCamera ? 1 : null;
    _apiClient.cancelCall(_channelId, status.value, matchMode).response;
    await _callService.cancelCallInvitation();
  }

  Future<void> _joinCallChannel() async {
    final response = await _apiClient.joinCall(_channelId.toString()).response;
    if (!response.isSuccess) {
      return await _hangupCall(KekokukiCallEndStatus.networkError, response.msg);
    }
    _channelModel = response.data;
    await _callService.joinCallChannel(
      anchorId: _goingModel.anchorId,
      channelId: _channelId.toString(),
      token: _channelModel!.rtcToken,
      onSelfJoined: () => _startAnchorCall(selfJoined: true),
      onAnchorJoined: () => _startAnchorCall(anchorJoined: true),
    );
  }

  Future<void> _startAnchorCall({bool? selfJoined, bool? anchorJoined}) async {
    if (selfJoined != null) _isSelfJoined = selfJoined;
    if (anchorJoined != null) _isAnchorJoined = anchorJoined;
    if (!_isSelfJoined || !_isAnchorJoined) return;

    final callingModel = KekokukiCallingModel(anchorObs.value, _goingModel.callType, channelModel: _channelModel);

    Get.until((route) => route.settings.name == KekokukiRoutes.callGoing);
    Get.offAndToNamed(KekokukiRoutes.callCalling, arguments: callingModel);
  }

  Future<void> _startAivCall(KekokukiAivAnchorModel aivModel) async {
    final callingModel = KekokukiCallingModel(anchorObs.value, _goingModel.callType, aivModel: aivModel);
    Get.until((route) => route.settings.name == KekokukiRoutes.callGoing);
    Get.offAndToNamed(KekokukiRoutes.callCalling, arguments: callingModel);
  }

  Future<void> _startAudioPlayer() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    try {
      _audioPlayer = AudioPlayer();
      await _audioPlayer?.setAsset(Assets.audiosKekokukiCallAudio);
      await _audioPlayer?.setLoopMode(LoopMode.one);
      await _audioPlayer?.play();
    } on PlayerException catch (e, s) {
      KekokukiLogUtil.e(_tag, "Error loading audio source: $e", s);
    }
  }

  Future<void> _stopAudioPlayer() async {
    _audioPlayer?.stop();
    _audioPlayer?.dispose();
  }

  void _startInviteTimer() {
    _stopInviteTimer();
    var countdown = _waitingSeconds;
    _waitingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countdown -= 1;
      if (countdown <= 0) {
        timer.cancel();
        _onCallTimeout();
      }
    });
  }

  void _stopInviteTimer() {
    _waitingTimer?.cancel();
    _waitingTimer = null;
  }

  void _onCallTimeout() {
    _hangupCall(KekokukiCallEndStatus.localCallTimeout, '无人接听');
  }
}
