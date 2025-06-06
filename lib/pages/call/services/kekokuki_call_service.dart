import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:kekokuki/pages/call/going/kekokuki_call_going_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/utils/kekokuki_log_util.dart';
import '../../../services/rtm&rtc/kekokuki_rtc_service.dart';
import '../../../services/rtm&rtc/kekokuki_rtm_service.dart';
import '../../chat/message/kekokuki_chat_message_model.dart';
import '../../widgets/dialogs/permission/kekokuki_permission_dialog.dart';
import 'kekokuki_call_model.dart';

class KekokukiCallInvitationHandle {
  final void Function(int)? onAnchorReceivedInvitation;
  final void Function(int)? onAnchorAcceptedInvitation;
  final void Function(int)? onAnchorRefusededInvitation;

  const KekokukiCallInvitationHandle({
    this.onAnchorReceivedInvitation,
    this.onAnchorAcceptedInvitation,
    this.onAnchorRefusededInvitation,
  });
}

class KekokukiCallService extends GetxService {
  static const _tag = "CallService";

  final _rtmService = Get.find<KekokukiRtmService>();
  final _rtcService = Get.find<KekokukiRtcService>();

  final StreamController<KekokukiCallStatus> _streamController = StreamController.broadcast();
  Stream<KekokukiCallStatus> get callStatusStream => _streamController.stream;
  KekokukiCallStatus _callStatus = KekokukiCallStatus.none;

  Future<KekokukiCallService> init() async {
    Get.find<KekokukiRtmService>()
      ..onReceivedMessageInCall = _onReceivedMessage
      ..onReceivedCallInvitation = _onReceivedCallInvitation;
    return this;
  }

  Future<void> release() async {
    await _rtcService.release();
  }

  @override
  void onClose() {
    _callStatus = KekokukiCallStatus.none;
    _streamController.close();
    super.onClose();
  }

  void _onReceivedMessage(int anchorId, String message) {}

  void _onReceivedCallInvitation(int anchorId, String channelId) {
    _updateCallStatus(KekokukiCallStatus.comming);
  }

  void _updateCallStatus(KekokukiCallStatus status) {
    _callStatus = status;
    _streamController.add(status);
  }

  Future<void> sendCallInvitation({
    required int anchorId,
    required String channelId,
    required KekokukiCallType callType,
    bool matchPrivacyMode = false,
    KekokukiCallInvitationHandle? handle,
  }) async {
    _rtmService.onAnchorReceivedInvitation = handle?.onAnchorReceivedInvitation;
    _rtmService.onAnchorAcceptedInvitation = handle?.onAnchorAcceptedInvitation;
    _rtmService.onAnchorRefusededInvitation = handle?.onAnchorRefusededInvitation;
    _rtmService.sendLocalInvitation(anchorId: anchorId, channelId: channelId, callType: callType, matchPrivacyMode: matchPrivacyMode);
  }

  Future<void> cancelCallInvitation({required int anchorId}) async {
    _rtmService.cancelLocalInvitation();
  }

  /// 发送开启或关闭隐私模式消息
  Future<void> sendPrivacyModeChange({required int anchorId, required int channelId, required bool isPrivacyOn}) async {
    final content = json.encode({'callChannelId': '$channelId', 'isOpen': isPrivacyOn});
    await _rtmService.sendRtmMessage(anchorId, KekokukiMessageType.privacyCall, content);
  }
}
