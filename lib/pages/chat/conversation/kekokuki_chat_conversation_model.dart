import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_chat_conversation_model.g.dart';

@Entity(tableName: KekokukiChatConversationModel.tableName)
@JsonSerializable(explicitToJson: true)
class KekokukiChatConversationModel {
  static const String tableName = 'database_table_chat_conversation';

  ///唯一会话ID，也是主播ID
  @primaryKey
  @JsonKey(name: "anchorId")
  final int anchorId;

  ///用户头像
  @JsonKey(name: "portrait")
  final String portrait;

  ///用户昵称
  @JsonKey(name: "nickname")
  final String nickname;

  ///最后一条消息概括内容
  @JsonKey(name: "summary")
  final String summary;

  ///最后一条消息时间戳
  @JsonKey(name: "timestamp")
  final int timestamp;

  ///未读数量
  @JsonKey(name: "unreadCount")
  final int unreadCount;

  ///排序
  @JsonKey(name: "orderBy")
  final int orderBy;

  ///置顶
  @JsonKey(name: "isPined")
  final bool isPined;

  ///勿扰
  @JsonKey(name: "isNoDisturb")
  final bool isNoDisturb;

  static const systemId = 9999;
  static const systemOrderBy = 99999;
  bool get isSystem => anchorId == systemId;

  const KekokukiChatConversationModel({
    required this.anchorId,
    this.summary = '',
    this.timestamp = 0,
    this.portrait = '',
    this.nickname = '',
    this.unreadCount = 0,
    this.orderBy = 0,
    this.isPined = false,
    this.isNoDisturb = false,
  });

  KekokukiChatConversationModel copyWith({
    int? anchorId,
    String? portrait,
    String? nickname,
    String? summary,
    int? timestamp,
    int? unreadCount,
    int? orderBy,
    bool? isPined,
    bool? isNoDisturb,
  }) {
    return KekokukiChatConversationModel(
      anchorId: anchorId ?? this.anchorId,
      portrait: portrait ?? this.portrait,
      nickname: nickname ?? this.nickname,
      summary: summary ?? this.summary,
      timestamp: timestamp ?? this.timestamp,
      unreadCount: unreadCount ?? this.unreadCount,
      orderBy: orderBy ?? this.orderBy,
      isPined: isPined ?? this.isPined,
      isNoDisturb: isNoDisturb ?? this.isNoDisturb,
    );
  }

  factory KekokukiChatConversationModel.fromJson(Map<String, dynamic> json) => _$KekokukiChatConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$KekokukiChatConversationModelToJson(this);
}
