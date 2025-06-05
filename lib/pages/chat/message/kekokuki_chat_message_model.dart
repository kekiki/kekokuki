import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../common/utils/kekokuki_format_util.dart';

part 'kekokuki_chat_message_model.g.dart';

@JsonEnum(valueField: 'value')
enum KekokukiMessageType {
  text(11), // 文本消息
  image(12), // 图片消息
  imageCharge(13), //收费的图片消息
  video(14), // 视频
  audioVoice(15), // 语音消息
  call(16), // 通话消息(主播打给用户的)
  gift(171), // 主动送礼物
  receiveGift(17), // 收到礼物消息
  followRequest(18), // 收到好友请求消息
  chatScript(19), // 聊天话术消息
  rateApp(20), //app评分
  balanceChanged(21), // 余额变动
  propChanged(22), // 道具变动
  callMessage(23), // 视频通话内的消息
  seeMeHome(24), // 有人看了我的主页
  newUserGifts(25), // 展示新人礼包
  videoCharge(26), //收费的视频消息
  followRequestAgree(27), // 对方同意了好友请求
  anchorOnline(28), // 主播上线消息
  chatEmoji(29), // 表情
  orderChanged(31), // 订单状态变化
  askGiftInChat(32), // 私聊中请求礼物
  askGiftInCall(33), // 通话中请求礼物
  askRechargeInChat(34), // 私聊中请求充值
  momentImgInChat(38), // 聊天中展示动态的图片
  momentNotice(39), // 动态点赞评论通知
  beginCall(41), // 开始通话消息
  callFailed(42), // 通话失败
  callEnd(43), // 通话结算
  feedback(44), // 后台回复举报用户消息
  authFailed(45), // 主播认证失败消息
  banByServer(46), // 后台封禁
  userLevelChanged(47), // 用户等级变化
  privacyCall(48), // 隐私通话
  callChangeVideoQuality(51), // 通话切换视频质量
  roomUserNumChanged(52), // 房间人数变化
  roomTopChanged(53), // 房间榜单变化
  roomWinBigReward(54), // 房间中大奖消息
  roomChatMessage(55), // 房间聊天消息
  likedMessage(56), // 主页被点赞消息
  advanceUser(57), // 成为高级用户消息
  heartbeatLevelChanged(58), // 心动等级变化
  readImMessage(60), // 主播已读IM消息
  giveBackChatCost(62); // 退还聊天解锁花费

  const KekokukiMessageType(this.value);

  final int value;
}

/// 1发送中，2发送成功，3发送失败，4消息已读， 5消息未读
@JsonEnum(valueField: 'value')
enum KekokukiMessageStatus {
  sending(1),
  sendSuccess(2),
  sendFailed(3),
  readed(4),
  unread(5);

  const KekokukiMessageStatus(this.value);

  final int value;
}

@Entity(tableName: "database_table_chat_message")
@JsonSerializable(explicitToJson: true)
class KekokukiChatMessageModel {
  static const String tableName = 'database_table_chat_message';

  /// 消息ID,唯一标识
  @primaryKey
  @JsonKey(name: "id")
  final String id;

  // 会话ID， 也是对方用户ID
  @JsonKey(name: "anchorId")
  final int anchorId;

  ///用户头像
  @JsonKey(name: "portrait", defaultValue: '')
  final String portrait;

  ///用户昵称
  @JsonKey(name: "nickname", defaultValue: '')
  final String nickname;

  // 消息类型
  @JsonKey(name: "messageType")
  final KekokukiMessageType messageType;

  // 1发送中，2发送成功，3发送失败，4消息已读， 5消息未读
  @JsonKey(name: "status")
  final KekokukiMessageStatus status;

  // 是否自己发送的消息
  @JsonKey(name: "isSelfSent", defaultValue: false)
  final bool isSelfSent;

  // 消息发送时间
  @JsonKey(name: "timestamp")
  final int timestamp;

  // 是否显示时间
  @JsonKey(name: "isShowTime", defaultValue: false)
  final bool isShowTime;

  // 消息内容
  @JsonKey(name: "jsonData")
  final String jsonData;

  String get sentTime => KekokukiFormatUtil.millisecondsToTime(timestamp);
  String get summary {
    switch (messageType) {
      case KekokukiMessageType.text:
      case KekokukiMessageType.chatScript:
        return text;
      case KekokukiMessageType.image:
        return 'kekokuki_message_image'.tr;
      case KekokukiMessageType.video:
        return 'kekokuki_message_video'.tr;
      default:
    }
    return '';
  }

  // Message content
  String get text => jsonDecode(jsonData)['text'] ?? '';
  KekokukiChatMessageImageModel get imageModel => KekokukiChatMessageImageModel.fromJson(jsonDecode(jsonData));
  KekokukiChatMessageVideoModel get videoModel => KekokukiChatMessageVideoModel.fromJson(jsonDecode(jsonData));

  const KekokukiChatMessageModel({
    required this.id,
    required this.messageType,
    required this.status,
    required this.isSelfSent,
    required this.timestamp,
    required this.anchorId,
    required this.portrait,
    required this.nickname,
    required this.isShowTime,
    required this.jsonData,
  });

  KekokukiChatMessageModel copyWith({
    String? id,
    KekokukiMessageType? messageType,
    KekokukiMessageStatus? status,
    bool? isSelfSent,
    int? timestamp,
    int? anchorId,
    String? portrait,
    String? nickname,
    bool? isShowTime,
    String? jsonData,
  }) {
    return KekokukiChatMessageModel(
      id: id ?? this.id,
      messageType: messageType ?? this.messageType,
      status: status ?? this.status,
      isSelfSent: isSelfSent ?? this.isSelfSent,
      timestamp: timestamp ?? this.timestamp,
      anchorId: anchorId ?? this.anchorId,
      portrait: portrait ?? this.portrait,
      nickname: nickname ?? this.nickname,
      isShowTime: isShowTime ?? this.isShowTime,
      jsonData: jsonData ?? this.jsonData,
    );
  }

  factory KekokukiChatMessageModel.fromJson(Map<String, dynamic> json) => _$KekokukiChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$KekokukiChatMessageModelToJson(this);
}

@JsonSerializable()
class KekokukiChatMessageImageModel extends Object {
  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String imageUrl;

  @JsonKey(name: 'mid', defaultValue: 0)
  final num? mid;

  @JsonKey(name: 'unlockFlag', defaultValue: 0)
  final int unlockFlag;

  @JsonKey(name: 'unlockId', defaultValue: '')
  final String unlockId;

  const KekokukiChatMessageImageModel(
    this.imageUrl,
    this.mid,
    this.unlockFlag,
    this.unlockId,
  );

  factory KekokukiChatMessageImageModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiChatMessageImageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiChatMessageImageModelToJson(this);
}

@JsonSerializable()
class KekokukiChatMessageVideoModel extends Object {
  @JsonKey(name: 'coverUrl', defaultValue: '')
  final String coverUrl;

  @JsonKey(name: 'mid', defaultValue: 0)
  final num? mid;

  @JsonKey(name: 'unlockFlag', defaultValue: 0)
  final int unlockFlag;

  @JsonKey(name: 'unlockId', defaultValue: '')
  final String unlockId;

  @JsonKey(name: 'videoSeconds', defaultValue: 0)
  final double videoSeconds;

  const KekokukiChatMessageVideoModel(
    this.coverUrl,
    this.mid,
    this.unlockFlag,
    this.unlockId,
    this.videoSeconds,
  );

  factory KekokukiChatMessageVideoModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiChatMessageVideoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiChatMessageVideoModelToJson(this);
}
