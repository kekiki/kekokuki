import 'package:get/get.dart';

import '../../pages/chat/conversation/kekokuki_chat_conversation_page_controller.dart';
import '../../pages/explore/kekokuki_explore_page_controller.dart';
import '../../pages/home/kekokuki_home_controller.dart';
import '../../pages/login/kekokuki_login_controller.dart';
import '../../pages/match/kekokuki_match_page_controller.dart';
import '../../pages/mine/kekokuki_mine_page_controller.dart';
import '../../pages/moment/list/kekokuki_moment_list_page_controller.dart';
import '../../splash/kekokuki_splash_controller.dart';
import '../../pages/home/kekokuki_home_page.dart';
import '../../pages/login/kekokuki_login_page.dart';
import '../../splash/kekokuki_splash_page.dart';

abstract class KekokukiRoutes {
  static const splash = "/splash";
  static const login = "/login";
  static const home = "/home";

  static final getPageList = [
    GetPage(
      name: splash,
      page: () => const KekokukiSplashPage(),
      binding: BindingsBuilder.put(() => KekokukiSplashController()),
    ),
    GetPage(
      name: login,
      page: () => const KekokukiLoginPage(),
      binding: BindingsBuilder.put(() => KekokukiLoginController()),
    ),
    GetPage(
      name: home,
      page: () => const KekokukiHomePage(),
      binding: BindingsBuilder.put(() => KekokukiHomeController()),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => KekokukiExplorePageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiMatchPageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiMomentListPageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiChatConversationPageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiMinePageController())),
      ],
    ),
  ];
}
