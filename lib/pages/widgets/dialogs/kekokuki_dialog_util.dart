import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class KekokukiDialogUtil {
  static Future<T?> showDialog<T>(Widget dialog, {String? name, Object? arguments}) async {
    return await Get.dialog(
      dialog,
      name: name,
      routeSettings: RouteSettings(name: name, arguments: arguments),
    );
  }

  static Future<T?> bottomSheet<T>(Widget bottomSheet, {String? name, Object? arguments}) async {
    return await Get.bottomSheet(
      bottomSheet,
      settings: RouteSettings(name: name, arguments: arguments),
      isScrollControlled: true,
    );
  }
}
