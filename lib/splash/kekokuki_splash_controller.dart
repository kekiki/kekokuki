import 'package:get/get.dart';

import '../pages/login/kekokuki_login_service.dart';
import '../services/routes/kekokuki_routes.dart';

class KekokukiSplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    final loginService = Get.find<KekokukiLoginService>();
    if (loginService.isLogin) {
      Get.offAllNamed(KekokukiRoutes.home);
    } else {
      Get.offAllNamed(KekokukiRoutes.login);
    }
  }
}
