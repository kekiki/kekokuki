import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../pages/chat/conversation/kekokuki_chat_conversation_model.dart';
import '../../pages/chat/message/kekokuki_chat_message_model.dart';
import '../../pages/explore/anchor_detail/kekokuk_anchor_model.dart';
import '../../pages/explore/anchor_detail/kekokuki_album_list_converter.dart';
import '../../pages/explore/anchor_detail/kekokuki_gift_list_converter.dart';
import '../../pages/explore/anchor_detail/kekokuki_level_model_converter.dart';
import '../../pages/explore/anchor_detail/kekokuki_moment_list_converter.dart';
import '../../pages/explore/anchor_detail/kekokuki_tag_list_converter.dart';
import 'kekokuki_anchor_dao.dart';
import 'kekokuki_chat_conversation_dao.dart';
import 'kekokuki_chat_message_dao.dart';

part 'kekokuki_database.g.dart';

@Database(
  version: 1,
  entities: [
    KekokukiChatConversationModel,
    KekokukiChatMessageModel,
    KekokukiAnchorModel,
  ],
)
abstract class KekokukiDatabase extends FloorDatabase {
  KekokukiChatConversationDao get chatConversationDao;
  KekokukiChatMessageDao get chatMessageDao;
  KekokukiAnchorDao get anchorDao;
}
