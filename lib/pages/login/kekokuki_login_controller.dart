import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/preference/kekokuki_app_preference.dart';
import '../../common/utils/kekokuki_loading_util.dart';
import 'kekokuki_login_account_dialog.dart';
import 'kekokuki_login_service.dart';

class KekokukiLoginController extends GetxController with GetSingleTickerProviderStateMixin {
  final _service = Get.find<KekokukiLoginService>();
  final isAcceptPrivacyPolicyObs = false.obs;
  late final AnimationController animationController;

  @override
  void onInit() {
    isAcceptPrivacyPolicyObs.value = KekokukiAppPreference.user.acceptPrivacyPolicy;
    const duration = Duration(milliseconds: 500);
    animationController = AnimationController(vsync: this, duration: duration);
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void onChangeApiServer() async {
    // if (!KekokukiAppConfig.enableTestTools) return;
    // final isApiServerTest = KekokukiAppPreference.config.isApiServerTest;
    // String message = "";
    // if (!isApiServerTest) {
    //   KekokukiAppPreference.config.isApiServerTest = true;
    //   message = "切换成测试服,退出App重新进入";
    // } else {
    //   KekokukiAppPreference.config.isApiServerTest = false;
    //   message = "切换成正式服,退出App重新进入";
    // }
    // final result = await KekokukiDialogUtil.showDialog(KekokukiConfirmDialog(
    //   content: message,
    //   onlyConfirm: true,
    // ));
    // if (result == null) return;
    // exit(0);
  }

  /// quick login
  Future<void> onFastLogin() async {
    if (!isAcceptPrivacyPolicyObs.value) {
      animationController.forward();
      return;
    }

    _service.loginFast();
  }

  void onAccountLogin() async {
    if (!isAcceptPrivacyPolicyObs.value) {
      animationController.forward();
      return;
    }

    final arguments = await Get.dialog(const KekokukiLoginAccountDialog());
    if (arguments == null || arguments is! Map<String, String>) return;
    final userId = arguments['userId'] ?? '';
    final password = arguments['password'] ?? '';
    if (userId.isEmpty || password.isEmpty) {
      KekokukiLoadingUtil.showToast('UserId or password can not be empty');
      return;
    }
    _service.loginWithAccount(userId, password);
  }

  Future<void> onGoogleLogin() async {
    if (!isAcceptPrivacyPolicyObs.value) {
      animationController.forward();
      return;
    }

    _service.loginWithGoogle();
  }

  void onTapPrivacyPolicy() {
    // Get.toNamed(
    //   KekokukiRoutes.web,
    //   arguments: {
    //     'title': 'kekokuki_privacy_policy'.tr,
    //     'url': KekokukiAppConfig.privacyPolicyUrl,
    //   },
    // );
  }

  void onTapTermsOfService() {
    // Get.toNamed(
    //   KekokukiRoutes.web,
    //   arguments: {
    //     'title': 'kekokuki_term_of_service'.tr,
    //     'url': KekokukiAppConfig.termsOfServiceUrl,
    //   },
    // );
  }

  void tapAgree() {
    isAcceptPrivacyPolicyObs.value = !isAcceptPrivacyPolicyObs.value;
    KekokukiAppPreference.user.acceptPrivacyPolicy = isAcceptPrivacyPolicyObs.value;
  }
}
