import 'package:dio/dio.dart';

import '../../services/config/kekokuki_log_util.dart';

class KekokukiDownloadUtil {
  static Future<bool> download({
    required String url,
    required String savePath,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = Dio();
    try {
      final response = await dio.download(
        url,
        savePath,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.statusCode == 200;
    } on DioException catch (e, s) {
      KekokukiLogUtil.e("DownloadUtil", e.toString(), s);
      return false;
    }
  }
}
