//
//  KekokukiConfigModel.dart
//
//
//  Created by JSONConverter on 2025/05/16.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_config_model.g.dart';

@JsonSerializable(explicitToJson: true)
class KekokukiConfigModel extends Object {
  @JsonKey(name: 'agoraAppId', defaultValue: '')
  final String agoraAppId;

  @JsonKey(name: 'aiHelpUrl', defaultValue: '')
  final String aiHelpUrl;

  @JsonKey(name: 'bindGoogleReward')
  final KekokukiRewardModel? bindGoogleReward;

  @JsonKey(name: 'callCardDiamonds', defaultValue: 0)
  final int callCardDiamonds;

  @JsonKey(name: 'callCardSeconds', defaultValue: 0)
  final int callCardSeconds;

  @JsonKey(name: 'callPrice', defaultValue: 0)
  final int callPrice;

  @JsonKey(name: 'chatCardDays', defaultValue: 0)
  final int chatCardDays;

  @JsonKey(name: 'chatCardDiamonds', defaultValue: 0)
  final int chatCardDiamonds;

  @JsonKey(name: 'coins2Diamonds', defaultValue: 0)
  final int coins2Diamonds;

  @JsonKey(name: 'currencyConvert', defaultValue: '')
  final String currencyConvert;

  @JsonKey(name: 'deregisterDelaySecond', defaultValue: 0)
  final int deregisterDelaySecond;

  @JsonKey(name: 'disableVersions', defaultValue: '')
  final String disableVersions;

  @JsonKey(name: 'downgradeDialog1', defaultValue: '')
  final String downgradeDialog1;

  @JsonKey(name: 'downgradeDialog2', defaultValue: '')
  final String downgradeDialog2;

  @JsonKey(name: 'giftRankTopDiamonds', defaultValue: 0)
  final int giftRankTopDiamonds;

  @JsonKey(name: 'guestRegisterReward', defaultValue: 0)
  final int guestRegisterReward;

  @JsonKey(name: 'initMainPosition', defaultValue: '')
  final String initMainPosition;

  @JsonKey(name: 'isWithCouponLoadProducts', defaultValue: '')
  final String isWithCouponLoadProducts;

  @JsonKey(name: 'matchCardDiamonds', defaultValue: 0)
  final int matchCardDiamonds;

  @JsonKey(name: 'matchCardSeconds', defaultValue: 0)
  final int matchCardSeconds;

  @JsonKey(name: 'matchFirstDiamonds', defaultValue: 0)
  final int matchFirstDiamonds;

  @JsonKey(name: 'pddDialogDisplay1', defaultValue: '')
  final String pddDialogDisplay1;

  @JsonKey(name: 'pddDialogDisplay2', defaultValue: '')
  final String pddDialogDisplay2;

  @JsonKey(name: 'privacyChatImgDiamonds', defaultValue: 0)
  final int privacyChatImgDiamonds;

  @JsonKey(name: 'privacyChatVideoDiamonds', defaultValue: 0)
  final int privacyChatVideoDiamonds;

  @JsonKey(name: 'quickGreetConfig', defaultValue: '')
  final String quickGreetConfig;

  @JsonKey(name: 'registerGuide', defaultValue: '')
  final String registerGuide;

  @JsonKey(name: 'registerReward')
  final KekokukiRewardModel? registerReward;

  @JsonKey(name: 'showCallPriceConfig', defaultValue: '')
  final String showCallPriceConfig;

  @JsonKey(name: 'translateEnable', defaultValue: '')
  final String translateEnable;

  const KekokukiConfigModel({
    this.agoraAppId = '',
    this.aiHelpUrl = '',
    this.bindGoogleReward,
    this.callCardDiamonds = 0,
    this.callCardSeconds = 0,
    this.callPrice = 0,
    this.chatCardDays = 0,
    this.chatCardDiamonds = 0,
    this.coins2Diamonds = 0,
    this.currencyConvert = '',
    this.deregisterDelaySecond = 0,
    this.disableVersions = '',
    this.downgradeDialog1 = '',
    this.downgradeDialog2 = '',
    this.giftRankTopDiamonds = 0,
    this.guestRegisterReward = 0,
    this.initMainPosition = '',
    this.isWithCouponLoadProducts = '',
    this.matchCardDiamonds = 0,
    this.matchCardSeconds = 0,
    this.matchFirstDiamonds = 0,
    this.pddDialogDisplay1 = '',
    this.pddDialogDisplay2 = '',
    this.privacyChatImgDiamonds = 0,
    this.privacyChatVideoDiamonds = 0,
    this.quickGreetConfig = '',
    this.registerGuide = '',
    this.registerReward,
    this.showCallPriceConfig = '',
    this.translateEnable = '',
  });

  factory KekokukiConfigModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiConfigModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiConfigModelToJson(this);
}

@JsonSerializable()
class KekokukiRewardModel extends Object {
  @JsonKey(name: 'callCardNum', defaultValue: 0)
  final int callCardNum;

  @JsonKey(name: 'chatCardNum', defaultValue: 0)
  final int chatCardNum;

  @JsonKey(name: 'diamonds', defaultValue: 0)
  final int diamonds;

  @JsonKey(name: 'matchCardNum', defaultValue: 0)
  final int matchCardNum;

  const KekokukiRewardModel({
    this.callCardNum = 0,
    this.chatCardNum = 0,
    this.diamonds = 0,
    this.matchCardNum = 0,
  });

  factory KekokukiRewardModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiRewardModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiRewardModelToJson(this);
}
