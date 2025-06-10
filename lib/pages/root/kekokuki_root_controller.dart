import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:kekokuki/common/utils/kekokuki_log_util.dart';
import 'package:kekokuki/pages/widgets/dialogs/kekokuki_confirm_dialog.dart';
import 'package:kekokuki/pages/widgets/dialogs/kekokuki_dialog_util.dart';

import '../../services/config/kekokuki_config_model.dart';
import '../../services/profile/kekokuki_profile_model.dart';
import '../../services/profile/kekokuki_profile_service.dart';
import '../../services/config/kekokuki_config_service.dart';
import '../../services/rtm&rtc/kekokuki_rtm_service.dart';
import '../chat/conversation/kekokuki_chat_conversation_mixin.dart';
import '../chat/conversation/kekokuki_chat_conversation_page.dart';
import '../explore/kekokuki_explore_page.dart';
import '../match/kekokuki_match_page.dart';
import '../mine/kekokuki_mine_page.dart';
import '../moment/list/kekokuki_moment_list_page.dart';
import '../widgets/status_page/kekokuki_status.dart';
import '../widgets/status_page/kekokuki_status_builder_mixin.dart';

enum KekokukiRootTab {
  anchors,
  match,
  moment,
  chat,
  mine;

  Widget get page {
    switch (this) {
      case KekokukiRootTab.anchors:
        return const KekokukiExplorePage();
      case KekokukiRootTab.match:
        return const KekokukiMatchPage();
      case KekokukiRootTab.moment:
        return const KekokukiMomentListPage();
      case KekokukiRootTab.chat:
        return const KekokukiChatConversationPage();
      case KekokukiRootTab.mine:
        return const KekokukiMinePage();
    }
  }
}

// const kBuildIdSkeleton = 'kBuildIdSkeleton';
const kBuildIdPages = 'kBuildIdPages';
const kBuildIdBottomBar = 'kBuildIdBottomBar';

class KekokukiRootController extends GetxController with KekokukiChatConversationMixin, KekokukiStatusBuilderMixin {
  KekokukiRootTab selectedTab = KekokukiRootTab.anchors;
  int unReadMessageNum = 0;
  List<KekokukiRootTab> rootTabs = [];
  KekokukiStatus dataStatus = KekokukiStatus.loading();

  @override
  void onInit() {
    rootTabs.addAll(KekokukiRootTab.values);
    addUnreadCountListener(onUnreadMessageNumChanged);
    super.onInit();
  }

  @override
  void onReady() {
    _setupServices();
    super.onReady();
  }

  @override
  void onClose() {
    removeUnreadCountListener();
    super.onClose();
  }

  Future<void> _setupServices() async {
    try {
      final config = await Get.find<KekokukiConfigService>().fetchConfig();
      final profile = await Get.find<KekokukiProfileService>().fetchProfile();
      if (config != null && profile != null) {
        initRootTabsPosition(config, profile);
        Get.find<KekokukiRtmService>().connect();
        dataStatus = KekokukiStatus.success();
      } else {
        dataStatus = KekokukiStatus.error('kekokuki_no_network'.tr);
      }
    } catch (e) {
      dataStatus = KekokukiStatus.error(e.toString());
    } finally {
      // update([kBuildIdSkeleton]);
      updateStatus(dataStatus);
    }
  }

  void onReload() {
    dataStatus = KekokukiStatus.loading();
    updateStatus(dataStatus);
    Future.delayed(const Duration(seconds: 1), () {
      _setupServices();
    });
  }

  void initRootTabsPosition(KekokukiConfigModel config, KekokukiProfileModel profile) {
    try {
      if (config.initMainPosition.isEmpty) return;
      final Map<String, dynamic> map = json.decode(config.initMainPosition);
      final String countryCode = '${profile.countryCode}';
      if (map.containsKey(countryCode)) {
        int firstPositionValue = KekokukiRootTab.values.first.index;
        final value = map[countryCode];
        if (value is int) {
          firstPositionValue = value;
        } else if (value is String) {
          firstPositionValue = int.tryParse(value) ?? KekokukiRootTab.values.first.index;
        }

        if (firstPositionValue < KekokukiRootTab.values.length) {
          final movePosition = rootTabs.where((element) => element.index == firstPositionValue).first;
          // 根据逻辑调整页面顺序
          rootTabs.removeWhere((element) => element == movePosition);
          rootTabs.insert(0, movePosition);
          selectedTab = movePosition;
        }
      }
    } catch (e, s) {
      KekokukiLogUtil.e('HomeController', 'root tabs config error: $e', s);
    }
  }

  void onUnreadMessageNumChanged(int? count) {
    KekokukiLogUtil.i('HomeController', 'unread message count: $count');
    unReadMessageNum = count ?? 0;
    update([kBuildIdBottomBar]);
  }

  void onBack() async {
    // Bring app to home screen when back button is pressed
    final result = await KekokukiDialogUtil.showDialog(KekokukiConfirmDialog(content: 'kekokuki_exit_app_tips'.tr));
    if (result == 1) {
      exit(0);
    }
  }

  void onTapTab(KekokukiRootTab tabType) async {
    selectedTab = tabType;
    update([kBuildIdPages, kBuildIdBottomBar]);
  }
}
