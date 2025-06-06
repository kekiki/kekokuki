// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_rtm_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiRtmMessageModel _$KekokukiRtmMessageModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiRtmMessageModel(
      data: json['data'] as String?,
      extra: json['extra'] as String?,
      messageType: $enumDecodeNullable(
          _$KekokukiMessageTypeEnumMap, json['messageType']),
      mid: json['mid'] as String?,
      timestamp: (json['timestamp'] as num?)?.toInt(),
      userInfo: json['userInfo'] == null
          ? null
          : KekokukiRtmMessageUserInfo.fromJson(
              json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KekokukiRtmMessageModelToJson(
        KekokukiRtmMessageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
      'messageType': _$KekokukiMessageTypeEnumMap[instance.messageType],
      'mid': instance.mid,
      'timestamp': instance.timestamp,
      'userInfo': instance.userInfo?.toJson(),
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

KekokukiRtmMessageUserInfo _$KekokukiRtmMessageUserInfoFromJson(
        Map<String, dynamic> json) =>
    KekokukiRtmMessageUserInfo(
      isOnline: (json['isOnline'] as num?)?.toInt(),
      nickname: json['nickname'] as String?,
      portrait: json['portrait'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      level: (json['level'] as num?)?.toInt(),
      vipFlag: json['vipFlag'] as bool?,
    );

Map<String, dynamic> _$KekokukiRtmMessageUserInfoToJson(
        KekokukiRtmMessageUserInfo instance) =>
    <String, dynamic>{
      'isOnline': instance.isOnline,
      'nickname': instance.nickname,
      'portrait': instance.portrait,
      'userId': instance.userId,
      'name': instance.name,
      'uid': instance.uid,
      'level': instance.level,
      'vipFlag': instance.vipFlag,
    };
