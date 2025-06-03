import 'package:floor/floor.dart';

import '../../pages/chat/conversation/kekokuki_chat_conversation_model.dart';

@dao
abstract class KekokukiChatConversationDao {
  static const _tableName = KekokukiChatConversationModel.tableName;

  /// 查询所有会话列表
  @Query("SELECT * FROM $_tableName ORDER BY orderBy DESC,isPined DESC,timestamp DESC")
  Stream<List<KekokukiChatConversationModel>?> selectConversationListStream();

  /// 查询某条会话
  @Query("SELECT * FROM $_tableName WHERE anchorId = :anchorId LIMIT 1")
  Future<KekokukiChatConversationModel?> selectConversationWithAnchorId(int anchorId);

  /// 查询会话列表
  @Query("SELECT sum(unreadCount) FROM $_tableName")
  Stream<int?> selectAllConversationUnreadCountStream();

  ///插入一条数据
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(KekokukiChatConversationModel conversation);

  ///清空单个会话消息未读数
  @Query("UPDATE $_tableName SET unreadCount = 0 WHERE anchorId = :anchorId")
  Future<void> clearConversationUnreadCount(int anchorId);

  ///清空所有会话消息未读数
  @Query("UPDATE $_tableName SET unreadCount = 0")
  Future<void> clearAllUnreadCount();

  ///删除会话
  @Query("DELETE FROM $_tableName WHERE anchorId = :anchorId")
  Future<void> deleteConversationWithAnchorId(int anchorId);

  ///删除所有会话
  @Query("DELETE FROM $_tableName")
  Future<void> clear();
}
