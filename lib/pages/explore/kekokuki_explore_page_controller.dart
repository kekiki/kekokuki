import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/services/api/kekokuki_api_client.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kekokuki/services/database/kekokuki_database.dart';

import 'anchor_detail/kekokuk_anchor_model.dart';

// class KekokukiAnchorListPageKeyType {
//   int? countryCode;
//   int? areaCode;
//   int? anchorType;
//   int resetRepeat = 0;
// }

const kBuildIdTabBar = 'kBuildIdTabBar';

class KekokukiExplorePageController extends GetxController with GetTickerProviderStateMixin {
  final _client = Get.find<KekokukiApiClient>();
  final tabNameList = ["Explore", 'Game Room'];
  TabController? tabController;

  // late final PagingController<KekokukiAnchorListPageKeyType, KekokukiAnchorModel> pagingController;

  @override
  void onInit() {
    // pagingController = PagingController(
    //   getNextPageKey: (state) => KekokukiAnchorListPageKeyType(),
    //   fetchPage: _fetchAnchorList,
    // );
    tabController = TabController(length: tabNameList.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // pagingController.dispose();
    // tabController?.dispose();
    super.onClose();
  }

  // Future<List<KekokukiAnchorModel>> _fetchAnchorList(KekokukiAnchorListPageKeyType pageKey) async {
  //   final response = await _client.fetchAnchorList().response;
  //   final list = response.data ?? [];
  //   Get.find<KekokukiDatabase>().anchorDao.insertAnchorList(list);
  //   return list;
  // }
}
