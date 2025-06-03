import 'kekokuki_router_listener.dart';

mixin KekokukiRouterMixin {
  static final List<KekokukiRouteListener> listenerList = [];

  void addListener(KekokukiRouteListener listener) {
    listenerList.add(listener);
  }

  void removeListener(KekokukiRouteListener listener) {
    listenerList.remove(listener);
  }
}
