import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
import 'package:kekokuki/services/rtm&rtc/kekokuki_rtc_service.dart';
import 'package:wakelock/wakelock.dart';

import '../../../common/utils/kekokuki_format_util.dart';
import '../../../common/utils/kekokuki_loading_util.dart';
import '../../../common/utils/kekokuki_log_util.dart';
import '../../../services/api/kekokuki_api_client.dart';
import '../../../services/profile/kekokuki_profile_mixin.dart';
import '../../../services/routes/kekokuki_routes.dart';
import '../../widgets/dialogs/kekokuki_confirm_dialog.dart';
import '../../widgets/dialogs/kekokuki_dialog_util.dart';
import '../services/kekokuki_call_model.dart';
import 'kekokuki_calling_state.dart';
import 'widgets/kekokuki_calling_placeholder.dart';

class KekokukiCallingPageController extends GetxController with KekokukiProfileMixin {
  final state = KekokukiCallingState();

  final _tag = 'Video Calling';

  final _apiClient = Get.find<KekokukiApiClient>();
  final _rtcService = Get.find<KekokukiRtcService>();

  Timer? _callingTimer;
  int _callingSeconds = 0;

  Widget? _localPreviewWidget;
  Widget? _remotePreviewWidget;

  bool _isRemoteCameraEnable = false;

  final StreamController<Widget> _smallScreenWidgetStreamController = StreamController();
  final StreamController<Widget> _fullScreenWidgetStreamController = StreamController();

  Stream<Widget> get smallScreenWidgetStream => _smallScreenWidgetStreamController.stream;
  Stream<Widget> get fullScreenWidgetStream => _fullScreenWidgetStreamController.stream;

  StreamController<Widget> get _localController => state.isLocalSmallPreview ? _smallScreenWidgetStreamController : _fullScreenWidgetStreamController;
  StreamController<Widget> get _remoteController => state.isLocalSmallPreview ? _fullScreenWidgetStreamController : _smallScreenWidgetStreamController;

  Widget get initFullScreenPlaceholder => KekokukiCallingPlaceholder(avatar: state.callModel.anchor.portrait, fullScreen: true, isSelf: false);
  Widget get initSmallScreenPlaceholder => KekokukiCallingPlaceholder(avatar: state.profileObs.value.portrait, fullScreen: false, isSelf: true);

  @override
  void onInit() {
    state.callModel = Get.arguments;
    super.onInit();

    Wakelock.enable();
    _startCallingTimer();
    addProfileChangedListener(state.profileObs.call);
  }

  @override
  void onReady() {
    super.onReady();
    _rtcService.listen(
      anchorId: state.callModel.anchor.id,
      onAnchorOffline: _onAnchorOffline,
      onDisconnected: _onDisconnected,
      onTokenWillExpire: _onTokenWillExpire,
    );
    _setupVideoStream();
  }

  @override
  void onClose() {
    removeProfileChangedListener();
    _stopCallingTimer();
    _smallScreenWidgetStreamController.close();
    _fullScreenWidgetStreamController.close();
    _localPreviewWidget = null;
    _remotePreviewWidget = null;
    Wakelock.disable();
    super.onClose();
  }

  void _startCallingTimer() {
    KekokukiLogUtil.d(_tag, "_startCallingTimer");
    _callingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.callingDurationObs.value = KekokukiFormatUtil.durationToTime(
        _callingSeconds,
        isShowHour: false,
      );
      _callingSeconds += 1;
      if (_callingSeconds % 60 == 0) {
        // 每60秒续订一次token，服务器有计费逻辑
        _renewRtcToken();
      }
    });
  }

  void _stopCallingTimer() {
    _callingTimer?.cancel();
    _callingTimer = null;
  }

  Future<void> _setupVideoStream() async {
    await _rtcService.setupVideoConfig();
    await _rtcService.startPreview();

    final localWidget = _rtcService.createLocalVideoWidget();
    _smallScreenWidgetStreamController.add(localWidget);
    _localPreviewWidget = localWidget;

    final anchorId = state.callModel.anchor.id;
    final channelId = state.callModel.channelModel!.channelId.toString();
    final remoteWidget = _rtcService.createRemoteVideoWidget(anchorId, channelId);
    _fullScreenWidgetStreamController.add(remoteWidget);
    _remotePreviewWidget = remoteWidget;
    _isRemoteCameraEnable = true;
  }

  bool _isCallFinished = false;
  Future<void> _onFinishCall(String reason) async {
    KekokukiLogUtil.i(_tag, "_onFinishCall: $reason");
    if (_isCallFinished) return;
    _isCallFinished = true;

    await _rtcService.release();
  }

  // void _onSettlementCall(KekokukiCallSettlementModel data) {
  //   KekokukiLogUtil.i(_tag, "_onSettlementCall ${data.toJson()}");
  //   if (isCallEnd) return;
  //   isCallEnd = true;

  //   Get.until((route) => route.settings.name == KekokukiRoutes.callCalling);
  //   Get.offAndToNamed(
  //     KekokukiRoutes.callFinished,
  //     arguments: {
  //       'call_model': state.callModel,
  //       'call_type': state.callType,
  //       'settlement_model': data,
  //     },
  //   );
  // }

  bool _isExit = false;
  Future<void> _forceToExit() async {
    KekokukiLogUtil.i(_tag, "_forceToExit");
    if (_isExit) return;
    _isExit = true;

    await _rtcService.release();
    Get.until((route) => route.settings.name == KekokukiRoutes.callCalling);
    Get.back();
  }

  Future<void> _onAnchorOffline() async {
    KekokukiLogUtil.w(_tag, "_onRemoteUserLeave");
    await _rtcService.release();
  }

  Future<void> _onDisconnected() async {
    KekokukiLogUtil.w(_tag, "_onDisconnected");
    await _rtcService.release();
  }

  Future<void> _onTokenWillExpire() async {
    KekokukiLogUtil.w(_tag, "_onTokenWillExpire");
    await _renewRtcToken();
  }

  Future<void> _renewRtcToken() async {
    final channelId = state.callModel.channelModel?.channelId ?? 0;
    final response = await _apiClient.refreshCall('$channelId').response;
    if (response.isSuccess && response.data != null) {
      _rtcService.renewToken(response.data!);
    }
  }

  // void _onRemoteCameraStateUpdate(bool enable) {
  //   _isRemoteCameraEnable = enable;
  //   if (enable) {
  //     final remoteWidget = _remotePreviewWidget;
  //     if (remoteWidget == null) return;
  //     _remoteController.add(remoteWidget);
  //   } else {
  //     final isRemoteFullPreview = state.isLocalSmallPreviewObs.value;
  //     final widget = KekokukiCallingPlaceholder(
  //       avatar: state.callModel.anchor.portrait,
  //       fullScreen: isRemoteFullPreview,
  //     );
  //     _remoteController.add(widget);
  //   }
  // }

  void _AivCallHangup(int playDuration) async {
    // KekokukiLoadingUtil.show();
    // await KekokukiCallInvitationManager.instance.apiAivCallHangup(
    //   callModel: state.callModel,
    //   callType: state.callType,
    //   isPlayFinished: state.isAivPlayFinished,
    // );
    // KekokukiLoadingUtil.dismiss();

    // final model = KekokukiCallSettlementModel.fromJson({
    //   'conversation_time': playDuration,
    //   'anchor_id': state.callModel.anchorId,
    //   'avatar': state.callModel.anchorAvatar,
    //   'nickname': state.callModel.anchorNickname,
    //   'gift': '0',
    //   'diamonds': '0',
    // });
    // _onSettlementCall(model);
    Get.until((route) => route.settings.name == KekokukiRoutes.callCalling);
    Get.back();
  }

  void onAivPlayProgress(int position) {
    // _callingSeconds = position;
    // state.callingDurationObs.value = KekokukiFormatUtil.durationToTime(
    //   _callingSeconds,
    //   isShowHour: false,
    // );
    KekokukiLogUtil.i(_tag, 'Aiv play position: $position');
  }

  void onAivPlayEnd(int duration) {
    _onFinishCall('Play end');
    _AivCallHangup(duration);
  }

  void onAivPlayFailed(Object error) {
    KekokukiLogUtil.i(_tag, "play Aiv video failed ${error.toString()}");
    Future.delayed(const Duration(seconds: 1), () {
      _forceToExit();
      KekokukiLoadingUtil.showToast('kekokuki_no_network'.tr);
    });
  }

  void onTapClose() async {
    bool? confirm = await KekokukiDialogUtil.showDialog(
      KekokukiConfirmDialog(content: 'kekokuki_call_hangup_tips'.tr),
    );
    if (confirm == true) {
      if (state.callModel.callType == KekokukiCallType.aiv) {
        _onFinishCall('DialogExit');
        _AivCallHangup(_callingSeconds);
      } else {
        // KekokukiLoadingUtil.show();
        // final result = await KekokukiCallInvitationManager.instance.apiCallSettlement(
        //   callModel: state.callModel,
        //   callType: state.callType,
        // );
        // KekokukiLoadingUtil.dismiss();
        // if (result.isSuccess) {
        //   _onFinishCall('DialogExit');
        // } else {
        //   KekokukiLoadingUtil.showToast(result.msg);
        //   _forceToExit();
        // }
        _onFinishCall('DialogExit');
        Get.until((route) => route.settings.name == KekokukiRoutes.callCalling);
        Get.back();
      }
    }
  }

  void onTapSwitchCamera() {
    KekokukiLogUtil.i(_tag, "onTapSwitchCamera");
    _rtcService.switchCamera();
  }

  // void onTapCamera() async {
  //   KekokukiLogUtil.i(_tag, "onTapCamera");
  //   final isStarCamera = !state.isStartCameraObs.value;
  //   if (isStarCamera) {
  //     await _rtcService.startPreview();
  //     _localPreviewWidget = _rtcService.createLocalVideoWidget();
  //     _rtcService.mutePublishStreamVideo(false);
  //   } else {
  //     await _rtcService.stopPreview();
  //     _rtcService.mutePublishStreamVideo(true);
  //     _localPreviewWidget = KekokukiCallingPlaceholder(
  //       avatar: state.profileObs.value.portrait,
  //       isSelf: true,
  //       fullScreen: !state.isLocalSmallPreview,
  //     );
  //   }
  //   final localWidget = _localPreviewWidget;
  //   if (localWidget != null) {
  //     _localController.add(localWidget);
  //   }
  //   state.isStartCameraObs.value = isStarCamera;
  // }

  void onTapVoice() async {
    KekokukiLogUtil.i(_tag, "onTapVoice");
    final isVoiceEnable = !state.isVoiceEnableObs.value;
    // KekokukiCallEngineManager.instance.muteMicrophone(!isVoiceEnable);
    state.isVoiceEnableObs.value = isVoiceEnable;
  }

  void onTapSpeaker() async {
    KekokukiLogUtil.i(_tag, "onTapSpeaker");
    final isSpeaker = !state.isSpeakerObs.value;
    // KekokukiCallEngineManager.instance.muteSpeaker(!isSpeaker);
    state.isSpeakerObs.value = isSpeaker;
  }

  void onTapTopup() {
    KekokukiLogUtil.i(_tag, "onTapTopup");
    // KekokukiDialogUtil.showDialog(
    //   const KekokukiQuickRechargeDialog(isBalanceInsufficient: false),
    // );
  }

  void onTapGift() {
    KekokukiLogUtil.i(_tag, "onTapGift");
    // final sessionId = 'hichat_anchor_${state.callModel.anchorId}';
    // Get.bottomSheet(
    //   KekokukiGiftDialog(
    //     isCalling: true,
    //     anchorId: state.callModel.anchorId,
    //     sessionId: sessionId,
    //     conversationId: state.callModel.conversationId.toString(),
    //   ),
    // );
  }

  void onTapSmallPreview() {
    KekokukiLogUtil.i(_tag, "onTapSmallPreview");
    state.isLocalSmallPreview = !state.isLocalSmallPreview;
    final isRemoteFullScreen = state.isLocalSmallPreview;

    final isLocalCameraEnable = state.isStartCameraObs.value;
    final localPlaceholder = KekokukiCallingPlaceholder(
      avatar: state.profileObs.value.portrait,
      isSelf: true,
      fullScreen: !isRemoteFullScreen,
    );
    final remotePlaceholder = KekokukiCallingPlaceholder(
      avatar: state.callModel.anchor.portrait,
      isSelf: false,
      fullScreen: isRemoteFullScreen,
    );
    var localWidget = isLocalCameraEnable ? _localPreviewWidget : localPlaceholder;
    localWidget ??= localPlaceholder;
    var remoteWidget = _isRemoteCameraEnable ? _remotePreviewWidget : remotePlaceholder;
    remoteWidget ??= remotePlaceholder;
    _localController.add(localWidget);
    _remoteController.add(remoteWidget);
  }

  void updateOffsets(Offset offset) {
    state.smallScreenEnd.value = max(min(state.smallScreenEnd.value - offset.dx, Get.width - state.smallScreenWidth), 0);
    state.smallScreenTop.value = max(min(state.smallScreenTop.value + offset.dy, Get.height - state.smallScreenHeight), 0);
  }
}
