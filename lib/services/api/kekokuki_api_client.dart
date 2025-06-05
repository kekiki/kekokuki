import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../pages/call/ai/kekokuk_aib_anchor_model.dart';
import '../../pages/call/ai/kekokuki_ai_config_model.dart';
import '../../pages/chat/message/kekokuk_sensitive_word_model.dart';
import '../../pages/explore/anchor_detail/kekokuk_anchor_model.dart';
import '../../pages/explore/anchor_list/kekokuki_anchor_area_model.dart';
import '../../pages/explore/gift_rank/kekokuki_gift_rank_model.dart';
import '../../pages/explore/room_list/kekokuki_room_model.dart';
import '../../pages/login/kekokuki_login_info_model.dart';
import '../../pages/match/kekokuki_match_limit_model.dart';
import '../../pages/mine/level/kekokuk_level_config_model.dart';
import '../../pages/mine/sign_in/kekokuki_sign_in_model.dart';
import '../../pages/mine/store/kekokuki_product_downgrade_config_model.dart';
import '../../pages/mine/store/kekokuki_product_model.dart';
import '../config/kekokuki_config_model.dart';
import '../profile/kekokuki_profile_model.dart';
import 'kekokuki_api_response.dart';
part 'kekokuki_api_client.g.dart';

@RestApi()
abstract class KekokukiApiClient {
  factory KekokukiApiClient(Dio dio) = _KekokukiApiClient;

  /// User API

  @POST('/user/login/guest')
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithGuest(
    @Field('password') String password,
  );

  @POST('/user/login/password')
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithPassword(
    @Field('username') String username,
    @Field('password') String password,
  );

  @POST('/user/login/google')
  Future<KekokukiApiResponse<KekokukiLoginInfoModel>> loginWithGoogle(
    @Field('cover') String cover,
    @Field('id') String googleOpenId,
    @Field('token') String googleToken,
    @Field('nickname') String nickname,
    @Field('email') String email,
  );

  @GET('/user/user/getUserDetail')
  Future<KekokukiApiResponse<KekokukiProfileModel>> fetchProfile();

  @GET('/user/sign/getSignInVo')
  Future<KekokukiApiResponse<KekokukiSignInModel>> fetchSignInInfo();

  @GET('/user/gift/getGiftRank')
  Future<KekokukiApiResponse<List<KekokukiGiftRankModel>>> fetchGiftRankList();

  @POST('/user/user/heartbeat')
  Future<KekokukiApiResponse<dynamic>> postHeartbeat(
    @Field('rtmStatus') int rtmStatus,
  );

  /// [countryCode] 国家码
  /// [areaCode] 地区码
  /// [anchorType] 主播类型 [AnchorTypeFilter]
  /// [resetRepeat] 是否重置重复主播, 0:不重置, 1:重置
  @POST('/user/anchor/getAnchors')
  Future<KekokukiApiResponse<List<KekokukiAnchorModel>>> fetchAnchorList({
    @Field('countryCode') int? countryCode,
    @Field('areaCode') int? areaCode,
    @Field('anchorType') int? anchorType,
    @Field('resetRepeat') int resetRepeat = 0,
  });

  @GET('/user/anchor/getMatchLimit')
  Future<KekokukiApiResponse<KekokukiMatchLimitModel>> fetchMatchLimitInfo();

  @GET('/user/level/getLevelInfoConfigs')
  Future<KekokukiApiResponse<KekokukLevelConfigModel>> fetchLevelConfig();

  @GET('/user/anchor/getAibAnchor')
  Future<KekokukiApiResponse<KekokukAibAnchorModel>> fetchAibAnchor();

  /// System API

// 返回当前翻译文档地址，使用需下载
  @GET('/system/app/getTranslates')
  Future<KekokukiApiResponse<String>> fetchTranslates();

  @GET('/system/app/getConfig')
  Future<KekokukiApiResponse<KekokukiConfigModel>> fetchConfig();

  @GET('/system/app/getRtmToken')
  Future<KekokukiApiResponse<String>> fetchRtmToken();

  @GET('/system/ai/getAiConfigs')
  Future<KekokukiApiResponse<List<KekokukiAiConfigModel>>> fetchAiConfigList();

  @GET('/system/sensitive/getSensitiveWords')
  Future<KekokukiApiResponse<List<KekokukSensitiveWordModel>>> fetchSensitiveWordList();

  @GET('/system/country/getAreas')
  Future<KekokukiApiResponse<List<KekokukiAnchorAreaModel>>> fetchAnchorAreaList();

  /// Product API

  // type: 1: 充值中心 2: 快捷弹窗 3: 充值VIP
  @GET('/p/downgrade/getConfig')
  Future<KekokukiApiResponse<KekokukiProductModel>> fetchProductList(
    @Query('type') int type,
  );

  @GET('/p/product/getProducts')
  Future<KekokukiApiResponse<KekokukiProductDowngradeConfigModel>> fetchProductDowngradeConfig();

  /// Game API

  @GET('/game/game/getRoomList')
  Future<KekokukiApiResponse<List<KekokukiRoomModel>>> fetchRoomList();

  @GET('/game/game/getGlobalRoomMsg')
  Future<KekokukiApiResponse<List<KekokukiRoomModel>>> fetchGlobalRoomMsgList();
}
