// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_gift_rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiGiftRankModel _$KekokukiGiftRankModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiGiftRankModel(
      json['diamonds'] as num?,
      json['gid'] as num?,
      json['icon'] as String?,
      json['quantity'] as num?,
      json['receiverId'] as num?,
      json['receiverNickname'] as String?,
      json['receiverPortrait'] as String?,
      json['recordId'] as num?,
      json['senderId'] as num?,
      json['senderNickname'] as String?,
      json['senderPortrait'] as String?,
      json['time'] as num?,
    );

Map<String, dynamic> _$KekokukiGiftRankModelToJson(
        KekokukiGiftRankModel instance) =>
    <String, dynamic>{
      'diamonds': instance.diamonds,
      'gid': instance.gid,
      'icon': instance.icon,
      'quantity': instance.quantity,
      'receiverId': instance.receiverId,
      'receiverNickname': instance.receiverNickname,
      'receiverPortrait': instance.receiverPortrait,
      'recordId': instance.recordId,
      'senderId': instance.senderId,
      'senderNickname': instance.senderNickname,
      'senderPortrait': instance.senderPortrait,
      'time': instance.time,
    };
