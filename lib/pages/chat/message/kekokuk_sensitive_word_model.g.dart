// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuk_sensitive_word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukSensitiveWordModel _$KekokukSensitiveWordModelFromJson(
        Map<String, dynamic> json) =>
    KekokukSensitiveWordModel(
      json['id'] as num?,
      json['mode'] as num?,
      json['type'] as num?,
      json['words'] as String?,
      json['wordsStop'] as String?,
    );

Map<String, dynamic> _$KekokukSensitiveWordModelToJson(
        KekokukSensitiveWordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': instance.mode,
      'type': instance.type,
      'words': instance.words,
      'wordsStop': instance.wordsStop,
    };
