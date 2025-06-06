import 'dart:async';

import 'package:get/get.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
import 'package:kekokuki/services/config/kekokuki_config_service.dart';
import 'package:kekokuki/services/database/kekokuki_database.dart';
import 'package:kekokuki/services/profile/kekokuki_profile_mixin.dart';
import 'package:kekokuki/services/profile/kekokuki_profile_service.dart';

import '../../../common/utils/kekokuki_log_util.dart';
import '../../../generated/assets.dart';
import '../../../services/api/kekokuki_api_client.dart';
import '../../../services/api/kekokuki_api_error_code.dart';
import '../../../services/profile/kekokuki_profile_model.dart';
import '../../explore/anchor_detail/kekokuk_anchor_model.dart';
import '../../explore/anchor_detail/kekokuki_anchor_mixin.dart';
import '../ai/kekokuki_aiv_anchor_model.dart';
import '../services/kekokuki_call_model.dart';
import '../services/kekokuki_call_service.dart';
import 'kekokuki_call_going_model.dart';

class KekokukiCallGoingPageController extends GetxController with KekokukiAnchorMixin, KekokukiProfileMixin {
  final _tag = 'CallGoing';

  final _apiClient = Get.find<KekokukiApiClient>();
  final _callService = Get.find<KekokukiCallService>();

  late KekokukiCallGoingModel _callModel;
  final anchorObs = const KekokukiAnchorModel().obs;
  KekokukiProfileModel? _profileModel;

  static const int _waitingSeconds = 25;
  Timer? _waitingTimer;
  AudioPlayer? _audioPlayer;
  final _isAnchorReceivedInvitationObs = false.obs;

  bool get _canCreateCall {
    final minCallPrice = Get.find<KekokukiConfigService>().configModel.callPrice;
    final balance = _profileModel?.remainDiamonds ?? 0;
    final callCardNum = _profileModel?.callCardNum ?? 0;
    return callCardNum > 0 || balance >= minCallPrice;
  }

  @override
  void onInit() {
    _callModel = Get.arguments;
    super.onInit();

    _profileModel = Get.find<KekokukiProfileService>().profileModel;
    addAnchorInfoListener(_callModel.anchorId, anchorObs.call);
    addProfileChangedListener((m) => _profileModel = m);
  }

  @override
  void onReady() {
    super.onReady();

    _createCallOrAiv();
    _startAudioPlayer();
    _startInviteTimer();
  }

  @override
  void onClose() {
    _stopInviteTimer();
    _stopAudioPlayer();
    removeProfileChangedListener();
    removeAnchorInfoListener();
    super.onClose();
  }

  void _hangupCall(KekokukiCallEndStatus status, {String? message}) {}

  Future<void> _createCallOrAiv() async {
    if (_canCreateCall) {
      await _createCall();
    } else {
      await _fetchFreeVideo();
    }
  }

  Future<void> _createCall() async {
    final path = '${_callModel.callType.value}/${_callModel.anchorId}';
    final response = await _apiClient.createCall(path).response;
    if (!response.isSuccess) {
      if (response.code == KekokukiApiErrorCode.otherCanNotCall.value) {
        final anchor = anchorObs.value.copyWith(onlineStatus: KekokukOnlineStatus.busy);
        Get.find<KekokukiDatabase>().anchorDao.updateAnchor(anchor);
        _hangupCall(KekokukiCallEndStatus.otherError, message: response.msg);
      } else if (response.code == KekokukiApiErrorCode.balanceNotEnough.value) {
        _hangupCall(KekokukiCallEndStatus.balanceNotEnough, message: response.msg);
      } else if (response.code == KekokukiApiErrorCode.callError.value) {
        _hangupCall(KekokukiCallEndStatus.callError, message: response.msg);
      } else {
        final status = KekokukiCallEndStatus.values.firstWhereOrNull((e) => e.value == response.code);
        _hangupCall(status ?? KekokukiCallEndStatus.callError, message: response.msg);
      }
      return;
    }
    final channelId = response.data.toString();
    await _sendCallInvitation(channelId);
  }

  Future<void> _fetchFreeVideo() async {
    final response = await _apiClient.fetchFreeVideo(_callModel.anchorId).response;
    if (response.isSuccess && response.data != null) {
      final aivModel = response.data!;
      if (aivModel.canCreateCall) {
        await _createCall();
      } else if (aivModel.canPlayAiv) {
        await _createAivCall(aivModel.copyWith(voiceFlag: 1));
      } else {
        _hangupCall(KekokukiCallEndStatus.balanceNotEnough);
      }
    } else {
      _hangupCall(KekokukiCallEndStatus.networkError, message: response.msg);
    }
  }

  Future<void> _sendCallInvitation(String channelId) async {
    await _callService.sendCallInvitation(
      anchorId: _callModel.anchorId,
      channelId: channelId,
      callType: _callModel.callType,
      handle: KekokukiCallInvitationHandle(
        onAnchorReceivedInvitation: (_) => _isAnchorReceivedInvitationObs.value = true,
        onAnchorAcceptedInvitation: (_) => _joinCallChannel(),
        onAnchorRefusededInvitation: (_) => _hangupCall(KekokukiCallEndStatus.localCallReject),
      ),
    );
  }

  Future<void> _joinCallChannel() async {}

  Future<void> _createAivCall(KekokukiAivAnchorModel aivModel) async {}

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
    // KekokukiCallEngineManager.instance.exitRoom(state.callModel.sessionId);
    // KekokukiCallInvitationManager.instance.apiCallTimeout(
    //   callModel: state.callModel,
    //   callType: state.callType,
    // );
    Get.back();
  }
}
