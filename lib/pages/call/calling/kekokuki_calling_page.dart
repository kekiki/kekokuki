import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/widgets/kekokuki_app_scaffold.dart';

import '../../../common/widgets/kekokuki_round_image_widget.dart';
import 'kekokuki_calling_page_controller.dart';
import 'kekokuki_calling_state.dart';
import 'widgets/kekokuki_calling_title_bar.dart';
import 'widgets/kekokuki_calling_video_widget.dart';

class KekokukiCallingPage extends GetView<KekokukiCallingPageController> {
  KekokukiCallingState get state => controller.state;
  const KekokukiCallingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      isAllowBack: false,
      onBackPressed: controller.onTapClose,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: KekokukiRoundImageWidget(
              state.callModel.anchor.portrait,
              placeholderWidget: Container(),
              width: Get.width,
              height: Get.height,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(),
            ),
          ),
          Positioned.fill(child: KekokukiCallingVideoWidget(controller)),
          Positioned.fill(
            child: Container(
              alignment: Alignment.topCenter,
              child: Obx(
                () => KekokukiCallingTitleBar(
                  callModel: state.callModel,
                  callingDuration: state.callingDurationObs.value,
                  onTapClose: controller.onTapClose,
                ),
              ),
            ),
          ),
          // const Positioned.fill(
          //   child: KekokukiGiftAnimatePage(),
          // ),
        ],
      ),
    );
  }
}
