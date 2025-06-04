// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuk_level_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukLevelConfigModel _$KekokukLevelConfigModelFromJson(
        Map<String, dynamic> json) =>
    KekokukLevelConfigModel(
      (json['configs'] as List<dynamic>?)
          ?.map((e) => KekokukLevelConfigModelConfigs.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['total'] as num?,
    );

Map<String, dynamic> _$KekokukLevelConfigModelToJson(
        KekokukLevelConfigModel instance) =>
    <String, dynamic>{
      'configs': instance.configs,
      'total': instance.total,
    };

KekokukLevelConfigModelConfigs _$KekokukLevelConfigModelConfigsFromJson(
        Map<String, dynamic> json) =>
    KekokukLevelConfigModelConfigs(
      json['avatarFrame'] as String?,
      json['begin'] as num?,
      json['end'] as num?,
      json['icon'] as String?,
      json['level'] as num?,
      json['userIcon'] as String?,
    );

Map<String, dynamic> _$KekokukLevelConfigModelConfigsToJson(
        KekokukLevelConfigModelConfigs instance) =>
    <String, dynamic>{
      'avatarFrame': instance.avatarFrame,
      'begin': instance.begin,
      'end': instance.end,
      'icon': instance.icon,
      'level': instance.level,
      'userIcon': instance.userIcon,
    };
