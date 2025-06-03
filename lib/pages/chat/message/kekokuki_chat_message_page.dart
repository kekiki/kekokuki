import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../framework/widgets/kekokuki_app_bar.dart';
import '../../../framework/widgets/kekokuki_app_scaffold.dart';
import '../../../generated/assets.dart';
import '../../../services/styles/kekokuki_styles.dart';
import 'kekokuki_chat_message_page_controller.dart';
import 'widgets/kekokuki_chat_input_widget.dart';
import 'widgets/kekokuki_chat_message_cell.dart';

class KekokukiChatMessagePage extends GetView<KekokukiChatMessagePageController> {
  const KekokukiChatMessagePage(this._tag, {super.key});
  final String _tag;

  @override
  String? get tag => _tag;

  static Future<T?> show<T>({required int anchorId}) async {
    final tag = '$anchorId';
    return await Get.to<T>(
      KekokukiChatMessagePage(tag),
      arguments: anchorId,
      binding: BindingsBuilder.put(() => KekokukiChatMessagePageController(), tag: tag),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        title: Text(
          'Chat Message',
          style: KekokukiStyles.s18w700,
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanDown: (_) => controller.onCloseKeyboard(),
              child: Column(
                children: [
                  Flexible(
                    child: Obx(() {
                      final messageList = List.from(controller.messageListObs);
                      return CustomScrollView(
                        shrinkWrap: true,
                        reverse: true,
                        slivers: [
                          SliverList.builder(
                            itemCount: messageList.length,
                            itemBuilder: (context, index) {
                              // TODO: 取主播头像
                              // final anchorAvatar = state.isCustomerService.value ? Assets.imagesKekokukiAvatarCustomerService : state.anchorInfoObs.value?.avatar ?? '';
                              const anchorAvatar = Assets.imagesCommonKekokukiAvatarAnchor;
                              return KekokukiChatMessageCell(
                                message: messageList[index],
                                tapAnchorAvatar: controller.onTapAnchorAvatar,
                                tapUserAvatar: controller.onTapUserAvatar,
                                onTapMessage: controller.onTapMessage,
                                userAvatar: controller.profileObs.value.portrait,
                                anchorAvatar: anchorAvatar,
                                onTapResend: controller.onTapResend,
                              );
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            return KekokukiChatInputWidget(
              placeholder: 'kekokuki_enter_content'.tr,
              textEditingController: controller.inputEditingController,
              textEditingNode: controller.inputEditingNode,
              textScrollController: controller.inputScrollController,
              inputType: controller.inputTypeObs.value,
              keyboardHeight: controller.keyboardHeightObs.value,
              enableSend: controller.enableSendObs.value,
              onTapSend: controller.onTapSend,
              onTapEmoji: controller.onTapEmoji,
              onTapImage: controller.onTapImage,
              onTapGift: controller.onTapGift,
              onTapTextField: controller.onTapTextField,
            );
          }),
        ],
      ),
    );
  }
}
