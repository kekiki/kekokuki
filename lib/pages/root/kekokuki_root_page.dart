import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kekokuki/pages/widgets/status_page/kekokuki_status_builder.dart';
import '../../common/widgets/kekokuki_app_scaffold.dart';
import 'kekokuki_root_controller.dart';
import 'kekokuki_root_navigation_bar.dart';

// import 'package:skeletonizer/skeletonizer.dart';

class KekokukiRootPage extends GetView<KekokukiRootController> {
  const KekokukiRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: KekokukiStatusBuilder(
        bodyBuilder: (context) {
          return KekokukiAppScaffold(
            isAllowBack: false,
            onBackPressed: controller.onBack,
            body: GetBuilder<KekokukiRootController>(
              id: kBuildIdPages,
              builder: (controller) {
                return IndexedStack(
                  sizing: StackFit.expand,
                  index: controller.selectedTab.index,
                  children: controller.rootTabs.map((e) => e.page).toList(),
                );
              },
            ),
            bottomNavigationBar: GetBuilder<KekokukiRootController>(
              id: kBuildIdBottomBar,
              builder: (controller) => KekokukiRootNavigationBar(controller),
            ),
          );
        },
        onReload: controller.onReload,
      ),
    );
  }
}
