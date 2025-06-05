import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/generated/assets.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../services/styles/kekokuki_styles.dart';

class KekokukiItemPermission extends StatelessWidget {
  const KekokukiItemPermission({
    super.key,
    required this.permission,
    this.onTap,
    this.isGranted = false,
  });

  final Permission permission;
  final ValueChanged<Permission>? onTap;
  final bool isGranted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(permission),
      child: Container(
        width: 260.pt,
        height: 44.pt,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.pt),
          border: Border.all(color: Colors.grey, width: 1.pt),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 14.pt),
            Image.asset(
              _permissionIcon,
              width: 22.pt,
              height: 22.pt,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8.pt),
            Text(
              _permissionName,
              style: KekokukiStyles.s14w600,
            ),
            const Spacer(),
            Visibility(
              visible: isGranted,
              replacement: Image.asset(
                Assets.imagesCommonKekokukiCheckCircle,
                width: 20.pt,
                height: 20.pt,
                color: KekokukiColors.primaryColor,
              ),
              child: Image.asset(
                Assets.imagesCommonKekokukiCheckIn,
                width: 20.pt,
                height: 20.pt,
              ),
            ),
            SizedBox(width: 14.pt),
          ],
        ),
      ),
    );
  }

  String get _permissionIcon {
    if (permission.value == Permission.camera.value) {
      return Assets.imagesCommonKekokukiPermissionCamera;
    } else if (permission.value == Permission.photos.value) {
      return Assets.imagesCommonKekokukiPermissionAlbum;
    } else if (permission.value == Permission.microphone.value) {
      return Assets.imagesCommonKekokukiPermissionMicrophone;
    } else if (permission.value == Permission.storage.value) {
      return Assets.imagesCommonKekokukiPermissionStorage;
    } else {
      return "";
    }
  }

  String get _permissionName {
    if (permission.value == Permission.camera.value) {
      return 'kekokuki_camera'.tr;
    } else if (permission.value == Permission.photos.value) {
      return 'kekokuki_photos'.tr;
    } else if (permission.value == Permission.microphone.value) {
      return 'kekokuki_microphone'.tr;
    } else if (permission.value == Permission.storage.value) {
      return 'kekokuki_storage'.tr;
    } else {
      return "";
    }
  }
}
