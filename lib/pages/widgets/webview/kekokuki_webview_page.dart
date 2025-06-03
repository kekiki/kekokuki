import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../framework/adapts/kekokuki_screen_adapt.dart';
import '../../../framework/widgets/kekokuki_app_bar.dart';
import '../../../framework/widgets/kekokuki_app_scaffold.dart';
import '../../../services/styles/kekokuki_styles.dart';
import 'kekokuki_webview_controller.dart';

class KekokukiWebviewPage extends StatelessWidget {
  const KekokukiWebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KekokukiWebviewController>(
      init: KekokukiWebviewController(),
      builder: (controller) {
        return KekokukiAppScaffold(
          backgroundColor: Colors.white,
          appBar: KekokukiAppBar(
            title: Text(
              controller.title,
              style: KekokukiStyles.s18w700,
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: WebViewWidget(
                  controller: controller.webViewController,
                ),
              ),
              PositionedDirectional(
                top: 0,
                start: 0,
                end: 0,
                child: Obx(() {
                  return Visibility(
                    visible: controller.progressObs.value < 100,
                    child: LinearProgressIndicator(
                      minHeight: 2.pt,
                      value: controller.progressObs.value / 100,
                      backgroundColor: Colors.transparent,
                      color: KekokukiColors.primaryColor,
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
