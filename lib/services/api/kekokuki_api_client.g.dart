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
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithGuest(String password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiLoginInfoModel>>(Options(
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
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiLoginInfoModel>>(Options(
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
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiLoginInfoModel>>(Options(
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
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiProfileModel>>(Options(
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
  Future<KekokukiApiResponse<KekokukiSignInModel>> fetchSignInInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiSignInModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/sign/getSignInVo',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiSignInModel>.fromJson(
      _result.data!,
      (json) => KekokukiSignInModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<List<KekokukiGiftRankModel>>> fetchGiftRankList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukiGiftRankModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/gift/getGiftRank',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukiGiftRankModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukiGiftRankModel>((i) => KekokukiGiftRankModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<dynamic>> postHeartbeat(int rtmStatus) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'rtmStatus': rtmStatus};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<dynamic>>(Options(
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
  Future<KekokukiApiResponse<List<KekokukiAnchorModel>>> fetchAnchorList({
    int? countryCode,
    int? areaCode,
    int? anchorType,
    int resetRepeat = 0,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'countryCode': countryCode,
      'areaCode': areaCode,
      'anchorType': anchorType,
      'resetRepeat': resetRepeat,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukiAnchorModel>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/anchor/getAnchors',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukiAnchorModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukiAnchorModel>((i) => KekokukiAnchorModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiMatchLimitModel>> fetchMatchLimitInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiMatchLimitModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/anchor/getMatchLimit',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiMatchLimitModel>.fromJson(
      _result.data!,
      (json) => KekokukiMatchLimitModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukLevelConfigModel>> fetchLevelConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukLevelConfigModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/level/getLevelInfoConfigs',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukLevelConfigModel>.fromJson(
      _result.data!,
      (json) => KekokukLevelConfigModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukAibAnchorModel>> fetchAibAnchor() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukAibAnchorModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/anchor/getAibAnchor',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukAibAnchorModel>.fromJson(
      _result.data!,
      (json) => KekokukAibAnchorModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiAivAnchorModel>> fetchAivAnchor() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiAivAnchorModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/anchor/getAivAnchor',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiAivAnchorModel>.fromJson(
      _result.data!,
      (json) => KekokukiAivAnchorModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiAnchorModel>> fetchAnchorInfo(int anchorId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': anchorId};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiAnchorModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/user/getAnchorExpandV2',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiAnchorModel>.fromJson(
      _result.data!,
      (json) => KekokukiAnchorModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiAivAnchorModel>> fetchFreeVideo(int anchorId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'anchorUserId': anchorId};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiAivAnchorModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/user/anchor/getFreeVideo',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiAivAnchorModel>.fromJson(
      _result.data!,
      (json) => KekokukiAivAnchorModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<String>> fetchTranslates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<String>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/system/app/getTranslates',
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

  @override
  Future<KekokukiApiResponse<KekokukiConfigModel>> fetchConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiConfigModel>>(Options(
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
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<String>>(Options(
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

  @override
  Future<KekokukiApiResponse<List<KekokukiAiConfigModel>>> fetchAiConfigList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukiAiConfigModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/system/ai/getAiConfigs',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukiAiConfigModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukiAiConfigModel>((i) => KekokukiAiConfigModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<List<KekokukSensitiveWordModel>>> fetchSensitiveWordList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukSensitiveWordModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/system/sensitive/getSensitiveWords',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukSensitiveWordModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukSensitiveWordModel>((i) => KekokukSensitiveWordModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<List<KekokukiAnchorAreaModel>>> fetchAnchorAreaList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukiAnchorAreaModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/system/country/getAreas',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukiAnchorAreaModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukiAnchorAreaModel>((i) => KekokukiAnchorAreaModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiProductModel>> fetchProductList(int type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiProductModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/p/downgrade/getConfig',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiProductModel>.fromJson(
      _result.data!,
      (json) => KekokukiProductModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<KekokukiProductDowngradeConfigModel>> fetchProductDowngradeConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiProductDowngradeConfigModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/p/product/getProducts',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiProductDowngradeConfigModel>.fromJson(
      _result.data!,
      (json) => KekokukiProductDowngradeConfigModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<List<KekokukiRoomModel>>> fetchRoomList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukiRoomModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/game/game/getRoomList',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukiRoomModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukiRoomModel>((i) => KekokukiRoomModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<List<KekokukiRoomModel>>> fetchGlobalRoomMsgList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<List<KekokukiRoomModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/game/game/getGlobalRoomMsg',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<List<KekokukiRoomModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic> ? json.map<KekokukiRoomModel>((i) => KekokukiRoomModel.fromJson(i as Map<String, dynamic>)).toList() : List.empty(),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<dynamic>> createCall(String path) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'join_path': path};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/call/call/createCall/',
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
  Future<KekokukiApiResponse<KekokukiCallChannelModel>> joinCall(String path) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'join_path': path};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<KekokukiCallChannelModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/call/call/joinCall/',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = KekokukiApiResponse<KekokukiCallChannelModel>.fromJson(
      _result.data!,
      (json) => KekokukiCallChannelModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<KekokukiApiResponse<dynamic>> cancelCall(
    int channelId,
    int endType,
    int? matchMode,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'channelId': channelId,
      'endType': endType,
      'matchMode': matchMode,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/call/call/cancelCall',
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
  Future<KekokukiApiResponse<String>> refreshCall(String path) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'join_path': path};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<KekokukiApiResponse<String>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/call/call/refreshCall/',
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
    if (T != dynamic && !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
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
