import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/services/routes/kekokuki_routes.dart';

import '../../../common/utils/kekokuki_permission_util.dart';
import '../../../common/widgets/kekokuki_app_scaffold.dart';
import '../../../common/widgets/kekokuki_round_image_widget.dart';
import '../services/kekokuki_call_model.dart';
import 'kekokuki_call_going_model.dart';
import 'kekokuki_call_going_page_controller.dart';

class KekokukiCallGoingPage extends GetView<KekokukiCallGoingPageController> {
  const KekokukiCallGoingPage({super.key});

  static Future<T?> show<T>({required int anchorId, required KekokukiCallType callType}) async {
    final hasPermissions = await KekokukiPermissionUtil.checkHasCallPermissions();
    if (!hasPermissions) return null;
    final model = KekokukiCallGoingModel(anchorId, callType);
    return await Get.toNamed<T>(KekokukiRoutes.callGoing, arguments: model);
  }

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      isAllowBack: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Obx(() {
        return GestureDetector(
          onTap: Get.back,
          child: KekokukiRoundImageWidget(
            width: Get.width,
            height: Get.height,
            controller.anchorObs.value?.portrait ?? '',
          ),
        );
      }),
    );
  }
}
