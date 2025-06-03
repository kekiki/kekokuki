import 'dart:async';
import 'package:get/get.dart';

import '../../../services/database/kekokuki_database.dart';
import 'kekokuki_chat_conversation_model.dart';

mixin KekokukiChatConversationMixin {
  final _database = Get.find<KekokukiDatabase>().chatConversationDao;
  StreamSubscription? _conversationUnreadCountStream;
  StreamSubscription? _conversationListStream;

  void addUnreadCountListener(void Function(int? count) onListener) {
    _conversationUnreadCountStream = _database.selectAllConversationUnreadCountStream().listen(onListener);
  }

  void removeUnreadCountListener() {
    _conversationUnreadCountStream?.cancel();
    _conversationUnreadCountStream = null;
  }

  void addConversationListListener(void Function(List<KekokukiChatConversationModel>? list) onListener) {
    _conversationListStream = _database.selectConversationListStream().listen(onListener);
  }

  void removeConversationListListener() {
    _conversationListStream?.cancel();
    _conversationListStream = null;
  }
}
