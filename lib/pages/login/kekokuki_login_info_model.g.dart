// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_login_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiLoginInfoModel _$KekokukiLoginInfoModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiLoginInfoModel(
      appChannel: json['appChannel'] as String? ?? '',
      authorization: json['authorization'] as String? ?? '',
      deregisterFlag: (json['deregisterFlag'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$KekokukiLoginInfoModelToJson(
        KekokukiLoginInfoModel instance) =>
    <String, dynamic>{
      'appChannel': instance.appChannel,
      'authorization': instance.authorization,
      'deregisterFlag': instance.deregisterFlag,
      'userId': instance.userId,
      'username': instance.username,
    };
