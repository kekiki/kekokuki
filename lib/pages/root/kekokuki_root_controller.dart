import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

import 'package:kekokuki/common/utils/kekokuki_log_util.dart';
import 'package:kekokuki/pages/widgets/dialogs/kekokuki_confirm_dialog.dart';
import 'package:kekokuki/pages/widgets/dialogs/kekokuki_dialog_util.dart';

import '../../services/profile/kekokuki_profile_service.dart';
import '../../services/config/kekokuki_config_service.dart';
import '../../services/rtm&rtc/kekokuki_rtm_service.dart';
import '../chat/conversation/kekokuki_chat_conversation_mixin.dart';
import '../login/kekokuki_login_service.dart';

enum KekokukiRootTab {
  anchors,
  match,
  moment,
  chat,
  mine,
}

const kBuildIdPages = 'kBuildIdPages';
const kBuildIdBottomBar = 'kBuildIdBottomBar';

class KekokukiRootController extends GetxController with KekokukiChatConversationMixin {
  KekokukiRootTab selectedTab = KekokukiRootTab.anchors;
  int unReadMessageNum = 0;
  List<KekokukiRootTab> rootTabs = [];

  @override
  void onInit() {
    rootTabs = KekokukiRootTab.values;
    addUnreadCountListener(onUnreadMessageNumChanged);
    initRootTabsPosition();
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
    final loginService = Get.find<KekokukiLoginService>();
    if (!loginService.isInitServices) await loginService.initServices();
    await Get.find<KekokukiRtmService>().connect();
  }

  void initRootTabsPosition() {
    try {
      final config = Get.find<KekokukiConfigService>().configModel;
      if (config.initMainPosition.isEmpty) return;
      final Map<String, dynamic> map = json.decode(config.initMainPosition);
      final String countryCode = '${Get.find<KekokukiProfileService>().profileModel.countryCode}';
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
    final result = await KekokukiDialogUtil.showDialog(const KekokukiConfirmDialog(content: 'Close App?'));
    if (result == 1) {
      exit(0);
    }
  }

  void onTapTab(KekokukiRootTab tabType) async {
    selectedTab = tabType;
    update([kBuildIdPages, kBuildIdBottomBar]);
  }
}
