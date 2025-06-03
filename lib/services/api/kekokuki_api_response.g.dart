// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiApiResponse<T> _$KekokukiApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    KekokukiApiResponse<T>(
      code: (json['code'] as num?)?.toInt() ?? -1,
      msg: json['message'] as String? ?? '',
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukiApiResponseToJson<T>(
  KekokukiApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.msg,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'timestamp': instance.timestamp,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
