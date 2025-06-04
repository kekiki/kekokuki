import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/framework/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/pages/chat/message/kekokuki_chat_message_page.dart';

import '../../../framework/widgets/kekokuki_round_image_widget.dart';
import '../../../generated/assets.dart';
import '../../../services/database/kekokuki_database.dart';
import '../conversation/kekokuki_chat_conversation_model.dart';
import '../message/kekokuki_chat_message_model.dart';

class KekokukiChatService extends GetxService {
  final _database = Get.find<KekokukiDatabase>();

  // 如果没有系统消息会话就新增一个
  Future<KekokukiChatService> init() async {
    await _addSystemConversationIfNeeded();
    return this;
  }

  Future<void> _addSystemConversationIfNeeded() async {
    var systemConversation = await _database.chatConversationDao.selectConversationWithAnchorId(KekokukiChatConversationModel.systemId);
    if (systemConversation == null) {
      systemConversation = const KekokukiChatConversationModel(anchorId: KekokukiChatConversationModel.systemId, orderBy: KekokukiChatConversationModel.systemOrderBy);
      await _database.chatConversationDao.insert(systemConversation);
    }
  }

  // 收到私聊消息入口，由RTM调用
  Future<void> receivedMessage(KekokukiChatMessageModel message) async {
    //存储消息
    _database.chatMessageDao.insert(message);

    //更新会话
    _updateConversationWithMessage(message);

    // 收到消息提醒
    Get.snackbar(
      message.nickname,
      message.summary,
      icon: KekokukiRoundImageWidget(
        message.portrait,
        width: 40.pt,
        height: 40.pt,
        isCircle: true,
        placeholder: Assets.imagesCommonKekokukiAvatarAnchor,
      ),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.black12,
      mainButton: TextButton(onPressed: () {}, child: const Text("Reply")),
      onTap: (snack) {
        Get.back();
        KekokukiChatMessagePage.show(anchorId: message.anchorId);
      },
    );
  }

  Future<void> _updateConversationWithMessage(KekokukiChatMessageModel message) async {
    final conversation = await _database.chatConversationDao.selectConversationWithAnchorId(message.anchorId);
    if (conversation != null) {
      _database.chatConversationDao.insert(conversation.copyWith(
        nickname: message.nickname,
        portrait: message.portrait,
        summary: message.summary,
        timestamp: message.timestamp,
        unreadCount: conversation.unreadCount + 1,
      ));
    } else {
      _database.chatConversationDao.insert(KekokukiChatConversationModel(
        anchorId: message.anchorId,
        nickname: message.nickname,
        portrait: message.portrait,
        summary: message.summary,
        timestamp: message.timestamp,
        unreadCount: 1,
      ));
    }
  }

  /// Conversation
  ///

  Future<void> updateConversation(KekokukiChatConversationModel conversation) async {
    await _database.chatConversationDao.insert(conversation);
  }

  Future<void> deleteConversation(KekokukiChatConversationModel conversation) async {
    await _database.chatConversationDao.deleteConversationWithAnchorId(conversation.anchorId);
  }

  /// Message
  ///

  Future<void> deleteMessage(KekokukiChatMessageModel message) async {
    _database.chatMessageDao.deleteMessagesWithId(message.id);
  }
}
