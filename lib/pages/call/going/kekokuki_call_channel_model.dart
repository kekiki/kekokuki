import 'package:json_annotation/json_annotation.dart';

import '../services/kekokuki_call_model.dart';

part 'kekokuki_call_channel_model.g.dart';

/// 通话频道信息
@JsonSerializable()
class KekokukiCallChannelModel {
  // 频道id
  int channelId;

  // 通话类型
  @JsonKey(unknownEnumValue: KekokukiCallType.unknown)
  KekokukiCallType callType;

  // 多少秒以内主播无收益
  int noProfitSeconds;

  // 是否可以使用视频卡
  bool usedCallCard;

  // 视频卡金币价值
  int callCardCoins;

  // 视频卡可使用的时长 秒数
  int callCardSeconds;

  // 匹配卡金币价值
  int matchCardCoins;

  // 匹配卡可使用的时长 秒数, 默认20秒
  int matchCardSeconds;

  // 用户剩余钻石
  int remainDiamonds;

  // 通话的续费单价,比如X秒后将收费的价格
  int chargePrice;

  // 收费金币单价，即每次续费所扣的费用
  int chargePriceCoins;

  String rtcToken;

  KekokukiCallChannelModel({
    this.channelId = 0,
    this.callType = KekokukiCallType.anchor,
    this.noProfitSeconds = 0,
    this.usedCallCard = false,
    this.callCardCoins = 0,
    this.callCardSeconds = 0,
    this.chargePriceCoins = 0,
    this.matchCardCoins = 0,
    this.matchCardSeconds = 20,
    this.remainDiamonds = 0,
    this.chargePrice = 0,
    this.rtcToken = '',
  });

  factory KekokukiCallChannelModel.fromJson(Map<String, dynamic> json) => _$KekokukiCallChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$KekokukiCallChannelModelToJson(this);
}
