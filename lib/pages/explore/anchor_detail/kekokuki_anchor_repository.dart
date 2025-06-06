import 'package:get/get.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';

import '../../../common/utils/kekokuki_log_util.dart';
import '../../../services/api/kekokuki_api_client.dart';
import '../../../services/database/kekokuki_database.dart';
import 'kekokuk_anchor_model.dart';

class KekokukiAnchorRepository {
  static const _tag = "AnchorRepository";
  final KekokukiApiClient _apiClient = Get.find<KekokukiApiClient>();
  final KekokukiDatabase _database = Get.find<KekokukiDatabase>();

  Future<KekokukiAnchorModel?> fetchAnchorInfo({required int anchorId, bool useCache = false}) async {
    if (!useCache) {
      return await _fetchAnchorInfo(anchorId);
    }
    var anchor = await _database.anchorDao.findAnchorById(anchorId);
    anchor ??= await _fetchAnchorInfo(anchorId);
    return anchor;
  }

  Future<KekokukiAnchorModel?> _fetchAnchorInfo(int anchorId) async {
    KekokukiAnchorModel? anchor;
    final result = await _apiClient.fetchAnchorInfo(anchorId).response;
    if (result.isSuccess && result.data != null) {
      anchor = result.data!;
      _database.anchorDao.insertAnchor(anchor);
    } else {
      KekokukiLogUtil.e(_tag, 'fetchAnchorInfo error: ${result.msg}');
    }
    return anchor;
  }

  // Future<KekokukiAnchorModel?> requestFollow(
  //     {required KekokukiAnchorModel anchor}) async {
  //   KekokukiAnchorModel? newAnchor;
  //   if (anchor.isLike) {
  //     KekokukiLoadingUtil.show();
  //     final result =
  //         await _apiClient.cancelFollow(anchor.id.toString()).response;
  //     KekokukiLoadingUtil.dismiss();
  //     if (result.isSuccess) {
  //       newAnchor = anchor.copyWith(
  //         isLike: false,
  //         like: min(anchor.like - 1, 0),
  //       );
  //       _database.anchorDao.updateAnchor(newAnchor);
  //       KekokukiEventBus.instance.fire(KekokukiFollowRefreshEvent());
  //       KekokukiLoadingUtil.showToast('kekokuki_cancel_follow_tips'.tr);
  //     } else {
  //       KekokukiLoadingUtil.showToast(result.msg);
  //     }
  //   } else {
  //     KekokukiLoadingUtil.show();
  //     final result = await _apiClient.addFollow(anchor.id.toString()).response;
  //     KekokukiLoadingUtil.dismiss();
  //     if (result.isSuccess) {
  //       newAnchor = anchor.copyWith(
  //         isLike: true,
  //         like: anchor.like + 1,
  //       );
  //       _database.anchorDao.updateAnchor(newAnchor);
  //       KekokukiEventBus.instance.fire(KekokukiFollowRefreshEvent());
  //       KekokukiLoadingUtil.showToast('kekokuki_add_follow_tips'.tr);
  //     } else {
  //       KekokukiLoadingUtil.showToast(result.msg);
  //     }
  //   }
  //   return newAnchor;
  // }

  // Future<KekokukiAnchorModel?> requestBlock(
  //     {required KekokukiAnchorModel anchor}) async {
  //   KekokukiAnchorModel? newAnchor;
  //   if (anchor.isToBlock) {
  //     KekokukiLoadingUtil.show();
  //     final result = await _apiClient
  //         .cancelBlock(anchor.id.toString(), anchor.robot.toString())
  //         .response;
  //     await KekokukiChatManager.instance
  //         .updateBlock(anchorId: anchor.sessionId, isBlock: false);
  //     KekokukiLoadingUtil.dismiss();
  //     if (result.isSuccess) {
  //       newAnchor = anchor.copyWith(isBlock: false);
  //       _database.anchorDao.updateAnchor(newAnchor);
  //       KekokukiLoadingUtil.showToast('kekokuki_cancel_block_tips'.tr);
  //       KekokukiProfileManager.instance.fetchProfile();
  //     } else {
  //       KekokukiLoadingUtil.showToast(result.msg);
  //     }
  //   } else {
  //     KekokukiLoadingUtil.show();
  //     final result = await _apiClient
  //         .addBlock(anchor.id.toString(), anchor.robot.toString())
  //         .response;
  //     await KekokukiChatManager.instance
  //         .updateBlock(anchorId: anchor.sessionId, isBlock: true);
  //     KekokukiLoadingUtil.dismiss();
  //     if (result.isSuccess) {
  //       newAnchor = anchor.copyWith(isBlock: true);
  //       _database.anchorDao.updateAnchor(newAnchor);
  //       KekokukiLoadingUtil.showToast('kekokuki_add_block_tips'.tr);
  //       Get.until((route) => route.settings.name == KekokukiRoutes.home);
  //       KekokukiProfileManager.instance.fetchProfile();
  //     } else {
  //       KekokukiLoadingUtil.showToast(result.msg);
  //     }
  //   }
  //   return newAnchor;
  // }
}
