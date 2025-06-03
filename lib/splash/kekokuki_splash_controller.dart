import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../pages/login/kekokuki_login_service.dart';

class KekokukiSplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    final loginService = Get.find<KekokukiLoginService>();
    loginService.login().then((_) => FlutterNativeSplash.remove());
  }
}
