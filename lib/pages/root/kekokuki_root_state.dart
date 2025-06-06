import 'package:get/get.dart';

enum KekokukiRootTabType {
  anchors,
  match,
  moment,
  chat,
  mine,
}

class KekokukiRootState {
  final selectedTabTypeObs = KekokukiRootTabType.anchors.obs;
  final unReadMessageCountObs = 0.obs;
}
