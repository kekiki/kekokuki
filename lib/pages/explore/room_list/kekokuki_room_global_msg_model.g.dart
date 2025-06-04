// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_room_global_msg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiRoomGlobalMsgModel _$KekokukiRoomGlobalMsgModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiRoomGlobalMsgModel(
      json['content'] as String?,
      json['diamonds'] as num?,
      json['gameMode'] as num?,
      json['nickname'] as String?,
      json['portrait'] as String?,
      json['rid'] as num?,
      json['roomBgImg'] as String?,
      json['roomTitle'] as String?,
    );

Map<String, dynamic> _$KekokukiRoomGlobalMsgModelToJson(
        KekokukiRoomGlobalMsgModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'diamonds': instance.diamonds,
      'gameMode': instance.gameMode,
      'nickname': instance.nickname,
      'portrait': instance.portrait,
      'rid': instance.rid,
      'roomBgImg': instance.roomBgImg,
      'roomTitle': instance.roomTitle,
    };
