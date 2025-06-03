// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiChatMessageModel _$KekokukiChatMessageModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiChatMessageModel(
      id: json['id'] as String,
      messageType:
          $enumDecode(_$KekokukiMessageTypeEnumMap, json['messageType']),
      status: $enumDecode(_$KekokukiMessageStatusEnumMap, json['status']),
      isSelfSent: json['isSelfSent'] as bool? ?? false,
      timestamp: (json['timestamp'] as num).toInt(),
      anchorId: (json['anchorId'] as num).toInt(),
      portrait: json['portrait'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      isShowTime: json['isShowTime'] as bool? ?? false,
      jsonData: json['jsonData'] as String,
    );

Map<String, dynamic> _$KekokukiChatMessageModelToJson(
        KekokukiChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'anchorId': instance.anchorId,
      'portrait': instance.portrait,
      'nickname': instance.nickname,
      'messageType': _$KekokukiMessageTypeEnumMap[instance.messageType]!,
      'status': _$KekokukiMessageStatusEnumMap[instance.status]!,
      'isSelfSent': instance.isSelfSent,
      'timestamp': instance.timestamp,
      'isShowTime': instance.isShowTime,
      'jsonData': instance.jsonData,
    };

const _$KekokukiMessageTypeEnumMap = {
  KekokukiMessageType.text: 11,
  KekokukiMessageType.image: 12,
  KekokukiMessageType.imageCharge: 13,
  KekokukiMessageType.video: 14,
  KekokukiMessageType.audioVoice: 15,
  KekokukiMessageType.call: 16,
  KekokukiMessageType.gift: 171,
  KekokukiMessageType.receiveGift: 17,
  KekokukiMessageType.followRequest: 18,
  KekokukiMessageType.chatScript: 19,
  KekokukiMessageType.rateApp: 20,
  KekokukiMessageType.balanceChanged: 21,
  KekokukiMessageType.propChanged: 22,
  KekokukiMessageType.callMessage: 23,
  KekokukiMessageType.seeMeHome: 24,
  KekokukiMessageType.newUserGifts: 25,
  KekokukiMessageType.videoCharge: 26,
  KekokukiMessageType.followRequestAgree: 27,
  KekokukiMessageType.anchorOnline: 28,
  KekokukiMessageType.chatEmoji: 29,
  KekokukiMessageType.orderChanged: 31,
  KekokukiMessageType.askGiftInChat: 32,
  KekokukiMessageType.askGiftInCall: 33,
  KekokukiMessageType.askRechargeInChat: 34,
  KekokukiMessageType.momentImgInChat: 38,
  KekokukiMessageType.momentNotice: 39,
  KekokukiMessageType.beginCall: 41,
  KekokukiMessageType.callFailed: 42,
  KekokukiMessageType.callEnd: 43,
  KekokukiMessageType.feedback: 44,
  KekokukiMessageType.authFailed: 45,
  KekokukiMessageType.banByServer: 46,
  KekokukiMessageType.userLevelChanged: 47,
  KekokukiMessageType.privacyCall: 48,
  KekokukiMessageType.callChangeVideoQuality: 51,
  KekokukiMessageType.roomUserNumChanged: 52,
  KekokukiMessageType.roomTopChanged: 53,
  KekokukiMessageType.roomWinBigReward: 54,
  KekokukiMessageType.roomChatMessage: 55,
  KekokukiMessageType.likedMessage: 56,
  KekokukiMessageType.advanceUser: 57,
  KekokukiMessageType.heartbeatLevelChanged: 58,
  KekokukiMessageType.readImMessage: 60,
  KekokukiMessageType.giveBackChatCost: 62,
};

const _$KekokukiMessageStatusEnumMap = {
  KekokukiMessageStatus.sending: 1,
  KekokukiMessageStatus.sendSuccess: 2,
  KekokukiMessageStatus.sendFailed: 3,
  KekokukiMessageStatus.readed: 4,
  KekokukiMessageStatus.unread: 5,
};

KekokukiChatMessageImageModel _$KekokukiChatMessageImageModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiChatMessageImageModel(
      json['imageUrl'] as String? ?? '',
      json['mid'] as num? ?? 0,
      (json['unlockFlag'] as num?)?.toInt() ?? 0,
      json['unlockId'] as String? ?? '',
    );

Map<String, dynamic> _$KekokukiChatMessageImageModelToJson(
        KekokukiChatMessageImageModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'mid': instance.mid,
      'unlockFlag': instance.unlockFlag,
      'unlockId': instance.unlockId,
    };

KekokukiChatMessageVideoModel _$KekokukiChatMessageVideoModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiChatMessageVideoModel(
      json['coverUrl'] as String? ?? '',
      json['mid'] as num? ?? 0,
      (json['unlockFlag'] as num?)?.toInt() ?? 0,
      json['unlockId'] as String? ?? '',
      (json['videoSeconds'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$KekokukiChatMessageVideoModelToJson(
        KekokukiChatMessageVideoModel instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'mid': instance.mid,
      'unlockFlag': instance.unlockFlag,
      'unlockId': instance.unlockId,
      'videoSeconds': instance.videoSeconds,
    };
