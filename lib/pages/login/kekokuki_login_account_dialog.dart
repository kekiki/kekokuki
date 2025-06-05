import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

import '../../common/widgets/kekokuki_button_widget.dart';
import '../../services/styles/kekokuki_styles.dart';

class KekokukiLoginAccountDialog extends StatelessWidget {
  const KekokukiLoginAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = '';
    String password = '';
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 375.pt,
        padding: EdgeInsets.all(15.pt),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.pt),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Account Login',
              style: KekokukiStyles.s18w700,
            ),
            SizedBox(height: 15.pt),
            Container(
              width: 339.pt,
              height: 46.pt,
              padding: EdgeInsets.symmetric(horizontal: 12.pt),
              decoration: BoxDecoration(
                color: KekokukiColors.cardColor,
                borderRadius: BorderRadius.circular(6.pt),
              ),
              child: TextField(
                maxLines: 1,
                autofocus: true,
                cursorColor: KekokukiColors.primaryColor,
                keyboardType: TextInputType.number,
                style: KekokukiStyles.s14w400,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'UserId',
                  hintStyle: KekokukiStyles.s14w400.copyWith(
                    color: KekokukiColors.grayTextColor,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  userId = value;
                },
              ),
            ),
            SizedBox(height: 10.pt),
            Container(
              width: 339.pt,
              height: 46.pt,
              padding: EdgeInsets.symmetric(horizontal: 12.pt),
              decoration: BoxDecoration(
                color: KekokukiColors.cardColor,
                borderRadius: BorderRadius.circular(6.pt),
              ),
              child: TextField(
                maxLines: 1,
                cursorColor: KekokukiColors.primaryColor,
                keyboardType: TextInputType.text,
                style: KekokukiStyles.s14w400,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: KekokukiStyles.s14w400.copyWith(
                    color: KekokukiColors.grayTextColor,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  password = value;
                },
                onSubmitted: (value) {
                  Get.back(
                    result: {
                      'userId': userId,
                      'password': password,
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 15.pt),
            KekokukiButtonWidget(
              onPressed: () {
                Get.back(
                  result: {
                    'userId': userId,
                    'password': password,
                  },
                );
              },
              width: 200.pt,
              height: 44.pt,
              borderRadius: 22.pt,
              backgroundColor: KekokukiColors.primaryColor,
              child: Text(
                'Login',
                style: KekokukiStyles.s16w700.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
