import 'package:get/get.dart';

/// 屏幕适配
///
////// 根据设计稿的宽度进行适配
const double _designWidth = 375;

extension KekokukiScreenAdaptExt on num {
  double get pt => toDouble() * Get.width / _designWidth;
}
