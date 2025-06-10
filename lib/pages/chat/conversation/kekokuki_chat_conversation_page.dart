import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';

import '../../../common/widgets/kekokuki_app_bar.dart';
import '../../../common/widgets/kekokuki_app_scaffold.dart';
import '../../../services/styles/kekokuki_colors.dart';
import '../../../services/styles/kekokuki_styles.dart';
import '../../widgets/kekokuki_refresh_header.dart';
import 'kekokuki_chat_conversation_cell.dart';
import 'kekokuki_chat_conversation_page_controller.dart';

class KekokukiChatConversationPage extends GetView<KekokukiChatConversationPageController> {
  const KekokukiChatConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        title: Text(
          "kekokuki_chat".tr,
          style: KekokukiStyles.s18w700,
        ),
      ),
      body: EasyRefresh.builder(
        controller: controller.refreshController,
        header: KekokukiRefreshHeader.classic(),
        onRefresh: controller.onRefresh,
        childBuilder: (context, physics) {
          return CustomScrollView(
            physics: physics,
            slivers: [
              Obx(() {
                final list = List.from(controller.conversationListObs);
                return SliverList.separated(
                  itemBuilder: (context, index) {
                    final conversation = list[index];
                    return InkWell(
                      onTap: () => controller.onTapConversation(conversation),
                      child: KekokukiChatConversationCell(
                        conversation: conversation,
                        onTapPin: controller.onTapPin,
                        onTapDelete: controller.onTapDelete,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0.5,
                      indent: 75.pt,
                      color: KekokukiColors.primaryColor,
                    );
                  },
                  itemCount: list.length,
                );
              })
            ],
          );
        },
      ),
    );
  }
}
