typedef RouteAction = void Function(String?, String?);

class KekokukiRouteListener {
  final RouteAction? pushAction;
  final RouteAction? popAction;

  KekokukiRouteListener({this.pushAction, this.popAction});

  void didPush(String? routeName, String? previousRouteName) {
    pushAction?.call(routeName, previousRouteName);
  }

  void didPop(String? routeName, String? previousRouteName) {
    popAction?.call(routeName, previousRouteName);
  }
}