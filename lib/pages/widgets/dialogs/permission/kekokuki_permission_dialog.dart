import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/services/styles/kekokuki_styles.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/widgets/kekokuki_button_widget.dart';
import '../../../../services/styles/kekokuki_colors.dart';
import 'kekokuki_permission_controller.dart';
import 'widgets/kekokuki_item_permission.dart';

class KekokukiPermissionDialog extends StatelessWidget {
  const KekokukiPermissionDialog({super.key, required this.permissionList});

  final List<Permission> permissionList;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KekokukiPermissionController>(
      init: KekokukiPermissionController(),
      autoRemove: true,
      assignId: true,
      builder: (logic) {
        final state = logic.state;
        logic.setPermissionList(permissionList);
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 30.pt),
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.pt),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 24.pt),
                    Text(
                      'permission_tips'.tr,
                      style: KekokukiStyles.s18w700,
                    ),
                    SizedBox(height: 14.pt),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.pt),
                      child: Text(
                        'permission_desc'.tr,
                        style: KekokukiStyles.s14w400.copyWith(
                          color: KekokukiColors.primaryTextColor.withOpacity(0.9),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.pt),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: permissionList.length,
                      itemBuilder: (context, index) {
                        final permission = permissionList[index];
                        return Obx(() {
                          final isGranted = state.grantListObs[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 27.pt,
                              vertical: 6.pt,
                            ),
                            child: KekokukiItemPermission(
                              permission: permission,
                              onTap: logic.onTapPermission,
                              isGranted: isGranted,
                            ),
                          );
                        });
                      },
                    ),
                    SizedBox(height: 10.pt),
                    KekokukiButtonWidget(
                      onPressed: logic.onTapAllowAll,
                      width: 260.pt,
                      height: 44.pt,
                      borderRadius: 22.pt,
                      backgroundColor: Colors.black12,
                      child: Text(
                        permissionList.length == 1 ? 'kekokuki_allow'.tr : 'kekokuki_allow_all'.tr,
                        style: KekokukiStyles.s16w700.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.pt),
                  ],
                ),
              ),
              SizedBox(height: 24.pt),
              SizedBox(
                width: 32.pt,
                height: 32.pt,
                child: IconButton(
                  onPressed: Get.back,
                  iconSize: 32.pt,
                  padding: EdgeInsets.zero,
                  splashRadius: 20.pt,
                  icon: Icon(
                    Icons.close,
                    size: 32.pt,
                  ),
                ),
              ),
              SizedBox(height: 24.pt),
            ],
          ),
        );
      },
    );
  }
}
