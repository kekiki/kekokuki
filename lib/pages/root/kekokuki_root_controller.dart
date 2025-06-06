import 'dart:io';
import 'package:get/get.dart';
import 'package:kekokuki/common/utils/kekokuki_log_util.dart';

import 'package:kekokuki/pages/widgets/dialogs/kekokuki_confirm_dialog.dart';
import 'package:kekokuki/pages/widgets/dialogs/kekokuki_dialog_util.dart';
import '../../services/profile/kekokuki_profile_service.dart';
import '../../services/config/kekokuki_config_service.dart';
import '../../services/rtm&rtc/kekokuki_rtm_service.dart';
import '../chat/conversation/kekokuki_chat_conversation_mixin.dart';
import 'kekokuki_root_state.dart';

class KekokukiRootController extends GetxController with KekokukiChatConversationMixin {
  final state = KekokukiRootState();

  @override
  void onInit() {
    addUnreadCountListener(onUnreadCountListener);
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
    await Get.find<KekokukiConfigService>().fetchConfig();
    await Get.find<KekokukiProfileService>().fetchProfile();
    await Get.find<KekokukiRtmService>().connect();
  }

  void onUnreadCountListener(int? count) {
    if (count == null) return;
    KekokukiLogUtil.i('HomeController', 'unread message count: $count');
    state.unReadMessageCountObs.value = count;
  }

  void onBack() async {
    // Bring app to home screen when back button is pressed
    final result = await KekokukiDialogUtil.showDialog(const KekokukiConfirmDialog(content: 'Close App?'));
    if (result == 1) {
      exit(0);
    }
  }

  void onTapTabItem(KekokukiRootTabType tabType) async {
    state.selectedTabTypeObs.value = tabType;
  }
}
