import 'package:flutter/material.dart';

import '../../common/utils/kekokuki_log_util.dart';
import 'kekokuki_router_mixin.dart';

class KekokukiRouterObserver extends NavigatorObserver {
  final _tag = "RouterObserver";

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final routeName = route.settings.name;
    final previousRouteName = previousRoute?.settings.name;
    KekokukiLogUtil.d(_tag, "didPush => $routeName, $previousRouteName");
    for (var listener in KekokukiRouterMixin.listenerList) {
      listener.didPush(route.settings.name, previousRoute?.settings.name);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    final routeName = route.settings.name;
    final previousRouteName = previousRoute?.settings.name;
    KekokukiLogUtil.d(_tag, "didPop => $routeName, $previousRouteName");
    for (var listener in KekokukiRouterMixin.listenerList) {
      listener.didPop(routeName, previousRouteName);
    }
  }
}
