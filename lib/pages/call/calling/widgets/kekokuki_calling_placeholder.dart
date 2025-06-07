import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/generated/assets.dart';

import '../../../../common/widgets/kekokuki_round_image_widget.dart';

class KekokukiCallingPlaceholder extends StatelessWidget {
  const KekokukiCallingPlaceholder({
    super.key,
    required this.avatar,
    this.fullScreen = false,
    this.isSelf = false,
  });

  final String avatar;
  final bool fullScreen;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    final size = fullScreen ? 98.pt : 58.pt;
    final color = fullScreen ? const Color(0xEB323339) : const Color(0xD95D5F68);
    return Stack(
      fit: StackFit.expand,
      children: [
        KekokukiRoundImageWidget(
          avatar,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.cover,
          placeholderWidget: _buildPlaceHolder(true),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: color,
              width: size,
              height: size,
              alignment: Alignment.center,
              child: ClipOval(
                child: KekokukiRoundImageWidget(
                  avatar,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  placeholderWidget: _buildPlaceHolder(false),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceHolder(bool isBackground) {
    final size = isBackground ? 98.pt : 58.pt;
    return Image.asset(
      isSelf ? Assets.imagesCommonKekokukiAvatarUser : Assets.imagesCommonKekokukiAvatarAnchor,
      width: isBackground ? double.infinity : size,
      height: isBackground ? double.infinity : size,
      fit: BoxFit.cover,
    );
  }
}
