import 'dart:async';

import '../../common/utils/kekokuki_log_util.dart';
import 'kekokuki_api_response.dart';

extension KekokukiFutureExt<T> on Future<KekokukiApiResponse<T>> {
  Future<KekokukiApiResponse<T>> get response async {
    Completer<KekokukiApiResponse<T>> completer = Completer();
    then((response) {
      completer.complete(response);
    }, onError: (Object error, StackTrace stackTrace) {
      KekokukiLogUtil.e("ApiError", error.toString(), stackTrace);
      final response = KekokukiApiResponse<T>(code: -1, msg: error.toString(), data: null, timestamp: 0);
      completer.complete(response);
    });
    return completer.future;
  }

  Future<KekokukiApiResponse<T>> retry({int maxCount = 3, int delay = 3000}) async {
    assert(maxCount >= 1);
    KekokukiApiResponse<T>? currentResult;
    for (int i = 0; i < maxCount; i++) {
      currentResult = await response;
      if (currentResult.isSuccess) return currentResult;
      await Future.delayed(Duration(milliseconds: delay));
    }
    return currentResult!;
  }
}
