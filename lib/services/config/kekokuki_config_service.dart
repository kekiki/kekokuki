import 'dart:async';

import 'package:get/get.dart';

import '../../common/utils/kekokuki_log_util.dart';
import '../api/kekokuki_api_client.dart';
import './../api/kekokuki_api_response_ext.dart';
import '../preference/kekokuki_app_preference.dart';
import 'kekokuki_config_model.dart';

class KekokukiConfigService extends GetxService {
  static const _tag = 'ConfigService';
  final KekokukiApiClient _apiClient = Get.find<KekokukiApiClient>();

  late KekokukiConfigModel _configModel;
  KekokukiConfigModel get configModel => _configModel;

  Future<KekokukiConfigService> init() async {
    await _readConfigModel();
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
    super.onClose();
  }

  Future<void> _writeConfigModel(KekokukiConfigModel model) async {
    _configModel = model;
    KekokukiAppPreference.config.configModelJson = model.toJson();
  }

  Future<void> _readConfigModel() async {
    final Map<String, dynamic> json = KekokukiAppPreference.config.configModelJson;
    _configModel = KekokukiConfigModel.fromJson(json);
  }

  Future<KekokukiConfigModel?> fetchConfig() async {
    final response = await _apiClient.fetchConfig().response;
    if (response.isSuccess && response.data != null) {
      _writeConfigModel(response.data!);
    }
    return response.data;
  }
}
