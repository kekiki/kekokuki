import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/generated/assets.dart';

import '../../common/adapts/kekokuki_screen_adapt.dart';
import '../../services/styles/kekokuki_styles.dart';
import 'kekokuki_root_controller.dart';

class KekokukiRootNavigationBar extends StatelessWidget {
  const KekokukiRootNavigationBar(this._controller, {super.key});
  final KekokukiRootController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: kBottomNavigationBarHeight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _controller.rootTabs.map((tab) {
          switch (tab) {
            case KekokukiRootTab.anchors:
              return _ItemTab(
                iconNormal: Assets.imagesTabsKekokukiTabAnchorN,
                iconSelected: Assets.imagesTabsKekokukiTabAnchorS,
                isSelected: _controller.selectedTab == KekokukiRootTab.anchors,
                onTap: () => _controller.onTapTab(KekokukiRootTab.anchors),
              );
            case KekokukiRootTab.match:
              return _ItemTab(
                iconNormal: Assets.imagesTabsKekokukiTabMatchN,
                iconSelected: Assets.imagesTabsKekokukiTabMatchS,
                isSelected: _controller.selectedTab == KekokukiRootTab.match,
                onTap: () => _controller.onTapTab(KekokukiRootTab.match),
              );
            case KekokukiRootTab.moment:
              return _ItemTab(
                iconNormal: Assets.imagesTabsKekokukiTabMomentN,
                iconSelected: Assets.imagesTabsKekokukiTabMomentS,
                isSelected: _controller.selectedTab == KekokukiRootTab.moment,
                onTap: () => _controller.onTapTab(KekokukiRootTab.moment),
              );
            case KekokukiRootTab.chat:
              return _ItemTab(
                iconNormal: Assets.imagesTabsKekokukiTabChatN,
                iconSelected: Assets.imagesTabsKekokukiTabChatS,
                count: _controller.dataStatus.isSuccess ? _controller.unReadMessageNum : 0,
                isSelected: _controller.selectedTab == KekokukiRootTab.chat,
                onTap: () => _controller.onTapTab(KekokukiRootTab.chat),
              );
            case KekokukiRootTab.mine:
              return _ItemTab(
                iconNormal: Assets.imagesTabsKekokukiTabMineN,
                iconSelected: Assets.imagesTabsKekokukiTabMineS,
                isSelected: _controller.selectedTab == KekokukiRootTab.mine,
                onTap: () => _controller.onTapTab(KekokukiRootTab.mine),
              );
          }
        }).toList(),
      ),
    );
  }
}

class _ItemTab extends StatelessWidget {
  const _ItemTab({
    required this.iconNormal,
    required this.iconSelected,
    required this.isSelected,
    this.count = 0,
    this.onTap,
  });

  final String iconNormal;
  final String iconSelected;
  final bool isSelected;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final String icon = isSelected ? iconSelected : iconNormal;
    final unreadText = count <= 99 ? count.toString() : "99+";
    return Container(
      width: 40.pt,
      height: 40.pt,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.pt)),
      child: Stack(
        children: [
          Positioned.fill(
            child: IconButton(
              onPressed: onTap,
              padding: EdgeInsets.zero,
              splashRadius: 25.pt,
              iconSize: 50.pt,
              icon: Image.asset(icon, fit: BoxFit.cover),
            ),
          ),
          PositionedDirectional(
            top: 2,
            end: 0,
            child: Visibility(
              visible: count > 0,
              child: Container(
                height: 14.pt,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 4.5.pt),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.pt),
                  border: Border.all(color: Colors.white),
                ),
                child: Text(
                  unreadText,
                  style: KekokukiStyles.s10w400.copyWith(
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
