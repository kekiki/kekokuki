// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiConfigModel _$KekokukiConfigModelFromJson(Map<String, dynamic> json) =>
    KekokukiConfigModel(
      agoraAppId: json['agoraAppId'] as String? ?? '',
      aiHelpUrl: json['aiHelpUrl'] as String? ?? '',
      bindGoogleReward: json['bindGoogleReward'] == null
          ? null
          : KekokukiRewardModel.fromJson(
              json['bindGoogleReward'] as Map<String, dynamic>),
      callCardDiamonds: (json['callCardDiamonds'] as num?)?.toInt() ?? 0,
      callCardSeconds: (json['callCardSeconds'] as num?)?.toInt() ?? 0,
      callPrice: (json['callPrice'] as num?)?.toInt() ?? 0,
      chatCardDays: (json['chatCardDays'] as num?)?.toInt() ?? 0,
      chatCardDiamonds: (json['chatCardDiamonds'] as num?)?.toInt() ?? 0,
      coins2Diamonds: (json['coins2Diamonds'] as num?)?.toInt() ?? 0,
      currencyConvert: json['currencyConvert'] as String? ?? '',
      deregisterDelaySecond:
          (json['deregisterDelaySecond'] as num?)?.toInt() ?? 0,
      disableVersions: json['disableVersions'] as String? ?? '',
      downgradeDialog1: json['downgradeDialog1'] as String? ?? '',
      downgradeDialog2: json['downgradeDialog2'] as String? ?? '',
      giftRankTopDiamonds: (json['giftRankTopDiamonds'] as num?)?.toInt() ?? 0,
      guestRegisterReward: (json['guestRegisterReward'] as num?)?.toInt() ?? 0,
      initMainPosition: json['initMainPosition'] as String? ?? '',
      isWithCouponLoadProducts:
          json['isWithCouponLoadProducts'] as String? ?? '',
      matchCardDiamonds: (json['matchCardDiamonds'] as num?)?.toInt() ?? 0,
      matchCardSeconds: (json['matchCardSeconds'] as num?)?.toInt() ?? 0,
      matchFirstDiamonds: (json['matchFirstDiamonds'] as num?)?.toInt() ?? 0,
      pddDialogDisplay1: json['pddDialogDisplay1'] as String? ?? '',
      pddDialogDisplay2: json['pddDialogDisplay2'] as String? ?? '',
      privacyChatImgDiamonds:
          (json['privacyChatImgDiamonds'] as num?)?.toInt() ?? 0,
      privacyChatVideoDiamonds:
          (json['privacyChatVideoDiamonds'] as num?)?.toInt() ?? 0,
      quickGreetConfig: json['quickGreetConfig'] as String? ?? '',
      registerGuide: json['registerGuide'] as String? ?? '',
      registerReward: json['registerReward'] == null
          ? null
          : KekokukiRewardModel.fromJson(
              json['registerReward'] as Map<String, dynamic>),
      showCallPriceConfig: json['showCallPriceConfig'] as String? ?? '',
      translateEnable: json['translateEnable'] as String? ?? '',
    );

Map<String, dynamic> _$KekokukiConfigModelToJson(
        KekokukiConfigModel instance) =>
    <String, dynamic>{
      'agoraAppId': instance.agoraAppId,
      'aiHelpUrl': instance.aiHelpUrl,
      'bindGoogleReward': instance.bindGoogleReward?.toJson(),
      'callCardDiamonds': instance.callCardDiamonds,
      'callCardSeconds': instance.callCardSeconds,
      'callPrice': instance.callPrice,
      'chatCardDays': instance.chatCardDays,
      'chatCardDiamonds': instance.chatCardDiamonds,
      'coins2Diamonds': instance.coins2Diamonds,
      'currencyConvert': instance.currencyConvert,
      'deregisterDelaySecond': instance.deregisterDelaySecond,
      'disableVersions': instance.disableVersions,
      'downgradeDialog1': instance.downgradeDialog1,
      'downgradeDialog2': instance.downgradeDialog2,
      'giftRankTopDiamonds': instance.giftRankTopDiamonds,
      'guestRegisterReward': instance.guestRegisterReward,
      'initMainPosition': instance.initMainPosition,
      'isWithCouponLoadProducts': instance.isWithCouponLoadProducts,
      'matchCardDiamonds': instance.matchCardDiamonds,
      'matchCardSeconds': instance.matchCardSeconds,
      'matchFirstDiamonds': instance.matchFirstDiamonds,
      'pddDialogDisplay1': instance.pddDialogDisplay1,
      'pddDialogDisplay2': instance.pddDialogDisplay2,
      'privacyChatImgDiamonds': instance.privacyChatImgDiamonds,
      'privacyChatVideoDiamonds': instance.privacyChatVideoDiamonds,
      'quickGreetConfig': instance.quickGreetConfig,
      'registerGuide': instance.registerGuide,
      'registerReward': instance.registerReward?.toJson(),
      'showCallPriceConfig': instance.showCallPriceConfig,
      'translateEnable': instance.translateEnable,
    };

KekokukiRewardModel _$KekokukiRewardModelFromJson(Map<String, dynamic> json) =>
    KekokukiRewardModel(
      callCardNum: (json['callCardNum'] as num?)?.toInt() ?? 0,
      chatCardNum: (json['chatCardNum'] as num?)?.toInt() ?? 0,
      diamonds: (json['diamonds'] as num?)?.toInt() ?? 0,
      matchCardNum: (json['matchCardNum'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukiRewardModelToJson(
        KekokukiRewardModel instance) =>
    <String, dynamic>{
      'callCardNum': instance.callCardNum,
      'chatCardNum': instance.chatCardNum,
      'diamonds': instance.diamonds,
      'matchCardNum': instance.matchCardNum,
    };
