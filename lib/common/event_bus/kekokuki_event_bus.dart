import 'dart:async';

class KekokukiEventBus {
  static KekokukiEventBus? _instance;
  static KekokukiEventBus get instance => _instance ??= KekokukiEventBus();

  final StreamController _streamController;
  StreamController get streamController => _streamController;

  KekokukiEventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);
  KekokukiEventBus.customController(StreamController controller)
      : _streamController = controller;

  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void fire(event) {
    streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }
}
