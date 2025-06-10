import 'package:get/get.dart';

import '../pages/login/kekokuki_login_service.dart';

class KekokukiSplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Get.find<KekokukiLoginService>().login();
  }
}
