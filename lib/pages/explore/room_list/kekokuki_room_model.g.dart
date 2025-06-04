// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiRoomModel _$KekokukiRoomModelFromJson(Map<String, dynamic> json) =>
    KekokukiRoomModel(
      json['anchorId'] as num?,
      json['content'] as String?,
      json['gameIcon'] as String?,
      json['gameMode'] as num?,
      json['gameUnique'] as String?,
      json['nickName'] as String?,
      json['rid'] as num?,
      json['roomBgImg'] as String?,
      json['title'] as String?,
      json['userTotal'] as num?,
    );

Map<String, dynamic> _$KekokukiRoomModelToJson(KekokukiRoomModel instance) =>
    <String, dynamic>{
      'anchorId': instance.anchorId,
      'content': instance.content,
      'gameIcon': instance.gameIcon,
      'gameMode': instance.gameMode,
      'gameUnique': instance.gameUnique,
      'nickName': instance.nickName,
      'rid': instance.rid,
      'roomBgImg': instance.roomBgImg,
      'title': instance.title,
      'userTotal': instance.userTotal,
    };
