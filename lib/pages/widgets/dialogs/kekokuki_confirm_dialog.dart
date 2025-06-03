import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/framework/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

import '../../../services/styles/kekokuki_styles.dart';

class KekokukiConfirmDialog extends StatelessWidget {
  const KekokukiConfirmDialog({
    super.key,
    this.title,
    required this.content,
    this.textAlign,
    this.confirm,
    this.cancel,
    this.onlyConfirm = false,
  });

  final String? title;
  final String content;
  final String? confirm;
  final String? cancel;
  final TextAlign? textAlign;
  final bool onlyConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.pt),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.pt),
      ),
      padding: EdgeInsets.symmetric(vertical: 24.pt, horizontal: 18.pt),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: title != null,
            child: Text(
              title ?? "",
              style: KekokukiStyles.s18w700,
            ),
          ),
          SizedBox(height: 14.pt),
          Text(
            content,
            textAlign: textAlign ?? TextAlign.center,
            style: KekokukiStyles.s14w400.copyWith(
              color: KekokukiColors.primaryTextColor.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 32.pt),
          Visibility(
            visible: onlyConfirm,
            replacement: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(result: false),
                    child: Container(
                      height: 42.pt,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: KekokukiColors.primaryColor),
                        borderRadius: BorderRadius.circular(21.pt),
                      ),
                      child: Text(
                        cancel ?? 'kekokuki_cancel'.tr,
                        style: KekokukiStyles.s16w700.copyWith(
                          color: KekokukiColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14.pt),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(result: true),
                    child: Container(
                      height: 42.pt,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: KekokukiColors.primaryColor,
                        borderRadius: BorderRadius.circular(21.pt),
                      ),
                      child: Text(
                        confirm ?? 'kekokuki_confirm'.tr,
                        style: KekokukiStyles.s16w700.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () => Get.back(result: true),
              child: Container(
                height: 42.pt,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: KekokukiColors.primaryColor,
                  borderRadius: BorderRadius.circular(21.pt),
                ),
                child: Text(
                  confirm ?? 'kekokuki_confirm'.tr,
                  style: KekokukiStyles.s16w700.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
