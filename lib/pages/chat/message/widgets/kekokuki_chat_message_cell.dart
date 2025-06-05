import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/generated/assets.dart';
import 'package:lottie/lottie.dart';

import '../../../../common/widgets/kekokuki_round_image_widget.dart';
import '../../../../services/styles/kekokuki_colors.dart';
import '../../../../services/styles/kekokuki_styles.dart';
import '../kekokuki_chat_message_model.dart';

class KekokukiChatMessageCell extends StatelessWidget {
  const KekokukiChatMessageCell({
    super.key,
    required this.message,
    required this.tapUserAvatar,
    required this.tapAnchorAvatar,
    required this.onTapResend,
    this.onTapMessage,
    this.showBackground = true,
    required this.userAvatar,
    required this.anchorAvatar,
  });

  final String userAvatar;
  final String anchorAvatar;
  final KekokukiChatMessageModel message;
  final VoidCallback? tapUserAvatar;
  final VoidCallback? tapAnchorAvatar;
  final ValueChanged<KekokukiChatMessageModel>? onTapMessage;
  final ValueChanged<KekokukiChatMessageModel> onTapResend;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: message.isShowTime,
          child: Text(
            message.sentTime,
            style: KekokukiStyles.s12w400.copyWith(
              color: KekokukiColors.primaryTextColor.withOpacity(0.6),
            ),
          ).marginOnly(bottom: 8.pt),
        ),
        GestureDetector(
          onTap: () => onTapMessage?.call(message),
          child: _buildBaseView(),
        ),
        SizedBox(height: 18.pt),
      ],
    );
  }

  Widget _buildBaseView() {
    if (message.isSelfSent) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Visibility(
                visible: message.status == KekokukiMessageStatus.sending,
                replacement: Visibility(
                  visible: message.status == KekokukiMessageStatus.sendFailed,
                  child: IconButton(
                    iconSize: 34.pt,
                    padding: EdgeInsets.zero,
                    onPressed: () => onTapResend(message),
                    icon: Icon(Icons.error, size: 22.pt, color: Colors.red),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.pt),
                  child: Lottie.asset(
                    Assets.animatesKekokukiChatMessageLoading,
                    width: 22.pt,
                    height: 22.pt,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: showBackground ? EdgeInsets.all(10.pt) : EdgeInsets.zero,
                constraints: BoxConstraints(minHeight: 32.pt),
                decoration: showBackground
                    ? BoxDecoration(
                        color: KekokukiColors.primaryColor,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(8.pt),
                          topEnd: Radius.zero,
                          bottomStart: Radius.circular(8.pt),
                          bottomEnd: Radius.circular(8.pt),
                        ),
                      )
                    : null,
                child: _buildChildWidget(),
              ),
            ],
          ),
          SizedBox(width: 6.pt),
          FittedBox(
            child: GestureDetector(
              onTap: tapUserAvatar,
              child: KekokukiRoundImageWidget(
                userAvatar,
                width: 40.pt,
                height: 40.pt,
                isCircle: true,
                placeholder: Assets.imagesCommonKekokukiAvatarUser,
              ),
            ),
          ),
          SizedBox(width: 15.pt),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 15.pt),
        GestureDetector(
          onTap: tapAnchorAvatar,
          child: KekokukiRoundImageWidget(
            anchorAvatar,
            width: 40.pt,
            height: 40.pt,
            isCircle: true,
            placeholder: Assets.imagesCommonKekokukiAvatarAnchor,
          ),
        ),
        SizedBox(width: 6.pt),
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: showBackground ? EdgeInsets.all(10.pt) : EdgeInsets.zero,
          constraints: BoxConstraints(minHeight: 32.pt),
          decoration: showBackground
              ? BoxDecoration(
                  color: KekokukiColors.cardColor,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.zero,
                    topEnd: Radius.circular(8.pt),
                    bottomStart: Radius.circular(8.pt),
                    bottomEnd: Radius.circular(8.pt),
                  ),
                )
              : null,
          child: _buildChildWidget(),
        ),
      ],
    );
  }

  Widget _buildChildWidget() {
    switch (message.messageType) {
      case KekokukiMessageType.text:
      case KekokukiMessageType.chatScript:
        return _buildTextView();
      case KekokukiMessageType.image:
        return _buildImageView();
      case KekokukiMessageType.video:
        return _buildVideoView();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTextView() {
    final textColor = message.isSelfSent ? Colors.white : KekokukiColors.primaryTextColor;
    return Container(
      constraints: BoxConstraints(maxWidth: 250.pt),
      child: SelectableText(
        message.text,
        style: KekokukiStyles.s14w400.copyWith(
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildImageView() {
    return KekokukiRoundImageWidget(
      message.imageModel.imageUrl,
      width: 100.pt,
      height: 120.pt,
      borderRadius: BorderRadiusDirectional.circular(8.pt),
    );
  }

  Widget _buildVideoView() {
    return Stack(
      children: [
        KekokukiRoundImageWidget(
          message.videoModel.coverUrl,
          width: 100.pt,
          height: 120.pt,
          borderRadius: BorderRadiusDirectional.circular(8.pt),
        ),
        Center(child: Image.asset(Assets.imagesCommonKekokukiVideoPlay, width: 30)),
        Text('${message.videoModel.videoSeconds}s', style: KekokukiStyles.s10w400),
      ],
    );
  }
}
