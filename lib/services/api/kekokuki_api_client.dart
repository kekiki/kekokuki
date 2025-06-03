import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../pages/login/kekokuki_login_info_model.dart';
import '../config/kekokuki_config_model.dart';
import '../profile/kekokuki_profile_model.dart';
import 'kekokuki_api_response.dart';
part 'kekokuki_api_client.g.dart';

@RestApi()
abstract class KekokukiApiClient {
  factory KekokukiApiClient(Dio dio) = _KekokukiApiClient;

  // /////////////////////////////////////////////////////////////////////////////
  // //////////////////////////////// Login API
  // /////////////////////////////////////////////////////////////////////////////

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

  // /////////////////////////////////////////////////////////////////////////////
  // //////////////////////////////// Profile API
  // /////////////////////////////////////////////////////////////////////////////

  @GET('/user/user/getUserDetail')
  Future<KekokukiApiResponse<KekokukiProfileModel>> fetchProfile();

  @POST('/user/user/heartbeat')
  Future<KekokukiApiResponse<dynamic>> postHeartbeat(
    @Field('rtmStatus') int rtmStatus,
  );

  // /////////////////////////////////////////////////////////////////////////////
  // //////////////////////////////// Config API
  // /////////////////////////////////////////////////////////////////////////////

  @GET('/system/app/getConfig')
  Future<KekokukiApiResponse<KekokukiConfigModel>> fetchConfig();

  @GET('/system/app/getRtmToken')
  Future<KekokukiApiResponse<String>> fetchRtmToken();
}
