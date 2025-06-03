import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'kekokuki_log_util.dart';
import '../database/kekokuki_database_service.dart';
import '../preference/kekokuki_app_preference.dart';
import '../../framework/utils/kekokuki_path_util.dart';
import '../api/kekokuki_api_service.dart';
import '../http_overrides/kekokuki_global_http_overrides.dart';
import '../../pages/login/kekokuki_login_service.dart';

class KekokukiAppConfig {
  /// 包类型，默认0
  /// 0开发测试：包含所有日志和调试工具，不包含Google相关功能
  /// 1运营测试：包含所有日志，不包含调试工具和Google相关功能
  /// 2线上发布：只包含错误日志，不包含调试工具，包含Google相关功能
  static const int package = int.fromEnvironment('package', defaultValue: 0);
  static bool enableApiLog = false;
  static bool onlyWriteErrorLog = true;
  static bool enableTestTools = false;

  /// Defines
  static const String appName = 'Litgo';
  static String get channelName => '${appName.toLowerCase()}${GetPlatform.isIOS ? 200 : 100}';

  static String apiBaseUrl = '';
  static const privacyPolicyUrl = "https://sites.google.com/view/cherryprivacypolicy";
  static const termsOfServiceUrl = "https://sites.google.com/view/cherryterms";

  static Future<void> init() async {
    if (package == 0) {
      onlyWriteErrorLog = false;
      enableTestTools = true;
    } else if (package == 1) {
      onlyWriteErrorLog = false;
      enableTestTools = false;
    } else {
      onlyWriteErrorLog = true;
      enableTestTools = false;
    }
    enableApiLog = !onlyWriteErrorLog;

    await _initUIStyles();
    await _initUtils();
    await _initUrls();
    await _initServices();
  }

  static Future<void> _initUrls() async {
    if (package != 0 || !KekokukiAppPreference.config.isApiServerTest) {
      KekokukiAppConfig.apiBaseUrl = "https://api.litgoli.com";
    } else {
      KekokukiAppConfig.apiBaseUrl = "https://testapi.selalive.com";
    }
  }

  static Future<void> _initUIStyles() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  static Future<void> _initUtils() async {
    await KekokukiAppPreference.init();
    await KekokukiPathUtil.init();
    await KekokukiLogUtil.init();
  }

  static Future<void> _initServices() async {
    HttpOverrides.global = KekokukiGlobalHttpOverrides();

    await Get.putAsync(() => KekokukiApiService().init());
    await Get.putAsync(() => KekokukiDatabaseService().init());
    await Get.putAsync(() => KekokukiLoginService().init());
  }
}
