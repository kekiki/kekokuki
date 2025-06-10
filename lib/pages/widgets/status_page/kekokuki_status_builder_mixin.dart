import 'kekokuki_status.dart';
import 'kekokuki_status_builder.dart';

mixin KekokukiStatusBuilderMixin {
  // This mixin can be used to add common functionality or properties
  // related to the Kekokuki status page.

  void updateStatus(KekokukiStatus newStatus) {
    statusBuilderKey.currentState?.update(newStatus);
  }
}
