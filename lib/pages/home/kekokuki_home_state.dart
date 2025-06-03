import 'package:get/get.dart';

enum KekokukiHomeTabType {
  anchors,
  match,
  moment,
  chat,
  mine,
}

class KekokukiHomeState {
  final selectedTabTypeObs = KekokukiHomeTabType.anchors.obs;
  final unReadMessageCountObs = 0.obs;
}
