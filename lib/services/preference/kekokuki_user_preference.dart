import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

/// 跟用户走，切换账号或删除账号会被清空
class KekokukiUserPreference {
  late Box _box;

  Future<KekokukiUserPreference> init() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
    _box = await Hive.openBox('user_preference');
    return this;
  }

  Future<void> clear() async {
    await _box.clear();
  }

  // accept privacy policy and terms of use
  bool get acceptPrivacyPolicy => _box.get('acceptPrivacyPolicy', defaultValue: false);
  set acceptPrivacyPolicy(bool value) => _box.put('acceptPrivacyPolicy', value);

  // login info
  set loginInfoJson(Map<String, dynamic> value) => _box.put('loginInfoJson', jsonEncode(value));
  Map<String, dynamic> get loginInfoJson => jsonDecode(_box.get('loginInfoJson', defaultValue: '{}'));

  // login record
  set loginRecordJson(Map<String, dynamic> value) => _box.put('loginRecordJson', jsonEncode(value));
  Map<String, dynamic> get loginRecordJson => jsonDecode(_box.get('loginRecordJson', defaultValue: '{}'));

  // profile model
  set profileModelJson(Map<String, dynamic> value) => _box.put('profileModelJson', jsonEncode(value));
  Map<String, dynamic> get profileModelJson => jsonDecode(_box.get('profileModelJson', defaultValue: '{}'));

  // privacy mode
  bool get privacyCamera => _box.get('privacyCamera', defaultValue: false);
  set privacyCamera(bool value) => _box.put('privacyCamera', value);
}
