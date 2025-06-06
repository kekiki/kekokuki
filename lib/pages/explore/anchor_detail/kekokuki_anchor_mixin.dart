import 'dart:async';

import 'package:get/get.dart';

import '../../../services/database/kekokuki_database.dart';
import 'kekokuk_anchor_model.dart';

mixin KekokukiAnchorMixin {
  final _database = Get.find<KekokukiDatabase>().anchorDao;
  StreamSubscription? _anchorInfoStream;

  void addAnchorInfoListener(int anchorId, void Function(KekokukiAnchorModel? list) onListener) {
    _anchorInfoStream = _database.findAnchorByIdAsStream(anchorId).listen(onListener);
  }

  void removeAnchorInfoListener() {
    _anchorInfoStream?.cancel();
    _anchorInfoStream = null;
  }
}
