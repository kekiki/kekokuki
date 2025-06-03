import 'dart:async';
import 'package:get/get.dart';

import 'kekokuki_profile_model.dart';
import 'kekokuki_profile_service.dart';

mixin KekokukiProfileMixin {
  final _service = Get.find<KekokukiProfileService>();
  StreamSubscription? _profileStream;

  void addProfileChangedListener(void Function(KekokukiProfileModel? model) onListener) {
    _profileStream = _service.profileStream.listen(onListener);
  }

  void removeProfileChangedListener() {
    _profileStream?.cancel();
    _profileStream = null;
  }
}
