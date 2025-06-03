import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

class KekokukiRefreshHeader extends ClassicHeader {
  const KekokukiRefreshHeader({
    super.key,
    super.triggerOffset = 44,
    super.clamping = false,
    super.position = IndicatorPosition.behind,
    super.processedDuration = const Duration(seconds: 1),
    super.spring,
    super.readySpringBuilder,
    super.springRebound = true,
    super.frictionFactor,
    super.safeArea = true,
    super.infiniteOffset,
    super.hitOver,
    super.infiniteHitOver,
    super.hapticFeedback = false,
    super.triggerWhenReach = false,
    super.triggerWhenRelease = false,
    super.maxOverOffset = double.infinity,
    super.showMessage = false,
    super.dragText,
    super.armedText,
    super.readyText,
    super.noMoreText,
    super.processingText,
    super.processedText,
    super.failedText,
  });

  factory KekokukiRefreshHeader.classic() => KekokukiRefreshHeader(
        dragText: 'kekokuki_pull_refresh'.tr,
        armedText: 'kekokuki_release_ready'.tr,
        readyText: 'kekokuki_refreshing'.tr,
        processingText: 'kekokuki_refreshing'.tr,
        processedText: 'kekokuki_succeeded'.tr,
        noMoreText: 'kekokuki_no_more_text'.tr,
        failedText: 'kekokuki_failed'.tr,
      );
}
