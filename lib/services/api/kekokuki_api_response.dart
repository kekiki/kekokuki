import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

import 'kekokuki_api_error_code.dart';

part 'kekokuki_api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class KekokukiApiResponse<T> {
  //  业务处理状态码 0为正常 其他为错误
  @JsonKey(name: 'code', defaultValue: -1)
  final int code;

  // 业务处理状态提示  状态码非0时可展示此字段
  @JsonKey(name: 'message', defaultValue: '')
  final String msg;

  // data
  @JsonKey(name: 'data', defaultValue: null)
  final T? data;

  //  业务处理状态码 0为正常 其他为错误
  @JsonKey(name: 'timestamp', defaultValue: 0)
  final int timestamp;

  const KekokukiApiResponse({
    required this.code,
    required this.msg,
    required this.data,
    required this.timestamp,
  });

  bool get isSuccess => code == 0;
  bool get isNeedLogin =>
      code == KekokukiApiErrorCode.unLoginIn.value ||
      code == KekokukiApiErrorCode.loginInfoError.value ||
      code == KekokukiApiErrorCode.otherDeviceLogin.value ||
      code == KekokukiApiErrorCode.accountNoFound.value ||
      code == KekokukiApiErrorCode.accountBanned.value;

  @override
  String toString() {
    return 'KekokukiApiResponse{code: $code, msg: $msg, data: $data, timestamp: $timestamp}';
  }

  factory KekokukiApiResponse.fromJson(Map<String, dynamic> json, [T Function(dynamic json)? fromJsonT]) =>
      // _$KekokukiApiResponseFromJson(json, fromJsonT);
      _$fixedKekokukiApiResponseFromJson(json, fromJsonT);

  KekokukiApiResponse<T> copyWith({
    int? code,
    String? msg,
    T? data,
    int? timestamp,
  }) {
    return KekokukiApiResponse(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? this.data,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

/// 服务端在返回的数据结构中，如果List为空，有几率出现不返回data字段的情况，
/// {code=0, msg=success}
KekokukiApiResponse<T> _$fixedKekokukiApiResponseFromJson<T>(Map<String, dynamic> json, [T Function(Object? json)? fromJsonT]) {
  final code = json['code'] as int? ?? -1;
  final msg = json['message'] as String? ?? 'kekokuki_request_failed'.tr;
  final data = fromJsonT != null ? _$nullableGenericFromJson(json["data"], fromJsonT) : null;
  final timestamp = json['timestamp'] as int? ?? 0;
  if (code == 0 && data == null && fromJsonT != null) {
    final genericType = T.toString();
    T? generateData;
    if (genericType.startsWith("List")) {
      generateData = _$nullableGenericFromJson([], fromJsonT);
    } else {
      generateData = _$nullableGenericFromJson({}, fromJsonT);
    }
    return KekokukiApiResponse<T>(code: code, msg: msg, data: generateData, timestamp: timestamp);
  }
  return KekokukiApiResponse<T>(code: code, msg: msg, data: data, timestamp: timestamp);
}
