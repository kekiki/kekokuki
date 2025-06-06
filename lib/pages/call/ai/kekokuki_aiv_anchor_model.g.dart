// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_aiv_anchor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiAivAnchorModel _$KekokukiAivAnchorModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiAivAnchorModel(
      anchorId: (json['anchorUserId'] as num?)?.toInt() ?? 0,
      videoId: (json['videoId'] as num?)?.toInt() ?? 0,
      videoUrl: json['videoUrl'] as String? ?? '',
      voiceFlag: (json['voiceFlag'] as num?)?.toInt() ?? 0,
      isFree: (json['isFree'] as num?)?.toInt() ?? 0,
      callable: (json['callable'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukiAivAnchorModelToJson(
        KekokukiAivAnchorModel instance) =>
    <String, dynamic>{
      'anchorUserId': instance.anchorId,
      'videoId': instance.videoId,
      'videoUrl': instance.videoUrl,
      'voiceFlag': instance.voiceFlag,
      'isFree': instance.isFree,
      'callable': instance.callable,
    };
