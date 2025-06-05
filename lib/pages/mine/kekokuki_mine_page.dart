import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/test_tools/kekokuki_test_tools_page.dart';

import '../../common/widgets/kekokuki_app_bar.dart';
import '../../common/widgets/kekokuki_app_scaffold.dart';
import '../../services/config/kekokuki_app_config.dart';
import '../../services/styles/kekokuki_styles.dart';
import 'kekokuki_mine_page_controller.dart';

class KekokukiMinePage extends GetView<KekokukiMinePageController> {
  const KekokukiMinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        title: Text(
          "Mine".tr,
          style: KekokukiStyles.s18w700,
        ),
        actions: [
          if (KekokukiAppConfig.enableTestTools) ...[
            IconButton(
              onPressed: () => Get.to(() => const KekokukiTestToolsPage()),
              icon: const Icon(
                Icons.construction,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ],
      ),
      body: Container(),
    );
  }
}
