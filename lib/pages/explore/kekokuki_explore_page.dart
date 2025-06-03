import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../framework/widgets/kekokuki_app_bar.dart';
import '../../framework/widgets/kekokuki_app_scaffold.dart';
import '../../services/styles/kekokuki_styles.dart';
import 'kekokuki_explore_page_controller.dart';

class KekokukiExplorePage extends GetView<KekokukiExplorePageController> {
  const KekokukiExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        title: Text(
          "Explore".tr,
          style: KekokukiStyles.s18w700,
        ),
      ),
      body: Container(),
    );
  }
}
