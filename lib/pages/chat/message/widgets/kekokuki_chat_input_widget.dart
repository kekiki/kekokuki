import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';

import '../../../../services/styles/kekokuki_colors.dart';
import '../../../../services/styles/kekokuki_styles.dart';
import '../kekokuki_chat_message_page_controller.dart';
import 'kekokuki_emoji_list_widget.dart';

class KekokukiChatInputWidget extends StatelessWidget {
  const KekokukiChatInputWidget({
    super.key,
    required this.placeholder,
    required this.textEditingNode,
    required this.textEditingController,
    required this.textScrollController,
    required this.inputType,
    required this.keyboardHeight,
    required this.enableSend,
    this.onTapSend,
    this.onTapEmoji,
    this.onTapImage,
    this.onTapGift,
    this.onTapTextField,
  });

  final String placeholder;
  final ScrollController textScrollController;
  final TextEditingController textEditingController;
  final FocusNode textEditingNode;
  final KekokukiChatInputType inputType;
  final double keyboardHeight;
  final bool enableSend;
  final VoidCallback? onTapSend;
  final VoidCallback? onTapEmoji;
  final VoidCallback? onTapImage;
  final VoidCallback? onTapGift;
  final VoidCallback? onTapTextField;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 58.pt),
            padding: EdgeInsets.symmetric(vertical: 10.pt),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 12.pt),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(minHeight: 38.pt),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 4.pt, horizontal: 14.pt),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.pt),
                      color: KekokukiColors.cardColor,
                      border: Border.all(color: rgba(242, 244, 246, 1)),
                    ),
                    child: TextField(
                      onTap: onTapTextField,
                      focusNode: textEditingNode,
                      controller: textEditingController,
                      scrollController: textScrollController,
                      cursorColor: KekokukiColors.primaryColor,
                      maxLines: 5,
                      minLines: 1,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) => onTapSend!(),
                      keyboardType: TextInputType.multiline,
                      style: KekokukiStyles.s14w400,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: placeholder,
                        hintStyle: KekokukiStyles.s12w400.copyWith(
                          color: rgba(153, 153, 153, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTapSend,
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 8.pt, horizontal: 12.pt),
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 12.pt),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.pt),
                      color: enableSend ? KekokukiColors.buttonNormalColor : KekokukiColors.buttonDisableColor,
                    ),
                    child: Text(
                      'kekokuki_send'.tr,
                      style: KekokukiStyles.s14w600.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: onTapEmoji,
                    icon: Icon(CupertinoIcons.smiley, size: 32.pt),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: onTapImage,
                    icon: Icon(CupertinoIcons.photo, size: 32.pt),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: onTapGift,
                    icon: Icon(CupertinoIcons.gift, size: 32.pt),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomWidget(context),
        ],
      ),
    );
  }

  Widget _buildBottomWidget(BuildContext context) {
    final height = inputType == KekokukiChatInputType.none
        ? 0.0
        : inputType == KekokukiChatInputType.emoji
            ? 300.pt
            : keyboardHeight;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: height,
      child: _buildEmojiPickerWidget(height),
    );
  }

  Widget _buildEmojiPickerWidget(double height) {
    if (inputType != KekokukiChatInputType.emoji || height == 0) {
      return const SizedBox.shrink();
    }
    return KekokukiEmojiListWidget(
      textScrollController: textScrollController,
      textEditingController: textEditingController,
      height: height,
    );
  }
}
