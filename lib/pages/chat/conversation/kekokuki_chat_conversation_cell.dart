import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';

import '../../../common/utils/kekokuki_format_util.dart';
import '../../../common/widgets/kekokuki_round_image_widget.dart';
import '../../../generated/assets.dart';
import '../../../services/styles/kekokuki_colors.dart';
import '../../../services/styles/kekokuki_styles.dart';
import 'kekokuki_chat_conversation_model.dart';

class KekokukiChatConversationCell extends StatelessWidget {
  final KekokukiChatConversationModel conversation;
  final ValueChanged<KekokukiChatConversationModel> onTapPin;
  final ValueChanged<KekokukiChatConversationModel> onTapDelete;

  const KekokukiChatConversationCell({
    super.key,
    required this.conversation,
    required this.onTapPin,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(conversation),
      isDraggable: !conversation.isSystem,
      trailingActions: [
        SwipeAction(
          color: Colors.red,
          widthSpace: 80.pt,
          onTap: (CompletionHandler handler) async {
            onTapDelete.call(conversation);
          },
          content: Padding(
            padding: EdgeInsets.all(8.pt),
            child: AutoSizeText(
              'kekokuki_delete'.tr,
              minFontSize: 8,
              textAlign: TextAlign.center,
              style: KekokukiStyles.s12w400.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SwipeAction(
          color: rgba(91, 114, 225, 1),
          widthSpace: 80.pt,
          onTap: (CompletionHandler handler) async {
            onTapPin.call(conversation);
          },
          content: Padding(
            padding: EdgeInsets.all(8.pt),
            child: AutoSizeText(
              conversation.isPined ? 'kekokuki_unpin'.tr : 'kekokuki_pin'.tr,
              minFontSize: 8,
              textAlign: TextAlign.center,
              style: KekokukiStyles.s12w400.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
      child: Container(
        height: 80.pt,
        padding: EdgeInsets.symmetric(horizontal: 15.pt, vertical: 10.pt),
        decoration: BoxDecoration(
          color: conversation.isPined ? Colors.black12 : Colors.white,
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final nickname = conversation.isSystem ? 'kekokuki_system_message'.tr : conversation.nickname;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAvatar(),
        SizedBox(width: 10.pt),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    nickname,
                    style: KekokukiStyles.s14w600.copyWith(
                      color: KekokukiColors.primaryTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Visibility(
                visible: conversation.summary.isNotEmpty,
                child: Text(
                  conversation.summary,
                  style: KekokukiStyles.s12w400.copyWith(
                    color: KekokukiColors.primaryTextColor.withOpacity(0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).marginOnly(top: 4.pt),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.pt),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              KekokukiFormatUtil.millisecondsToTime(conversation.timestamp),
              style: KekokukiStyles.s12w400.copyWith(
                color: KekokukiColors.primaryTextColor.withOpacity(0.6),
                height: 1.4,
              ),
            ),
            Visibility(
              visible: conversation.unreadCount > 0,
              child: Container(
                height: 14.pt,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 4.5.pt),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.pt),
                ),
                child: Text(
                  '${conversation.unreadCount}',
                  style: KekokukiStyles.s10w400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ).marginOnly(top: 6.pt),
            )
          ],
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return KekokukiRoundImageWidget(
      conversation.isSystem ? Assets.imagesCommonKekokukiAvatarSystem : conversation.portrait,
      width: 50.pt,
      height: 50.pt,
      isCircle: true,
      placeholder: Assets.imagesCommonKekokukiAvatarAnchor,
    );
  }
}
