// RTM 2.2.2 不支持呼叫，需要自己实现
// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:agora_rtm/agora_rtm.dart';
// import 'package:kekokuki/services/config/kekokuki_log_util.dart';
// import 'package:kekokuki/services/api/kekokuki_api_client.dart';
// import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
// import 'package:kekokuki/services/config/kekokuki_config_service.dart';

// import '../../pages/call/kekokuki_call_service.dart';
// import '../../pages/chat/message/kekokuki_chat_message_model.dart';
// import '../../pages/chat/services/kekokuki_chat_service.dart';
// import '../profile/kekokuki_profile_service.dart';
// import 'kekokuki_rtm_message_model.dart';

// class KekokukiRtmService extends GetxService {
//   final _tag = 'RtmService';

//   final _apiClient = Get.find<KekokukiApiClient>();
//   final _configService = Get.find<KekokukiConfigService>();
//   final _profileService = Get.find<KekokukiProfileService>();

//   RtmClient? _rtmClient;
//   String? _rtmToken;
//   LinkStateEvent? _rtmStateEvent;

//   Future<KekokukiRtmService> init() async {
//     return this;
//   }

//   Future<void> connect() async {
//     await _initRtmClient();
//     await _rtmLogin();
//   }

//   Future<void> disConnect() async {
//     await _rtmLogout();
//     await _rtmRelease();
//   }

//   Future<void> reconnectIfNeeded() async {
//     if (_rtmStateEvent?.currentState != RtmLinkState.connecting || _rtmStateEvent?.currentState != RtmLinkState.connected) {
//       await disConnect();
//       await connect();
//     }
//   }

//   @override
//   void onClose() {
//     disConnect();
//     super.onClose();
//   }

//   Future<void> _initRtmClient() async {
//     try {
//       final appId = _configService.configModel.agoraAppId;
//       final userId = _profileService.profileModel.userId;
//       final (status, client) = await RTM(appId, userId.toString());
//       if (status.error) {
//         KekokukiLogUtil.e(_tag, 'RTM init failed: ${status.error}');
//       } else {
//         _rtmClient = client;

//         // add events listner
//         _rtmClient?.addListener(message: _onMessageEvent, linkState: _onLinkStateEvent, token: _onTokenEvent);
//         KekokukiLogUtil.i(_tag, 'RTM init success!');
//       }
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, 'RTM init failed: ${e.toString()}', s);
//     }
//   }

//   Future<void> _rtmLogin() async {
//     try {
//       if (_rtmClient == null) return;
//       final token = await _fetchRtmToken();
//       if (token == null) {
//         KekokukiLogUtil.e(_tag, 'RTM token is null, cannot login');
//         return;
//       }
//       var (status, _) = await _rtmClient!.login(token);
//       if (status.error) {
//         KekokukiLogUtil.e(_tag, 'RTM login failed: ${status.reason}, error code: ${status.errorCode}');
//       } else {
//         KekokukiLogUtil.i(_tag, "RTM login success");
//       }
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, "RTM login failed: ${e.toString()}", s);
//     }
//   }

//   Future<void> _rtmLogout() async {
//     try {
//       _rtmToken = null;
//       if (_rtmClient == null) return;
//       var (status, _) = await _rtmClient!.logout();
//       if (status.error) {
//         KekokukiLogUtil.e(_tag, 'RTM logout failed: ${status.reason}, error code: ${status.errorCode}');
//       } else {
//         KekokukiLogUtil.i(_tag, "RTM logout success");
//       }
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, "RTM logout failed: ${e.toString()}", s);
//     }
//   }

//   Future<void> _rtmRelease() async {
//     try {
//       if (_rtmClient == null) return;
//       final status = await _rtmClient!.release();
//       if (status.error) {
//         KekokukiLogUtil.e(_tag, 'RTM release failed: ${status.reason}, error code: ${status.errorCode}');
//       } else {
//         KekokukiLogUtil.i(_tag, "RTM release success");
//       }
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, "RTM release failed: ${e.toString()}", s);
//     }
//   }

//   void _onMessageEvent(MessageEvent event) {
//     try {
//       if (event.messageLength == 0) {
//         KekokukiLogUtil.w(_tag, 'Received empty message: ${event.toJson()}');
//         return;
//       }
//       final jsonMessage = utf8.decode(event.message!, allowMalformed: true);
//       KekokukiLogUtil.i(_tag, '[Received message]: $jsonMessage');

//       final message = KekokukiRtmMessageModel.fromJson(json.decode(jsonMessage));
//       _receivedRtmMessage(message);
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, "RTM decode message failed: ${e.toString()}", s);
//     }
//   }

//   void _onLinkStateEvent(LinkStateEvent event) {
//     KekokukiLogUtil.i(_tag, 'Link state changed from ${event.previousState} to ${event.currentState}');
//     _rtmStateEvent = event;
//   }

//   void _onTokenEvent(TokenEvent event) async {
//     KekokukiLogUtil.i(_tag, 'Token will expire');

//     final token = await _fetchRtmToken();
//     if (token != null) {
//       _renewRtmToken(token);
//     }
//   }

//   Future<void> _renewRtmToken(String token) async {
//     try {
//       if (_rtmClient == null) return;
//       var (status, _) = await _rtmClient!.renewToken(token);
//       if (status.error) {
//         KekokukiLogUtil.e(_tag, 'RTM renew token failed: ${status.reason}, error code: ${status.errorCode}');
//       } else {
//         KekokukiLogUtil.i(_tag, "RTM renew token success");
//       }
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, "RTM renew token failed: ${e.toString()}", s);
//     }
//   }

//   Future<String?> _fetchRtmToken() async {
//     if (_rtmToken != null) return _rtmToken;
//     final response = await _apiClient.fetchRtmToken().retry(maxCount: 1);
//     _rtmToken = response.data;
//     return _rtmToken;
//   }

//   Future<void> _postHeartbeat() async {
//     // final status = _connectionState == RtmConnectionState.connected ? 1 : 0;
//     // final response = await _apiClient.postHeartbeat(status).response;
//     // return response.data;
//   }

//   Future<void> sendRtmMessage(int peerId, KekokukiMessageType type, String? data) async {
//     try {
//       if (_rtmClient == null) return;
//       final profile = _profileService.profileModel;
//       final userInfo = KekokukiRtmMessageUserInfo(isOnline: 1, nickname: profile.nickname, portrait: profile.portrait, userId: profile.userId);
//       final timestamp = DateTime.now().millisecondsSinceEpoch;
//       final mid = '${timestamp}_${profile.userId}_${type.value}';
//       final message = KekokukiRtmMessageModel(data: data, messageType: type, mid: mid, timestamp: timestamp, userInfo: userInfo);
//       final (status, _) = await _rtmClient!.publish('$peerId', json.encode(message.toJson()), channelType: RtmChannelType.user);
//       if (status.error) {
//         KekokukiLogUtil.e(_tag, "RTM send message failed, errorCode: ${status.errorCode}, reason: ${status.reason}");
//       } else {
//         KekokukiLogUtil.i(_tag, "RTM send message success: $message");
//       }
//     } catch (e, s) {
//       KekokukiLogUtil.e(_tag, "RTM send message failed: ${e.toString()}", s);
//     }
//   }

//   Future<void> _receivedRtmMessage(KekokukiRtmMessageModel message) async {
//     switch (message.messageType) {
//       case KekokukiMessageType.text:
//       case KekokukiMessageType.image:
//       case KekokukiMessageType.imageCharge:
//       case KekokukiMessageType.videoCharge:
//       case KekokukiMessageType.video:
//       case KekokukiMessageType.gift:
//       case KekokukiMessageType.chatScript:
//       case KekokukiMessageType.askGiftInChat: // 私聊中收到索要礼物请求
//       case KekokukiMessageType.askRechargeInChat: // 私聊中收到充值请求
//       case KekokukiMessageType.momentImgInChat: // 私聊中收到的动态请求
//       case KekokukiMessageType.momentNotice: // 私聊中收到动态点赞和评论的通知
//         Get.find<KekokukiChatService>().receivedMessage(KekokukiChatMessageModel(
//           id: message.mid!,
//           messageType: message.messageType!,
//           status: KekokukiMessageStatus.unread,
//           isSelfSent: false,
//           timestamp: message.timestamp!,
//           anchorId: message.userInfo?.senderUserId ?? 0,
//           portrait: message.userInfo?.portrait ?? '',
//           nickname: message.userInfo?.senderNickname ?? '',
//           isShowTime: false,
//           jsonData: message.data ?? '',
//         ));
//         break;

//       case KekokukiMessageType.callMessage:
//         final jsonMap = json.decode(message.data!);
//         Get.find<KekokukiCallService>().receivedMessage(message.userInfo!.senderUserId!, jsonMap['text']);
//         break;

//       default:
//         KekokukiLogUtil.w(_tag, "Received unsupport type message: ${message.toJson()}");
//     }
//   }
// }

import 'dart:convert';

import 'package:get/get.dart';
import 'package:agora_rtm/agora_rtm.dart';
import 'package:kekokuki/pages/call/services/kekokuki_call_model.dart';
import 'package:kekokuki/services/config/kekokuki_log_util.dart';
import 'package:kekokuki/services/api/kekokuki_api_client.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
import 'package:kekokuki/services/config/kekokuki_config_service.dart';

import '../../pages/call/services/kekokuki_call_service.dart';
import '../../pages/chat/message/kekokuki_chat_message_model.dart';
import '../../pages/chat/services/kekokuki_chat_service.dart';
import '../profile/kekokuki_profile_service.dart';
import 'kekokuki_rtm_message_model.dart';

class KekokukiRtmService extends GetxService {
  final _tag = 'RtmService';

  final _apiClient = Get.find<KekokukiApiClient>();
  final _configService = Get.find<KekokukiConfigService>();
  final _profileService = Get.find<KekokukiProfileService>();

  AgoraRtmClient? _rtmClient;
  String? _rtmToken;
  RtmConnectionState _rtmConnectionState = RtmConnectionState.disconnected;

  AgoraRtmCallManager? get _rtmCall => _rtmClient?.getRtmCallManager();
  LocalInvitation? _localInvitation;

  Future<KekokukiRtmService> init() async {
    return this;
  }

  Future<void> connect() async {
    await _initRtmClient();
    await _rtmLogin();
  }

  Future<void> disConnect() async {
    await _rtmLogout();
    await _rtmRelease();
  }

  Future<void> reconnectIfNeeded() async {
    if (_rtmConnectionState != RtmConnectionState.connecting || _rtmConnectionState != RtmConnectionState.connected || _rtmConnectionState != RtmConnectionState.reconnecting) {
      await disConnect();
      await connect();
    }
  }

  @override
  void onClose() {
    disConnect();
    super.onClose();
  }

  Future<void> _initRtmClient() async {
    try {
      final appId = _configService.configModel.agoraAppId;
      _rtmClient = await AgoraRtmClient.createInstance(appId);
      _rtmClient?.onError = (e) => KekokukiLogUtil.e(_tag, 'RTM error: ${e.toString()}');
      _rtmClient?.onConnectionStateChanged2 = _onConnectionStateChanged;
      _rtmClient?.onMessageReceived = _onMessageReceived;
      _rtmClient?.onTokenPrivilegeWillExpire = _onTokenWillExpired;
      _rtmClient?.onTokenExpired = _onTokenExpired;

      _rtmCall?.onError = (e) => KekokukiLogUtil.e(_tag, 'RTM Call error: ${e.toString()}');
      _rtmCall?.onLocalInvitationReceivedByPeer = _onLocalInvitationReceivedByPeer;
      _rtmCall?.onLocalInvitationAccepted = _onLocalInvitationAccepted;
      _rtmCall?.onLocalInvitationRefused = _onLocalInvitationRefused;
      _rtmCall?.onLocalInvitationCanceled = _onLocalInvitationCanceled;
      _rtmCall?.onLocalInvitationFailure = _onLocalInvitationFailure;
      _rtmCall?.onRemoteInvitationReceived = _onRemoteInvitationReceived;
      _rtmCall?.onRemoteInvitationAccepted = _onRemoteInvitationAccepted;
      _rtmCall?.onRemoteInvitationRefused = _onRemoteInvitationRefused;
      _rtmCall?.onRemoteInvitationCanceled = _onRemoteInvitationCanceled;
      _rtmCall?.onRemoteInvitationFailure = _onRemoteInvitationFailure;
      KekokukiLogUtil.i(_tag, "RTM init success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, 'RTM init failed: ${e.toString()}', s);
    }
  }

  Future<void> _rtmLogin() async {
    try {
      final token = await _fetchRtmToken();
      if (token == null) {
        KekokukiLogUtil.e(_tag, 'RTM token is null, cannot login');
        return;
      }
      final userId = _profileService.profileModel.userId;
      await _rtmClient?.login(token, '$userId');
      KekokukiLogUtil.i(_tag, "RTM login success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTM login failed: ${e.toString()}", s);
    }
  }

  Future<void> _rtmLogout() async {
    try {
      _rtmToken = null;
      await _rtmClient?.logout();
      KekokukiLogUtil.i(_tag, "RTM logout success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTM logout failed: ${e.toString()}", s);
    }
  }

  Future<void> _rtmRelease() async {
    try {
      if (_rtmClient == null) return;
      await _rtmClient?.release();
      KekokukiLogUtil.i(_tag, "RTM release success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTM release failed: ${e.toString()}", s);
    }
  }

  void _onMessageReceived(RtmMessage rtmMessage, String peerId) {
    try {
      if (rtmMessage.text.isEmpty) {
        KekokukiLogUtil.w(_tag, 'Received empty message: ${rtmMessage.toJson()}');
        return;
      }
      final jsonMessage = json.decode(rtmMessage.text);
      KekokukiLogUtil.i(_tag, '[Received message]: $jsonMessage');

      final message = KekokukiRtmMessageModel.fromJson(jsonMessage);
      _receivedRtmMessage(message);
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTM decode message failed: ${e.toString()}", s);
    }
  }

  void _onConnectionStateChanged(RtmConnectionState state, RtmConnectionChangeReason reason) {
    KekokukiLogUtil.i(_tag, 'Link state changed: $state, reason: ${reason.toString()}');
    _rtmConnectionState = state;
  }

  Future<void> _onTokenWillExpired() async {
    KekokukiLogUtil.i(_tag, 'Token will expire');
    _rtmToken = null;
    final token = await _fetchRtmToken();
    if (token != null) {
      _renewRtmToken(token);
    }
  }

  Future<void> _onTokenExpired() async {
    KekokukiLogUtil.i(_tag, 'Token expired');
    await _rtmLogout();
    await _rtmLogin();
  }

  Future<void> _renewRtmToken(String token) async {
    try {
      await _rtmClient?.renewToken(token);
      KekokukiLogUtil.i(_tag, "RTM renew token success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTM renew token failed: ${e.toString()}", s);
    }
  }

  Future<String?> _fetchRtmToken() async {
    if (_rtmToken != null) return _rtmToken;
    final response = await _apiClient.fetchRtmToken().retry(maxCount: 1);
    _rtmToken = response.data;
    return _rtmToken;
  }

  Future<void> _postHeartbeat() async {
    // final status = _connectionState == RtmConnectionState.connected ? 1 : 0;
    // final response = await _apiClient.postHeartbeat(status).response;
    // return response.data;
  }

  Future<void> sendRtmMessage(int peerId, KekokukiMessageType type, String? data) async {
    try {
      final profile = _profileService.profileModel;
      final userInfo = KekokukiRtmMessageUserInfo(isOnline: 1, nickname: profile.nickname, portrait: profile.portrait, userId: profile.userId);
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final mid = '${timestamp}_${profile.userId}_${type.value}';
      final message = KekokukiRtmMessageModel(data: data, messageType: type, mid: mid, timestamp: timestamp, userInfo: userInfo);
      await _rtmClient?.sendMessageToPeer2('$peerId', RtmMessage.fromText(json.encode(message.toJson())));
      KekokukiLogUtil.i(_tag, "RTM send message success: ${message.toJson()}");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTM send message failed: ${e.toString()}", s);
    }
  }

  Future<void> _receivedRtmMessage(KekokukiRtmMessageModel message) async {
    switch (message.messageType) {
      case KekokukiMessageType.text:
      case KekokukiMessageType.image:
      case KekokukiMessageType.imageCharge:
      case KekokukiMessageType.videoCharge:
      case KekokukiMessageType.video:
      case KekokukiMessageType.gift:
      case KekokukiMessageType.chatScript:
      case KekokukiMessageType.askGiftInChat: // 私聊中收到索要礼物请求
      case KekokukiMessageType.askRechargeInChat: // 私聊中收到充值请求
      case KekokukiMessageType.momentImgInChat: // 私聊中收到的动态请求
      case KekokukiMessageType.momentNotice: // 私聊中收到动态点赞和评论的通知
        Get.find<KekokukiChatService>().receivedMessage(KekokukiChatMessageModel(
          id: message.mid!,
          messageType: message.messageType!,
          status: KekokukiMessageStatus.unread,
          isSelfSent: false,
          timestamp: message.timestamp!,
          anchorId: message.userInfo?.senderUserId ?? 0,
          portrait: message.userInfo?.portrait ?? '',
          nickname: message.userInfo?.senderNickname ?? '',
          isShowTime: false,
          jsonData: message.data ?? '',
        ));
        break;

      case KekokukiMessageType.callMessage:
        final jsonMap = json.decode(message.data!);
        Get.find<KekokukiCallService>().receivedMessage(message.userInfo!.senderUserId!, jsonMap['text']);
        break;

      default:
        KekokukiLogUtil.w(_tag, "Received unsupport type message: ${message.toJson()}");
    }
  }

  // /////////////////////////////////////////////////////////////////////////////
  // //////////////////////////////// Call
  // /////////////////////////////////////////////////////////////////////////////

  Future<void> _onRemoteInvitationReceived(RemoteInvitation remoteInvitation) async {
    KekokukiLogUtil.i(_tag, "_onRemoteInvitationReceived: ${remoteInvitation.toJson()}");
  }

  Future<void> _onRemoteInvitationAccepted(RemoteInvitation remoteInvitation) async {
    KekokukiLogUtil.i(_tag, "_onRemoteInvitationAccepted: ${remoteInvitation.toJson()}");
  }

  Future<void> _onRemoteInvitationRefused(RemoteInvitation remoteInvitation) async {
    KekokukiLogUtil.i(_tag, "_onRemoteInvitationRefused: ${remoteInvitation.toJson()}");
  }

  Future<void> _onRemoteInvitationCanceled(RemoteInvitation remoteInvitation) async {
    KekokukiLogUtil.i(_tag, "_onRemoteInvitationCanceled: ${remoteInvitation.toJson()}");
  }

  Future<void> _onRemoteInvitationFailure(RemoteInvitation remoteInvitation, int errorCode) async {
    KekokukiLogUtil.i(_tag, "_onRemoteInvitationFailure: ${remoteInvitation.toJson()}, errorCode: $errorCode");
  }

  Future<void> _onLocalInvitationReceivedByPeer(LocalInvitation localInvitation) async {
    KekokukiLogUtil.i(_tag, "_onLocalInvitationReceivedByPeer: ${localInvitation.toJson()}");
  }

  Future<void> _onLocalInvitationAccepted(LocalInvitation localInvitation, String response) async {
    KekokukiLogUtil.i(_tag, "_onLocalInvitationAccepted: ${localInvitation.toJson()}, response: $response");
  }

  Future<void> _onLocalInvitationRefused(LocalInvitation localInvitation, String response) async {
    KekokukiLogUtil.i(_tag, "_onLocalInvitationRefused: ${localInvitation.toJson()}, response: $response");
  }

  Future<void> _onLocalInvitationCanceled(LocalInvitation localInvitation) async {
    KekokukiLogUtil.i(_tag, "_onLocalInvitationCanceled: ${localInvitation.toJson()}");
  }

  Future<void> _onLocalInvitationFailure(LocalInvitation localInvitation, int errorCode) async {
    KekokukiLogUtil.i(_tag, "_onLocalInvitationFailure: ${localInvitation.toJson()}, errorCode: $errorCode");
  }

  Future<bool> sendLocalInvitation({required int anchorId, required int channelId, required KekokukiCallType callType, bool matchPrivacyMode = false}) async {
    try {
      _localInvitation = await _rtmCall?.createLocalInvitation('$anchorId');
      _localInvitation?.channelId = '$channelId';
      _localInvitation?.content = json.encode({'aiType': callType.value, 'matchMode': matchPrivacyMode ? 1 : 0});
      await _rtmCall?.sendLocalInvitation(_localInvitation!);
      return true;
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "sendLocalInvitation failed: ${e.toString()}", s);
      return false;
    }
  }

  Future<bool> cancelLocalInvitation() async {
    if (_localInvitation == null) return false;
    try {
      await _rtmCall?.cancelLocalInvitation(_localInvitation!);
      return true;
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "cancelLocalInvitation failed: ${e.toString()}", s);
      return false;
    }
  }
}
