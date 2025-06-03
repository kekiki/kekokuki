// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_chat_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiChatConversationModel _$KekokukiChatConversationModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiChatConversationModel(
      anchorId: (json['anchorId'] as num).toInt(),
      summary: json['summary'] as String? ?? '',
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
      portrait: json['portrait'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      orderBy: (json['orderBy'] as num?)?.toInt() ?? 0,
      isPined: json['isPined'] as bool? ?? false,
      isNoDisturb: json['isNoDisturb'] as bool? ?? false,
    );

Map<String, dynamic> _$KekokukiChatConversationModelToJson(
        KekokukiChatConversationModel instance) =>
    <String, dynamic>{
      'anchorId': instance.anchorId,
      'portrait': instance.portrait,
      'nickname': instance.nickname,
      'summary': instance.summary,
      'timestamp': instance.timestamp,
      'unreadCount': instance.unreadCount,
      'orderBy': instance.orderBy,
      'isPined': instance.isPined,
      'isNoDisturb': instance.isNoDisturb,
    };
