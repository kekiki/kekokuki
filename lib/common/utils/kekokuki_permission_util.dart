import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../pages/widgets/dialogs/permission/kekokuki_permission_dialog.dart';

class KekokukiPermissionUtil {
  static Future<bool> checkHasCallPermissions() async {
    /// microphone permission && camera permission
    final isMicroPhoneGranted = await Permission.microphone.isGranted;
    final isCameraGranted = await Permission.camera.isGranted;
    if (isMicroPhoneGranted && isCameraGranted) {
      return true;
    }

    final isMicrophoneDenied = await Permission.microphone.request().isPermanentlyDenied;
    final isCameraDenied = await Permission.camera.request().isPermanentlyDenied;
    if (isMicrophoneDenied || isCameraDenied) {
      await Get.dialog(
        const KekokukiPermissionDialog(
          permissionList: [Permission.microphone, Permission.camera],
        ),
      );
      return false;
    }

    return await Permission.microphone.isGranted && await Permission.camera.isGranted;
  }
}
