import 'dart:async';
import 'package:get/get.dart';

import '../../common/utils/kekokuki_log_util.dart';
import '../api/kekokuki_api_client.dart';
import './../api/kekokuki_api_response_ext.dart';
import '../preference/kekokuki_app_preference.dart';
import './kekokuki_profile_model.dart';

class KekokukiProfileService extends GetxService {
  static const _tag = 'ProfileService';
  final KekokukiApiClient _apiClient = Get.find<KekokukiApiClient>();

  late KekokukiProfileModel _profileModel;
  KekokukiProfileModel get profileModel => _profileModel;
  final StreamController<KekokukiProfileModel> _streamController = StreamController.broadcast();
  Stream<KekokukiProfileModel> get profileStream => _streamController.stream;

  Future<KekokukiProfileService> init() async {
    await _readProfileModel();
    return this;
  }

  @override
  void onInit() {
    KekokukiLogUtil.d(_tag, 'onInit');
    super.onInit();
  }

  @override
  void onReady() {
    KekokukiLogUtil.d(_tag, 'onReady');
    super.onReady();
  }

  @override
  void onClose() {
    KekokukiLogUtil.d(_tag, 'onClose');
    _streamController.close();
    super.onClose();
  }

  Future<void> _writeProfileModel(KekokukiProfileModel model) async {
    _profileModel = model;
    _streamController.add(model);
    KekokukiAppPreference.user.profileModelJson = model.toJson();
  }

  Future<void> _readProfileModel() async {
    final Map<String, dynamic> json = KekokukiAppPreference.user.profileModelJson;
    _profileModel = KekokukiProfileModel.fromJson(json);
  }

  Future<KekokukiProfileModel?> fetchProfile() async {
    final response = await _apiClient.fetchProfile().response;
    if (response.isSuccess && response.data != null) {
      _writeProfileModel(response.data!);
    }
    return response.data;
  }
}
