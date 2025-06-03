// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_login_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiLoginRecordModel _$KekokukiLoginRecordModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiLoginRecordModel(
      type: $enumDecodeNullable(_$KekokukiLoginTypeEnumMap, json['type']) ??
          KekokukiLoginType.fast,
      account: json['account'] as String? ?? '',
      password: json['password'] as String? ?? '',
      googleOpenId: json['id'] as String? ?? '',
      googleToken: json['googleToken'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$KekokukiLoginRecordModelToJson(
        KekokukiLoginRecordModel instance) =>
    <String, dynamic>{
      'account': instance.account,
      'password': instance.password,
      'id': instance.googleOpenId,
      'googleToken': instance.googleToken,
      'cover': instance.cover,
      'nickname': instance.nickname,
      'email': instance.email,
      'type': _$KekokukiLoginTypeEnumMap[instance.type]!,
    };

const _$KekokukiLoginTypeEnumMap = {
  KekokukiLoginType.fast: 1,
  KekokukiLoginType.password: 2,
  KekokukiLoginType.google: 3,
};
