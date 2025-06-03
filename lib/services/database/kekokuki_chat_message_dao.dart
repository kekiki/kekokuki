import 'package:floor/floor.dart';

import '../../pages/chat/message/kekokuki_chat_message_model.dart';

@dao
abstract class KekokukiChatMessageDao {
  static const _tableName = KekokukiChatMessageModel.tableName;

  /// 查询消息列表
  @Query("SELECT * FROM $_tableName WHERE anchorId = :anchorId")
  Stream<List<KekokukiChatMessageModel>?> selectMessagesWithAnchorIdStream(int anchorId);

  ///插入一条消息
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(KekokukiChatMessageModel message);

  ///删除某条消息
  @Query("DELETE FROM $_tableName WHERE id = :id")
  Future<void> deleteMessagesWithId(String id);

  ///删除和某个主播的所有消息
  @Query("DELETE FROM $_tableName WHERE anchorId = :anchorId")
  Future<void> deleteMessagesWithAnchorId(int anchorId);

  ///删除所有消息
  @Query("DELETE FROM $_tableName")
  Future<void> clear();
}
