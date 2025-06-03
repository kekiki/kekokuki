import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

class KekokukiRefreshFooter extends ClassicFooter {
  const KekokukiRefreshFooter({
    super.key,
    super.triggerOffset = 44,
    super.clamping = false,
    super.position,
    super.processedDuration = Duration.zero,
    super.spring,
    super.readySpringBuilder,
    super.springRebound,
    super.frictionFactor,
    super.safeArea,
    super.infiniteOffset = 44,
    super.hitOver,
    super.infiniteHitOver,
    super.hapticFeedback,
    super.triggerWhenReach,
    super.triggerWhenRelease,
    super.maxOverOffset,
    super.showMessage = false,
    super.dragText,
    super.armedText,
    super.readyText,
    super.noMoreText,
    super.processingText,
    super.processedText,
    super.failedText,
  });

  factory KekokukiRefreshFooter.classic() => KekokukiRefreshFooter(
        dragText: 'kekokuki_pull_load'.tr,
        armedText: 'kekokuki_release_ready'.tr,
        readyText: 'kekokuki_loading'.tr,
        processingText: 'kekokuki_loading'.tr,
        processedText: 'kekokuki_succeeded'.tr,
        noMoreText: 'kekokuki_no_more_text'.tr,
        failedText: 'kekokuki_failed'.tr,
      );
}
