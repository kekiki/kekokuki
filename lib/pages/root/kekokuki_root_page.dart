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
    final state = controller.state;
    return KekokukiAppScaffold(
      isAllowBack: false,
      onBackPressed: controller.onBack,
      body: Obx(() {
        return IndexedStack(
          sizing: StackFit.expand,
          index: state.selectedTabTypeObs.value.index,
          children: homePages,
        );
      }),
      bottomNavigationBar: Obx(() {
        return KekokukiRootNavigationBar(
          selectedType: state.selectedTabTypeObs.value,
          messageCount: state.unReadMessageCountObs.value,
          onTapTab: controller.onTapTabItem,
        );
      }),
    );
  }
}
