import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';

import '../../../../services/styles/kekokuki_colors.dart';
import '../../services/kekokuki_call_model.dart';
import '../kekokuki_calling_page_controller.dart';
import '../kekokuki_calling_state.dart';
import 'kekokuki_calling_aiv_widget.dart';

class KekokukiCallingVideoWidget extends StatelessWidget {
  final KekokukiCallingPageController _controller;
  KekokukiCallingState get state => _controller.state;
  const KekokukiCallingVideoWidget(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: StreamBuilder<Widget>(
            initialData: _controller.initFullScreenPlaceholder,
            stream: _controller.fullScreenWidgetStream,
            builder: (context, snapshot) {
              return snapshot.requireData;
            },
          ),
        ),
        Positioned.fill(
          child: state.callModel.callType == KekokukiCallType.aiv
              ? KekokukiCallingAivWidget(
                  videoUri: state.callModel.aivModel!.videoUrl,
                  onPlayProgress: _controller.onAivPlayProgress,
                  onPlayEnd: _controller.onAivPlayEnd,
                  onPlayFailed: _controller.onAivPlayFailed,
                )
              : const SizedBox.shrink(),
        ),
        PositionedDirectional(
          start: 15.pt,
          end: 15.pt,
          bottom: 30.pt,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: _controller.onTapSwitchCamera,
                icon: const Icon(Icons.camera, size: 30),
              ),
              Obx(() {
                final isStartCamera = state.isStartCameraObs.value;
                final icon = isStartCamera ? const Icon(Icons.camera, size: 30) : const Icon(Icons.close, size: 30);
                return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _controller.onTapCamera,
                  icon: icon,
                );
              }),
              Obx(() {
                final isVoiceEnable = state.isVoiceEnableObs.value;
                final icon = isVoiceEnable ? const Icon(Icons.phone_enabled, size: 30) : const Icon(Icons.phone_disabled, size: 30);
                return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _controller.onTapVoice,
                  icon: icon,
                );
              }),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: _controller.onTapTopup,
                icon: const Icon(Icons.diamond, size: 30),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: _controller.onTapGift,
                icon: Container(
                  width: 54.pt,
                  height: 54.pt,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: rgba(0, 0, 0, 0.5),
                    borderRadius: BorderRadiusDirectional.circular(27.pt),
                  ),
                  child: const Icon(Icons.card_giftcard, size: 30),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => PositionedDirectional(
            top: state.smallScreenTop.value,
            end: state.smallScreenEnd.value,
            width: state.smallScreenWidth,
            height: state.smallScreenHeight,
            child: GestureDetector(
              onTap: _controller.onTapSmallPreview,
              onPanUpdate: (details) => _controller.updateOffsets(details.delta),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.pt),
                child: StreamBuilder<Widget>(
                  initialData: _controller.initSmallScreenPlaceholder,
                  stream: _controller.smallScreenWidgetStream,
                  builder: (context, snapshot) {
                    return snapshot.requireData;
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
