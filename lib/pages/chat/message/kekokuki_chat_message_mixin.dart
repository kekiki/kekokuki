import 'dart:async';
import 'package:get/get.dart';

import '../../../services/database/kekokuki_database.dart';
import 'kekokuki_chat_message_model.dart';

mixin KekokukiChatMessageMixin {
  final _database = Get.find<KekokukiDatabase>().chatMessageDao;
  StreamSubscription? _messageListStream;

  void addAnchorMessageListListener(int anchorId, void Function(List<KekokukiChatMessageModel>? list) onListener) {
    _messageListStream = _database.selectMessagesWithAnchorIdStream(anchorId).listen(onListener);
  }

  void removeAnchorMessageListListener() {
    _messageListStream?.cancel();
    _messageListStream = null;
  }
}
