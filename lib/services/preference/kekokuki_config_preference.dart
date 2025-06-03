import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class KekokukiConfigPreference {
  late Box _box;

  Future<KekokukiConfigPreference> init() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
    _box = await Hive.openBox('app_preference');
    return this;
  }

  Future<void> clear() async {
    await _box.clear();
  }

  // if API is test server
  bool get isApiServerTest => _box.get('isApiServerTest', defaultValue: false);
  set isApiServerTest(bool value) => _box.put('isApiServerTest', value);

  // Production Mode
  bool get isProductionMode => _box.get('isProductionMode', defaultValue: false);
  set isProductionMode(bool value) => _box.put('isProductionMode', value);

  // language code
  String get languageCode => _box.get('languageCode', defaultValue: '');
  set languageCode(String value) => _box.put('languageCode', value);

  // config model
  set configModelJson(Map<String, dynamic> value) => _box.put('configModelJson', jsonEncode(value));
  Map<String, dynamic> get configModelJson => jsonDecode(_box.get('configModelJson', defaultValue: '{}'));
}
