// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_anchor_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiAnchorAreaModel _$KekokukiAnchorAreaModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiAnchorAreaModel(
      areaCode: (json['areaCode'] as num?)?.toInt() ?? 0,
      iconUrl: json['path'] as String? ?? '',
      title: json['title'] as String? ?? '',
      anchorCount: (json['anchorCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukiAnchorAreaModelToJson(
        KekokukiAnchorAreaModel instance) =>
    <String, dynamic>{
      'areaCode': instance.areaCode,
      'path': instance.iconUrl,
      'title': instance.title,
      'anchorCount': instance.anchorCount,
    };
