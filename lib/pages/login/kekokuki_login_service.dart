import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';

import '../../common/extensions/kekokuki_string_ext.dart';
import '../../common/utils/kekokuki_log_util.dart';
import '../../common/utils/kekokuki_loading_util.dart';
import '../../services/config/kekokuki_config_service.dart';
import '../../services/database/kekokuki_database.dart';
import '../../services/preference/kekokuki_app_preference.dart';
import '../../services/profile/kekokuki_profile_service.dart';
import '../../services/routes/kekokuki_routes.dart';
import '../../services/rtm&rtc/kekokuki_rtc_service.dart';
import '../../services/rtm&rtc/kekokuki_rtm_service.dart';
import '../call/services/kekokuki_call_service.dart';
import '../chat/services/kekokuki_chat_service.dart';
import 'kekokuki_login_info_model.dart';
import 'kekokuki_login_record_model.dart';
import '../../services/api/kekokuki_api_client.dart';

class KekokukiLoginService extends GetxService with WidgetsBindingObserver {
  final _apiClient = Get.find<KekokukiApiClient>();
  final _database = Get.find<KekokukiDatabase>();

  late KekokukiLoginInfoModel _loginInfo;
  late KekokukiLoginRecordModel _loginRecord;

  int get userId => _loginInfo.userId;
  String get authorization => _loginInfo.authorization;
  bool get isLogin => authorization.isNotEmpty;

  Future<KekokukiLoginService> init() async {
    _loginInfo = await _queryLoginInfo();
    _loginRecord = await _queryLoginRecord();
    return this;
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        KekokukiLogUtil.i('AppLifecycleState', 'app inactive');
        break;
      case AppLifecycleState.resumed:
        KekokukiLogUtil.i('AppLifecycleState', 'app resumed');
        break;
      case AppLifecycleState.paused:
        KekokukiLogUtil.i('AppLifecycleState', 'app paused');
        break;
      case AppLifecycleState.detached:
        KekokukiLogUtil.i('AppLifecycleState', 'app detached');
        break;
      case AppLifecycleState.hidden:
        KekokukiLogUtil.i('AppLifecycleState', 'app hidden');
        break;
    }
  }

  Future<void> _initServices() async {
    await Get.putAsync(() => KekokukiConfigService().init());
    await Get.putAsync(() => KekokukiProfileService().init());
    await Get.putAsync(() => KekokukiRtmService().init());
    await Get.putAsync(() => KekokukiRtcService().init());
    await Get.putAsync(() => KekokukiCallService().init());
    await Get.putAsync(() => KekokukiChatService().init());
  }

  Future<void> _deleteServices() async {
    await Get.delete<KekokukiChatService>(force: true);
    await Get.delete<KekokukiCallService>(force: true);
    await Get.delete<KekokukiRtcService>(force: true);
    await Get.delete<KekokukiRtmService>(force: true);
    await Get.delete<KekokukiProfileService>(force: true);
    await Get.delete<KekokukiConfigService>(force: true);
  }

  Future<void> login({KekokukiLoginInfoModel? loginInfo, KekokukiLoginRecordModel? loginRecord}) async {
    try {
      if (loginInfo != null && loginRecord != null) {
        await _saveLoginInfo(loginInfo);
        await _saveLoginRecord(loginRecord);
        await _initServices();
        Get.offAllNamed(KekokukiRoutes.home);
      } else {
        if (isLogin) {
          await _initServices();
          Get.offAllNamed(KekokukiRoutes.home);
        } else {
          Get.offAllNamed(KekokukiRoutes.login);
        }
      }
    } catch (e, s) {
      KekokukiLogUtil.e('LoginService', 'login error: $e', s);
    }
  }

  Future<void> logout() async {
    if (!isLogin) return;
    try {
      await _deleteServices();
      _loginInfo = const KekokukiLoginInfoModel();
    } catch (e, s) {
      KekokukiLogUtil.e('LoginService', 'logout error: $e', s);
    } finally {
      Get.offAllNamed(KekokukiRoutes.login);
    }
  }

  Future<void> deleteAccount() async {
    await _clearLoginInfo();
    await logout();
  }

  Future<void> _saveLoginInfo(KekokukiLoginInfoModel model) async {
    if (model.userId != _loginInfo.userId) {
      await _clearLoginInfo();
    }
    _loginInfo = model;
    KekokukiAppPreference.user.loginInfoJson = model.toJson();
  }

  Future<void> _clearLoginInfo() async {
    // 数据库清空
    await _clearDatabase();
    // 用户状态数据清空
    await KekokukiAppPreference.user.clear();
  }

  Future<void> _clearDatabase() async {
    await _database.anchorDao.clear();
    await _database.chatConversationDao.clear();
    await _database.chatMessageDao.clear();
  }

  Future<KekokukiLoginInfoModel> _queryLoginInfo() async {
    final Map<String, dynamic> json = KekokukiAppPreference.user.loginInfoJson;
    if (json.isEmpty) {
      return const KekokukiLoginInfoModel();
    }
    return KekokukiLoginInfoModel.fromJson(json);
  }

  Future<void> _saveLoginRecord(KekokukiLoginRecordModel model) async {
    _loginRecord = model;
    KekokukiAppPreference.user.loginRecordJson = model.toJson();
  }

  Future<KekokukiLoginRecordModel> _queryLoginRecord() async {
    final Map<String, dynamic> json = KekokukiAppPreference.user.loginRecordJson;
    if (json.isEmpty) {
      return const KekokukiLoginRecordModel();
    }
    return KekokukiLoginRecordModel.fromJson(json);
  }

  /// quick login
  Future<void> loginFast() async {
    var username = '';
    var password = '';
    if (_loginRecord.isAccountLogin && !_loginRecord.isInvilid) {
      username = _loginRecord.account;
      password = _loginRecord.password;
      return await loginWithAccount(username, password);
    }

    password = KekokukiStringExt.generateRandomString(6);
    KekokukiLoadingUtil.show();
    final result = await _apiClient.loginWithGuest(password).response;

    if (result.isSuccess && result.data != null) {
      final loginInfo = result.data!;
      final loginRecord = KekokukiLoginRecordModel(
        type: KekokukiLoginType.fast,
        account: loginInfo.userId.toString(),
        password: password,
      );
      login(loginInfo: loginInfo, loginRecord: loginRecord);
      KekokukiLoadingUtil.dismiss();
    } else {
      KekokukiLoadingUtil.dismiss();
      KekokukiLoadingUtil.showToast(result.msg.isNotEmpty ? result.msg : 'kekokuki_login_failed'.tr);
    }
  }

  // password login
  Future<void> loginWithAccount(String username, String password) async {
    KekokukiLoadingUtil.show();
    final result = await _apiClient.loginWithPassword(username, password.md5).response;
    KekokukiLoadingUtil.dismiss();

    if (result.isSuccess && result.data != null) {
      final loginInfo = result.data!;
      final loginRecord = KekokukiLoginRecordModel(
        type: KekokukiLoginType.password,
        account: loginInfo.username,
        password: password,
      );
      login(loginInfo: loginInfo, loginRecord: loginRecord);
      KekokukiLoadingUtil.dismiss();
    } else {
      KekokukiLoadingUtil.showToast(result.msg.isNotEmpty ? result.msg : 'kekokuki_login_failed'.tr);
    }
  }

  // password login
  Future<void> loginWithGoogle() async {
    // var cover = '';
    // var googleOpenId = '';
    // var googleToken = '';
    // var nickname = '';
    // var email = '';
    // if (_loginRecord.isGoogleLogin && !_loginRecord.isInvilid) {
    //   cover = _loginRecord.cover;
    //   googleOpenId = _loginRecord.googleOpenId;
    //   googleToken = _loginRecord.googleToken;
    //   nickname = _loginRecord.nickname;
    //   email = _loginRecord.email;
    // } else {
    //   final googleUser = await GoogleSignIn().signIn();
    //   if (googleUser != null) {
    //     final authentication = await googleUser.authentication;
    //     cover = googleUser.photoUrl ?? '';
    //     googleOpenId = googleUser.id;
    //     googleToken = authentication.idToken ?? '';
    //     nickname = googleUser.displayName ?? '';
    //     email = googleUser.email;
    //   }
    // }

    // KekokukiLoadingUtil.show();
    // final result = await _apiClient.loginWithGoogle(cover, googleOpenId, googleToken, nickname, email).response;
    // KekokukiLoadingUtil.dismiss();

    // if (result.isSuccess && result.data != null) {
    //   final loginInfo = result.data!;
    //   await _saveLoginInfo(loginInfo);
    //   await _saveLoginRecord(KekokukiLoginRecordModel(
    //     type: KekokukiLoginType.google,
    //     cover: cover,
    //     googleOpenId: googleOpenId,
    //     googleToken: googleToken,
    //     nickname: nickname,
    //     email: email,
    //   ));
    //   login();
    // } else {
    //   throw Exception(result.msg.isNotEmpty ? result.msg : 'kekokuki_login_failed'.tr);
    // }
    KekokukiLoadingUtil.showToast('Google login is not supported yet');
  }
}
