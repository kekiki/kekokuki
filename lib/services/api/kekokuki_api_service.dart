import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';

import '../config/kekokuki_app_config.dart';
import 'kekokuki_api_client.dart';
import 'kekokuki_header_interceptor.dart';
import 'kekokuki_logger_interceptor.dart';
import 'kekokuki_retry_intercepter.dart';

class KekokukiApiService extends GetxService {
  Future<KekokukiApiClient> init() async {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl: KekokukiAppConfig.apiBaseUrl,
      ),
    );

    dio.transformer = SyncTransformer();
    dio.interceptors.add(KekokukiHeaderInterceptor());
    dio.interceptors.add(KekokukiRetryOnConnectionChangeInterceptor(dio: dio));
    if (KekokukiAppConfig.enableApiLog) {
      dio.interceptors.add(KekokukiLoggerInterceptor(requestHeader: true));
    }

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return KekokukiApiClient(dio);
  }
}
