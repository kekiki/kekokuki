import 'dart:ui';
import 'package:get/get.dart';

import '../preference/kekokuki_app_preference.dart';
import 'kekokuki_language_en.dart';
import 'kekokuki_language_id.dart';

enum KekokukiLocalTranslationLanguage {
  // id
  indonesia('Indonesia', 'ID', 'id'),
  // ar
  arabic('عربي', 'SA', 'ar'),
  // th
  thailand('แบบไทย', 'TH', 'th'),
  // vi
  vietnam('Tiếng Việt', 'VN', 'vi'),
  // en
  english('English', 'US', 'en');

  final String name;
  final String country;
  final String code;
  const KekokukiLocalTranslationLanguage(this.name, this.country, this.code);

  static fromCode(String code) {
    final language = KekokukiLocalTranslationLanguage.values.firstWhereOrNull((element) => element.code == code);
    if (language != null) {
      return language;
    }
    return KekokukiLocalTranslationLanguage.english;
  }

  static Locale get defaultLocale {
    if (KekokukiAppPreference.config.languageCode.isNotEmpty) {
      return Locale(KekokukiAppPreference.config.languageCode);
    }

    var locale = Get.locale;
    if (locale != null) return locale;

    locale = Get.deviceLocale;
    if (locale != null) {
      final language = KekokukiLocalTranslationLanguage.values.firstWhereOrNull((element) => element.code == locale!.languageCode);
      if (language != null) {
        return Locale(language.code, language.country);
      }
    }
    return const Locale('en', 'US');
  }
}

class KekokukiLocalTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': english,
        'id': indonesia,
      };
}
