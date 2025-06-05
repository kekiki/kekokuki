import 'package:get/get.dart';
import 'package:kekokuki/services/api/kekokuki_api_client.dart';
import 'package:kekokuki/services/api/kekokuki_api_response_ext.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'anchor_detail/kekokuk_anchor_model.dart';

class KekokukiAnchorListPageKeyType {
  int? countryCode;
  int? areaCode;
  int? anchorType;
  int resetRepeat = 0;
}

class KekokukiExplorePageController extends GetxController {
  final _client = Get.find<KekokukiApiClient>();

  late final PagingController<KekokukiAnchorListPageKeyType, KekokukiAnchorModel> pagingController;

  @override
  void onInit() {
    pagingController = PagingController(
      getNextPageKey: (state) => KekokukiAnchorListPageKeyType(),
      fetchPage: _fetchAnchorList,
    );
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<List<KekokukiAnchorModel>> _fetchAnchorList(KekokukiAnchorListPageKeyType pageKey) async {
    final response = await _client.fetchAnchorList().response;
    return response.data ?? [];
  }
}
