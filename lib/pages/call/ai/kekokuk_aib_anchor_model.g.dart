// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuk_aib_anchor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukAibAnchorModel _$KekokukAibAnchorModelFromJson(
        Map<String, dynamic> json) =>
    KekokukAibAnchorModel(
      (json['anchorUserId'] as num?)?.toInt() ?? 0,
      (json['continueAiv'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukAibAnchorModelToJson(
        KekokukAibAnchorModel instance) =>
    <String, dynamic>{
      'anchorUserId': instance.anchorId,
      'continueAiv': instance.continueAiv,
    };
