// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_match_limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiMatchLimitModel _$KekokukiMatchLimitModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiMatchLimitModel(
      json['aivLeftCount'] as num?,
      json['aivLeftSeconds'] as num?,
      json['aivTotalCount'] as num?,
      json['leftCount'] as num?,
      json['leftSeconds'] as num?,
      json['totalCount'] as num?,
    );

Map<String, dynamic> _$KekokukiMatchLimitModelToJson(
        KekokukiMatchLimitModel instance) =>
    <String, dynamic>{
      'aivLeftCount': instance.aivLeftCount,
      'aivLeftSeconds': instance.aivLeftSeconds,
      'aivTotalCount': instance.aivTotalCount,
      'leftCount': instance.leftCount,
      'leftSeconds': instance.leftSeconds,
      'totalCount': instance.totalCount,
    };
