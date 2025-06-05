import 'package:client_information/client_information.dart';
import 'package:dio/dio.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

import '../../common/utils/kekokuki_log_util.dart';
import '../config/kekokuki_app_config.dart';
import '../../pages/login/kekokuki_login_service.dart';
import '../routes/kekokuki_routes.dart';
import 'kekokuki_api_response.dart';

class KekokukiHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var headers = options.headers;
    final params = await getCommonParamters();
    params.forEach((key, value) {
      headers[key] = value;
    });
    options.headers = headers;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    if (response.data is Map) {
      final data = KekokukiApiResponse.fromJson(response.data);
      if (data.isNeedLogin && Get.currentRoute != KekokukiRoutes.login) {
        Get.find<KekokukiLoginService>().logout();
      }
    }
  }

  /// 通用参数
  Future<Map<String, Object?>> getCommonParamters() async {
    final appName = KekokukiAppConfig.appName.toLowerCase();
    final channelName = KekokukiAppConfig.channelName;
    final clientInformation = await ClientInformation.fetch();
    final deviceId = clientInformation.deviceId;
    final osSystem = clientInformation.osName;
    final osVersion = clientInformation.osVersion;
    final appVersion = clientInformation.applicationVersion;
    final buildNumber = clientInformation.applicationBuildCode;
    final language = Get.deviceLocale?.languageCode ?? Get.locale?.languageCode ?? 'en';
    final userAgent = "$appName,$appVersion,$osSystem,$osVersion,$channelName,$buildNumber";
    final authorization = Get.find<KekokukiLoginService>().authorization;

    final query = {
      'User-Agent': userAgent,
      'Authorization': authorization,
      'user-language': language,
      'device-id': deviceId,
    };

    return query;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    final params = {
      'api': err.requestOptions.path,
      'error': err.error.toString(),
    };
    KekokukiLogUtil.e("ApiError", params.toString(), err.stackTrace);
  }
}
