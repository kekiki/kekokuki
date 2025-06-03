import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/framework/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/generated/assets.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

import '../../../services/styles/kekokuki_styles.dart';

class KekokukiTopupToAccountDialog extends StatelessWidget {
  const KekokukiTopupToAccountDialog({
    super.key,
    required this.diamonds,
    required this.vipDays,
    required this.cardNum,
  });

  final int diamonds;
  final int vipDays;
  final int cardNum;

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
          Container(
            height: 102.pt,
            padding: EdgeInsets.symmetric(horizontal: 15.pt),
            decoration: BoxDecoration(
              color: KekokukiColors.cardColor,
              borderRadius: BorderRadius.circular(8.pt),
            ),
            child: Row(
              children: [
                const Spacer(),
                Visibility(
                  visible: diamonds > 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesCommonKekokukiDiamond,
                        width: 40.pt,
                        height: 40.pt,
                      ),
                      SizedBox(height: 6.pt),
                      Text(
                        '$diamonds',
                        style: KekokukiStyles.s16w400,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: diamonds > 0 && vipDays > 0,
                  child: const Spacer(),
                ),
                Visibility(
                  visible: diamonds > 0 && vipDays > 0,
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 26.pt,
                      fontWeight: FontWeight.w300,
                      color: KekokukiColors.grayTextColor,
                    ),
                  ),
                ),
                Visibility(
                  visible: diamonds > 0 && vipDays > 0,
                  child: const Spacer(),
                ),
                Visibility(
                  visible: vipDays > 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.pt,
                        alignment: Alignment.center,
                        child: Text(
                          'kekokuki_vip'.tr,
                          style: KekokukiStyles.s22w700.copyWith(
                            color: KekokukiColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.pt),
                      Text(
                        'kekokuki_%s_days'.trArgs(['$vipDays']),
                        style: KekokukiStyles.s16w400,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: (diamonds > 0 || vipDays > 0) && cardNum > 0,
                  child: const Spacer(),
                ),
                Visibility(
                  visible: (diamonds > 0 || vipDays > 0) && cardNum > 0,
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 26.pt,
                      fontWeight: FontWeight.w300,
                      color: KekokukiColors.grayTextColor,
                    ),
                  ),
                ),
                Visibility(
                  visible: (diamonds > 0 || vipDays > 0) && cardNum > 0,
                  child: const Spacer(),
                ),
                Visibility(
                  visible: cardNum > 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: 40.pt,
                      //   child: Center(
                      //     child: Image.asset(
                      //       Assets.imagesKekokukiCard,
                      //       width: 40.pt,
                      //       height: 26.pt,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 6.pt),
                      Text(
                        'x$cardNum',
                        style: KekokukiStyles.s16w400,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          SizedBox(height: 32.pt),
          GestureDetector(
            onTap: Get.back,
            child: Container(
              height: 42.pt,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30.pt),
              decoration: BoxDecoration(
                color: KekokukiColors.primaryColor,
                borderRadius: BorderRadius.circular(21.pt),
              ),
              child: Text(
                'kekokuki_got_it'.tr,
                style: KekokukiStyles.s16w700.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
