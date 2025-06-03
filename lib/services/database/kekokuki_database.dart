import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../pages/chat/conversation/kekokuki_chat_conversation_model.dart';
import '../../pages/chat/message/kekokuki_chat_message_model.dart';
import 'kekokuki_chat_conversation_dao.dart';
import 'kekokuki_chat_message_dao.dart';

part 'kekokuki_database.g.dart';

@Database(
  version: 1,
  entities: [
    KekokukiChatConversationModel,
    KekokukiChatMessageModel,
  ],
)
abstract class KekokukiDatabase extends FloorDatabase {
  KekokukiChatConversationDao get chatConversationDao;
  KekokukiChatMessageDao get chatMessageDao;
}
