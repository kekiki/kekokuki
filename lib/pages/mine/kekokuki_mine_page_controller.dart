import 'package:get/get.dart';
import 'package:kekokuki/common/utils/kekokuki_log_util.dart';

import '../../services/profile/kekokuki_profile_mixin.dart';
import '../../services/profile/kekokuki_profile_model.dart';

class KekokukiMinePageController extends GetxController with KekokukiProfileMixin {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    addProfileChangedListener(onProfileChangedListener);
    super.onReady();
  }

  @override
  void onClose() {
    removeProfileChangedListener();
    super.onClose();
  }

  void onProfileChangedListener(KekokukiProfileModel? profile) {
    if (profile == null) return;
    KekokukiLogUtil.d('KekokukiProfileMixin', 'profile changed');
  }
}
