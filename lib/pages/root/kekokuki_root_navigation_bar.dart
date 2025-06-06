import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/generated/assets.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

import '../../common/adapts/kekokuki_screen_adapt.dart';
import '../../services/styles/kekokuki_styles.dart';
import 'kekokuki_root_state.dart';

class KekokukiRootNavigationBar extends StatelessWidget {
  const KekokukiRootNavigationBar({
    super.key,
    required this.selectedType,
    required this.onTapTab,
    this.messageCount = 0,
  });

  final int messageCount;
  final KekokukiRootTabType selectedType;
  final ValueChanged<KekokukiRootTabType> onTapTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ItemTab(
            iconNormal: Assets.imagesTabsKekokukiTab1Normal,
            iconSelected: Assets.imagesTabsKekokukiTab1Selected,
            title: 'kekokuki_discover'.tr,
            isSelected: selectedType == KekokukiRootTabType.anchors,
            onTap: () => onTapTab(KekokukiRootTabType.anchors),
          ),
          _ItemTab(
            iconNormal: Assets.imagesTabsKekokukiTab2Normal,
            iconSelected: Assets.imagesTabsKekokukiTab2Selected,
            title: 'kekokuki_match'.tr,
            isSelected: selectedType == KekokukiRootTabType.match,
            onTap: () => onTapTab(KekokukiRootTabType.match),
          ),
          _ItemTab(
            iconNormal: Assets.imagesTabsKekokukiTab2Normal,
            iconSelected: Assets.imagesTabsKekokukiTab2Selected,
            title: 'kekokuki_moment'.tr,
            isSelected: selectedType == KekokukiRootTabType.moment,
            onTap: () => onTapTab(KekokukiRootTabType.moment),
          ),
          _ItemTab(
            iconNormal: Assets.imagesTabsKekokukiTab3Normal,
            iconSelected: Assets.imagesTabsKekokukiTab3Selected,
            title: 'kekokuki_chat'.tr,
            isSelected: selectedType == KekokukiRootTabType.chat,
            count: messageCount,
            onTap: () => onTapTab(KekokukiRootTabType.chat),
          ),
          _ItemTab(
            iconNormal: Assets.imagesTabsKekokukiTab4Normal,
            iconSelected: Assets.imagesTabsKekokukiTab4Selected,
            title: 'kekokuki_mine'.tr,
            isSelected: selectedType == KekokukiRootTabType.mine,
            onTap: () => onTapTab(KekokukiRootTabType.mine),
          ),
        ],
      ),
    );
  }
}

class _ItemTab extends StatelessWidget {
  const _ItemTab({
    required this.iconNormal,
    required this.iconSelected,
    required this.title,
    required this.isSelected,
    this.count = 0,
    this.onTap,
  });

  final String iconNormal;
  final String iconSelected;
  final String title;
  final bool isSelected;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final String icon;
    final Color textColor;
    final unreadText = count <= 99 ? count.toString() : "99+";
    if (isSelected) {
      icon = iconSelected;
      textColor = KekokukiColors.primaryTextColor;
    } else {
      icon = iconNormal;
      textColor = KekokukiColors.grayTextColor;
    }
    return SizedBox(
      width: 75.pt,
      height: 50.pt,
      child: Stack(
        children: [
          Positioned.fill(
            child: IconButton(
              onPressed: onTap,
              padding: EdgeInsets.zero,
              splashRadius: 25.pt,
              iconSize: 50.pt,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icon,
                    width: 24.pt,
                    height: 24.pt,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 4.pt),
                  Text(
                    title,
                    style: KekokukiStyles.s10w500.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: Visibility(
              visible: count > 0,
              child: Row(
                children: [
                  const Spacer(flex: 5),
                  Container(
                    height: 14.pt,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 4.5.pt),
                    decoration: BoxDecoration(
                      color: KekokukiColors.accentColor,
                      borderRadius: BorderRadius.circular(8.pt),
                    ),
                    child: Text(
                      unreadText,
                      style: KekokukiStyles.s10w400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
