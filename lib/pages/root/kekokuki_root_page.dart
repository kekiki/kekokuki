import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../common/widgets/kekokuki_app_scaffold.dart';
import '../chat/conversation/kekokuki_chat_conversation_page.dart';
import '../explore/kekokuki_explore_page.dart';
import '../match/kekokuki_match_page.dart';
import '../mine/kekokuki_mine_page.dart';
import '../moment/list/kekokuki_moment_list_page.dart';
import 'kekokuki_root_controller.dart';
import 'kekokuki_root_navigation_bar.dart';

class KekokukiRootPage extends GetView<KekokukiRootController> {
  const KekokukiRootPage({super.key});

  static const homePages = [
    KekokukiExplorePage(),
    KekokukiMatchPage(),
    KekokukiMomentListPage(),
    KekokukiChatConversationPage(),
    KekokukiMinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      isAllowBack: false,
      onBackPressed: controller.onBack,
      body: GetBuilder<KekokukiRootController>(
        id: kBuildIdPages,
        builder: (controller) {
          return IndexedStack(
            sizing: StackFit.expand,
            index: controller.selectedTab.index,
            children: homePages,
          );
        },
      ),
      bottomNavigationBar: GetBuilder<KekokukiRootController>(
        id: kBuildIdBottomBar,
        builder: (controller) => KekokukiRootNavigationBar(controller),
      ),
    );
  }
}
