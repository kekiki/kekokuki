import 'kekokuki_config_preference.dart';
import 'kekokuki_user_preference.dart';

class KekokukiAppPreference {
  static late KekokukiConfigPreference config;

  /// 与用户相关的数据
  ///
  /// 切换账号或删除账号时需要清理
  static late KekokukiUserPreference user;

  static Future<void> init() async {
    config = await KekokukiConfigPreference().init();
    user = await KekokukiUserPreference().init();
  }
}
