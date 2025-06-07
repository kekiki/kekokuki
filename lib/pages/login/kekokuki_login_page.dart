import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/common/widgets/kekokuki_app_bar.dart';
import 'package:kekokuki/generated/assets.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

import '../../common/widgets/kekokuki_app_scaffold.dart';
import '../../common/widgets/kekokuki_shake_widget.dart';
import '../../services/config/kekokuki_app_config.dart';
import '../../test/kekokuki_test_main_page.dart';
import 'kekokuki_login_controller.dart';

class KekokukiLoginPage extends GetView<KekokukiLoginController> {
  const KekokukiLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        actions: [
          if (KekokukiAppConfig.enableTestTools) ...[
            IconButton(
              onPressed: () => Get.to(() => const KekokukiTestMainPage()),
              icon: const Icon(
                Icons.construction,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GestureDetector(
                onLongPress: controller.onChangeApiServer,
                child: Image.asset(
                  Assets.imagesCommonKekokukiLaunchAppIcon,
                  width: 107.pt,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.onFastLogin,
            child: Container(
              width: 345.pt,
              height: 50.pt,
              decoration: BoxDecoration(
                color: KekokukiColors.cardColor,
                borderRadius: BorderRadius.circular(25.pt),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'kekokuki_login_quick'.tr,
                    style: TextStyle(
                      fontSize: 18.pt,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.pt),
          GestureDetector(
            onTap: controller.onAccountLogin,
            child: Container(
              width: 345.pt,
              height: 50.pt,
              decoration: BoxDecoration(
                color: KekokukiColors.cardColor,
                borderRadius: BorderRadius.circular(25.pt),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account login'.tr,
                    style: TextStyle(
                      fontSize: 18.pt,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.pt),
          Visibility(
            visible: GetPlatform.isAndroid,
            child: GestureDetector(
              onTap: controller.onGoogleLogin,
              child: Container(
                width: 345.pt,
                height: 50.pt,
                decoration: BoxDecoration(
                  color: KekokukiColors.cardColor,
                  borderRadius: BorderRadius.circular(25.pt),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(Assets.imagesKekokukiLoginGoogle, width: 24.pt),
                    // SizedBox(width: 15.pt),
                    Text(
                      'kekokuki_login_google'.tr,
                      style: TextStyle(
                        color: KekokukiColors.primaryTextColor,
                        fontSize: 18.pt,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ).marginOnly(bottom: 20.pt),
            ),
          ),
          KekokukiShakeWidget(
            shakeOffset: 10,
            controller: controller.animationController,
            child: GestureDetector(
              onTap: controller.tapAgree,
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20.pt),
                  Obx(() {
                    return Visibility(
                      visible: controller.isAcceptPrivacyPolicyObs.value,
                      replacement: Image.asset(
                        Assets.imagesCommonKekokukiCheckCircle,
                        width: 16.pt,
                        height: 16.pt,
                      ),
                      child: Image.asset(
                        Assets.imagesCommonKekokukiCheckIn,
                        width: 16.pt,
                        height: 16.pt,
                        color: KekokukiColors.primaryColor,
                      ),
                    );
                  }),
                  SizedBox(width: 4.pt),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: '${'kekokuki_login_accept'.tr} ',
                        style: TextStyle(
                          color: KekokukiColors.grayTextColor,
                          fontSize: 14.pt,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'kekokuki_term_of_service'.tr,
                            style: TextStyle(
                              color: KekokukiColors.primaryColor,
                              fontSize: 14.pt,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => controller.onTapTermsOfService(),
                          ),
                          TextSpan(text: ' ${'kekokuki_and'.tr} '),
                          TextSpan(
                            text: 'kekokuki_privacy_policy'.tr,
                            style: TextStyle(
                              color: KekokukiColors.primaryColor,
                              fontSize: 14.pt,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => controller.onTapPrivacyPolicy(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.pt),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.pt),
        ],
      ),
    );
  }
}
