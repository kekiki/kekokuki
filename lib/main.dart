import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';
import 'dart:async';

import 'common/behavior/kekokuki_over_scroll_behavior.dart';
import 'common/utils/kekokuki_log_util.dart';
import 'common/utils/kekokuki_keyboard_util.dart';
import 'common/utils/kekokuki_loading_util.dart';
import 'services/config/kekokuki_app_config.dart';
import 'services/i18n/kekokuki_local_translations.dart';
import 'services/routes/kekokuki_router_observer.dart';
import 'services/routes/kekokuki_routes.dart';

void main() {
  runZoned(
    () async {
      // final widgetBinding = WidgetsFlutterBinding.ensureInitialized();
      // FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        KekokukiLogUtil.e('FlutterError', details.exceptionAsString(), details.stack);
      };

      await KekokukiAppConfig.init();
      runApp(const MyApp());
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, "[Log]: $line");
      },
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone, Object error, StackTrace stackTrace) {
        KekokukiLogUtil.e('UncaughtError', error.toString(), stackTrace);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: KekokukiRoutes.splash,
      getPages: KekokukiRoutes.getPageList,
      navigatorObservers: [KekokukiRouterObserver()],
      translations: KekokukiLocalTranslations(),
      popGesture: true,
      locale: KekokukiLocalTranslationLanguage.defaultLocale,
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        fontFamily: 'Mulish',
        appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        primaryColor: KekokukiColors.primaryColor,
      ),
      builder: KekokukiLoadingUtil.init(
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: ScrollConfiguration(
              behavior: KekokukiOverScrollBehavior(),
              child: GestureDetector(
                onTap: () => KekokukiKeyboardUtil.hideKeyboard(context),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
