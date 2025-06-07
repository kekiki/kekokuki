import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/services/profile/kekokuki_profile_service.dart';
import 'kekokuki_calling_model.dart';

class KekokukiCallingState {
  late KekokukiCallingModel callModel;

  final profileObs = Get.find<KekokukiProfileService>().profileModel.obs;
  final callingDurationObs = '00:00'.obs;

  final isStartCameraObs = true.obs;
  final isVoiceEnableObs = true.obs;
  final isSpeakerObs = true.obs;

  final isLocalSmallPreviewObs = true.obs;
  bool isLocalSmallPreview = true;
  bool isAIAPlayFinished = false;

  final smallScreenEnd = 15.pt.obs;
  final smallScreenTop = (82.pt + Get.statusBarHeight).obs;
  final smallScreenWidth = 135.pt;
  final smallScreenHeight = 180.pt;
}
