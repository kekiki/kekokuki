// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_ai_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiAiConfigModel _$KekokukiAiConfigModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiAiConfigModel(
      json['aivDailyLimit'] as num?,
      json['aivSwitch'] as num?,
      json['aivTotalLimit'] as num?,
      json['configType'] as num?,
      json['idleDelay'] as num?,
      json['idleReset'] as num?,
      json['minDelay'] as num?,
      json['refuseLimit'] as num?,
      json['refuseReset'] as num?,
      json['refuseUnit'] as num?,
      json['scanDelay'] as num?,
      json['scanLimit'] as num?,
      json['scanReset'] as num?,
      json['scanStay'] as num?,
      json['slideLimit'] as num?,
      json['slideUnit'] as num?,
      json['typeDelay'] as num?,
    );

Map<String, dynamic> _$KekokukiAiConfigModelToJson(
        KekokukiAiConfigModel instance) =>
    <String, dynamic>{
      'aivDailyLimit': instance.aivDailyLimit,
      'aivSwitch': instance.aivSwitch,
      'aivTotalLimit': instance.aivTotalLimit,
      'configType': instance.configType,
      'idleDelay': instance.idleDelay,
      'idleReset': instance.idleReset,
      'minDelay': instance.minDelay,
      'refuseLimit': instance.refuseLimit,
      'refuseReset': instance.refuseReset,
      'refuseUnit': instance.refuseUnit,
      'scanDelay': instance.scanDelay,
      'scanLimit': instance.scanLimit,
      'scanReset': instance.scanReset,
      'scanStay': instance.scanStay,
      'slideLimit': instance.slideLimit,
      'slideUnit': instance.slideUnit,
      'typeDelay': instance.typeDelay,
    };
