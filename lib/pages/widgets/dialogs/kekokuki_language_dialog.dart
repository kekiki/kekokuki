import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/framework/adapts/kekokuki_screen_adapt.dart';

import '../../../generated/assets.dart';
import '../../../services/preference/kekokuki_app_preference.dart';
import '../../../services/i18n/kekokuki_local_translations.dart';
import '../../../services/styles/kekokuki_colors.dart';
import '../../../services/styles/kekokuki_styles.dart';

class KekokukiLanguageDialog extends StatefulWidget {
  const KekokukiLanguageDialog({super.key});

  @override
  State<KekokukiLanguageDialog> createState() => _KekokukiLanguageDialogState();
}

class _KekokukiLanguageDialogState extends State<KekokukiLanguageDialog> {
  final List<KekokukiLocalTranslationLanguage> _dataList = [
    KekokukiLocalTranslationLanguage.english,
    KekokukiLocalTranslationLanguage.indonesia,
    KekokukiLocalTranslationLanguage.arabic,
    KekokukiLocalTranslationLanguage.thailand,
    KekokukiLocalTranslationLanguage.vietnam,
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    final code = Get.locale?.languageCode ?? 'en';
    final langguage = KekokukiLocalTranslationLanguage.fromCode(code);
    _selectedIndex = _dataList.indexOf(langguage);
    super.initState();
  }

  void _onTapConfirm() {
    Get.back();
    final langguage = _dataList[_selectedIndex];
    KekokukiAppPreference.config.languageCode = langguage.code;
    Get.updateLocale(Locale(langguage.code));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.pt),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.pt),
      ),
      padding: EdgeInsets.symmetric(vertical: 24.pt, horizontal: 18.pt),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "kekokuki_choose_language".tr,
            style: KekokukiStyles.s18w700,
          ),
          SizedBox(height: 10.pt),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => _languageItemWidget(index),
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0.5,
                indent: 0,
                endIndent: 0,
                color: KekokukiColors.separatorLineColor,
              );
            },
            itemCount: _dataList.length,
          ),
          SizedBox(height: 14.pt),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    height: 42.pt,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: KekokukiColors.primaryColor),
                      borderRadius: BorderRadius.circular(21.pt),
                    ),
                    child: Text(
                      'kekokuki_cancel'.tr,
                      style: KekokukiStyles.s16w700.copyWith(
                        color: KekokukiColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14.pt),
              Expanded(
                child: GestureDetector(
                  onTap: _onTapConfirm,
                  child: Container(
                    height: 42.pt,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: KekokukiColors.primaryColor,
                      borderRadius: BorderRadius.circular(21.pt),
                    ),
                    child: Text(
                      'kekokuki_confirm'.tr,
                      style: KekokukiStyles.s16w700.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _languageItemWidget(int index) {
    final isSelected = _selectedIndex == index;
    final language = _dataList[index];
    return GestureDetector(
      onTap: () {
        _selectedIndex = index;
        setState(() {});
      },
      child: Container(
        width: 345.pt,
        height: 50.pt,
        color: Colors.transparent,
        child: Row(
          children: [
            Text(
              language.name,
              style: KekokukiStyles.s16w400.copyWith(
                color: isSelected ? KekokukiColors.primaryColor : KekokukiColors.primaryTextColor,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: isSelected,
              replacement: Image.asset(
                Assets.imagesCommonKekokukiCheckCircle,
                width: 20.pt,
                height: 20.pt,
              ),
              child: Image.asset(
                Assets.imagesCommonKekokukiCheckIn,
                width: 20.pt,
                height: 20.pt,
                color: KekokukiColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
