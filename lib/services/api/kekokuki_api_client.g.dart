// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _KekokukiApiClient implements KekokukiApiClient {
  _KekokukiApiClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithGuest(
      String password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<KekokukiLoginInfoModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user/login/guest',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<KekokukiLoginInfoModel>.fromJson(
      _result.data!,
      (json) => KekokukiLoginInfoModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithPassword(
    String username,
    String password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<KekokukiLoginInfoModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user/login/password',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<KekokukiLoginInfoModel>.fromJson(
      _result.data!,
      (json) => KekokukiLoginInfoModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithGoogle(
    String cover,
    String googleOpenId,
    String googleToken,
    String nickname,
    String email,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'cover': cover,
      'id': googleOpenId,
      'token': googleToken,
      'nickname': nickname,
      'email': email,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<KekokukiLoginInfoModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user/login/google',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<KekokukiLoginInfoModel>.fromJson(
      _result.data!,
      (json) => KekokukiLoginInfoModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiProfileModel>> fetchProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<KekokukiProfileModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user/user/getUserDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<KekokukiProfileModel>.fromJson(
      _result.data!,
      (json) => KekokukiProfileModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<dynamic>> postHeartbeat(int rtmStatus) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'rtmStatus': rtmStatus};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/user/user/heartbeat',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiConfigModel>> fetchConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<KekokukiConfigModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/system/app/getConfig',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<KekokukiConfigModel>.fromJson(
      _result.data!,
      (json) => KekokukiConfigModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<String>> fetchRtmToken() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KekokukiApiResponse<String>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/system/app/getRtmToken',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = KekokukiApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
