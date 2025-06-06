//
//  KekokukiRtmMessageModel.dart
//
//
//  Created by JSONConverter on 2025/05/28.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

import '../../pages/chat/message/kekokuki_chat_message_model.dart';

part 'kekokuki_rtm_message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class KekokukiRtmMessageModel extends Object {
  @JsonKey(name: 'data')
  final String? data;

  @JsonKey(name: 'extra')
  final String? extra;

  @JsonKey(name: 'messageType')
  final KekokukiMessageType? messageType;

  @JsonKey(name: 'mid')
  final String? mid;

  @JsonKey(name: 'timestamp')
  final int? timestamp;

  @JsonKey(name: 'userInfo')
  final KekokukiRtmMessageUserInfo? userInfo;

  const KekokukiRtmMessageModel({
    this.data,
    this.extra,
    this.messageType,
    this.mid,
    this.timestamp,
    this.userInfo,
  });

  factory KekokukiRtmMessageModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiRtmMessageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiRtmMessageModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class KekokukiRtmMessageUserInfo extends Object {
  @JsonKey(name: 'isOnline')
  final int? isOnline;

  // 解析用，外部使用 senderNickname
  @JsonKey(name: 'nickname')
  final String? nickname;

  @JsonKey(name: 'portrait')
  final String? portrait;

  // 解析用，外部使用 senderUserId
  @JsonKey(name: 'userId')
  final int? userId;

  /// 私聊消息字段

  // 解析用，外部使用 senderNickname
  @JsonKey(name: 'name')
  final String? name;

  // 解析用，外部使用 senderUserId
  @JsonKey(name: 'uid')
  final String? uid;

  @JsonKey(name: 'level')
  final int? level;

  @JsonKey(name: 'vipFlag')
  final bool? vipFlag;

  int? get senderUserId => uid != null ? int.parse(uid!) : userId;
  String? get senderNickname => name ?? nickname;

  const KekokukiRtmMessageUserInfo({
    this.isOnline,
    this.nickname,
    this.portrait,
    this.userId,
    this.name,
    this.uid,
    this.level,
    this.vipFlag,
  });

  factory KekokukiRtmMessageUserInfo.fromJson(Map<String, dynamic> srcJson) => _$KekokukiRtmMessageUserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiRtmMessageUserInfoToJson(this);
}
