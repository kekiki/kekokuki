import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/generated/assets.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

import 'kekokuki_status.dart';

enum KekokukiPageType {
  common,
  person,
  gift,
}

class KekokukiStatusPage extends StatelessWidget {
  final KekokukiStatus status;
  final KekokukiPageType pageType;

  /// only used when status is error and errorBuilder is not provided
  final void Function()? onReload;

  const KekokukiStatusPage({
    super.key,
    required this.status,
    this.pageType = KekokukiPageType.common,
    this.onReload,
  });

  KekokukiStatusPage.emptyPerson({super.key})
      : status = KekokukiStatus.empty(),
        pageType = KekokukiPageType.person,
        onReload = null;

  KekokukiStatusPage.emptyGift({super.key})
      : status = KekokukiStatus.empty(),
        pageType = KekokukiPageType.gift,
        onReload = null;

  @override
  Widget build(BuildContext context) {
    if (status.isEmpty) {
      if (pageType == KekokukiPageType.person) {
        return Center(child: Image.asset(Assets.imagesCommonKekokukiStatusEmptyPerson, width: 212.pt));
      } else if (pageType == KekokukiPageType.gift) {
        return Center(child: Image.asset(Assets.imagesCommonKekokukiStatusEmptyGift, width: 212.pt));
      }
      return Center(child: Image.asset(Assets.imagesCommonKekokukiStatusEmpty, width: 212.pt));
    } else if (status.isError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesCommonKekokukiStatusError, width: 212.pt),
            SizedBox(
              height: 34.pt,
              child: ElevatedButton(
                onPressed: onReload,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(KekokukiColors.primaryColor),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16.pt)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.pt))),
                ),
                child: Text('kekokuki_reload'.tr),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
