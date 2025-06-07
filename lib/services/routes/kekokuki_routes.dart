import 'package:get/get.dart';

import '../../pages/call/calling/kekokuki_calling_page.dart';
import '../../pages/call/calling/kekokuki_calling_page_controller.dart';
import '../../pages/call/comming/kekokuki_call_comming_page.dart';
import '../../pages/call/comming/kekokuki_call_comming_page_controller.dart';
import '../../pages/call/finished/kekokuki_call_finished_page.dart';
import '../../pages/call/finished/kekokuki_call_finished_page_controller.dart';
import '../../pages/call/going/kekokuki_call_going_page.dart';
import '../../pages/call/going/kekokuki_call_going_page_controller.dart';
import '../../pages/chat/conversation/kekokuki_chat_conversation_page_controller.dart';
import '../../pages/explore/kekokuki_explore_page_controller.dart';
import '../../pages/root/kekokuki_root_controller.dart';
import '../../pages/login/kekokuki_login_controller.dart';
import '../../pages/match/kekokuki_match_page_controller.dart';
import '../../pages/mine/kekokuki_mine_page_controller.dart';
import '../../pages/moment/list/kekokuki_moment_list_page_controller.dart';
import '../../splash/kekokuki_splash_controller.dart';
import '../../pages/root/kekokuki_root_page.dart';
import '../../pages/login/kekokuki_login_page.dart';
import '../../splash/kekokuki_splash_page.dart';

abstract class KekokukiRoutes {
  static const splash = "/splash";
  static const login = "/login";
  static const home = "/home";

  static const callGoing = "/callGoing";
  static const callComming = "/callComming";
  static const callCalling = "/callCalling";
  static const callFinished = "/callFinished";

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
      page: () => const KekokukiRootPage(),
      binding: BindingsBuilder.put(() => KekokukiRootController()),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => KekokukiExplorePageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiMatchPageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiMomentListPageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiChatConversationPageController())),
        BindingsBuilder(() => Get.lazyPut(() => KekokukiMinePageController())),
      ],
    ),
    GetPage(
      name: callGoing,
      page: () => const KekokukiCallGoingPage(),
      binding: BindingsBuilder.put(() => KekokukiCallGoingPageController()),
    ),
    GetPage(
      name: callComming,
      page: () => const KekokukiCallCommingPage(),
      binding: BindingsBuilder.put(() => KekokukiCallCommingPageController()),
    ),
    GetPage(
      name: callCalling,
      page: () => const KekokukiCallingPage(),
      binding: BindingsBuilder.put(() => KekokukiCallingPageController()),
    ),
    GetPage(
      name: callFinished,
      page: () => const KekokukiCallFinishedPage(),
      binding: BindingsBuilder.put(() => KekokukiCallFinishedPageController()),
    ),
  ];
}
