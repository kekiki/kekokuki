// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_vip_sign_in_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiVipSignInConfigModel _$KekokukiVipSignInConfigModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiVipSignInConfigModel(
      (json['configs'] as List<dynamic>?)
          ?.map((e) => KekokukiVipSignInConfigModelConfigs.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['signInFlag'] as num?,
    );

Map<String, dynamic> _$KekokukiVipSignInConfigModelToJson(
        KekokukiVipSignInConfigModel instance) =>
    <String, dynamic>{
      'configs': instance.configs,
      'signInFlag': instance.signInFlag,
    };

KekokukiVipSignInConfigModelConfigs
    _$KekokukiVipSignInConfigModelConfigsFromJson(Map<String, dynamic> json) =>
        KekokukiVipSignInConfigModelConfigs(
          json['configType'],
          json['id'],
          json['num'],
        );

Map<String, dynamic> _$KekokukiVipSignInConfigModelConfigsToJson(
        KekokukiVipSignInConfigModelConfigs instance) =>
    <String, dynamic>{
      'configType': instance.configType,
      'id': instance.id,
      'num': instance.num,
    };
