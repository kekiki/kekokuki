import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class KekokukiDialogUtil {
  // 用bottom sheet显示，利用一下bottomSheet动画
  static Future<T?> showDialog<T>(Widget dialog, {String? name, Object? arguments}) async {
    return await Get.bottomSheet(
      Container(
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,
        child: dialog,
      ),
      settings: RouteSettings(name: name, arguments: arguments),
      isScrollControlled: true,
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 300),
    );
  }
}
