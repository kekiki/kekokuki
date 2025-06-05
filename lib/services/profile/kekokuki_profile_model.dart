//
//  KekokukiProfileModel.dart
//
//
//  Created by JSONConverter on 2025/05/16.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class KekokukiProfileModel extends Object {
  @JsonKey(name: 'birthday', defaultValue: 0)
  final int birthday;

  @JsonKey(name: 'boundGoogle', defaultValue: 0)
  final int boundGoogle;

  @JsonKey(name: 'countryCode', defaultValue: 0)
  final int countryCode;

  @JsonKey(name: 'countryPath', defaultValue: '')
  final String countryPath;

  @JsonKey(name: 'countrySubCode', defaultValue: '')
  final String countrySubCode;

  @JsonKey(name: 'countryTitle', defaultValue: '')
  final String countryTitle;

  @JsonKey(name: 'createdAt', defaultValue: 0)
  final int createdAt;

  @JsonKey(name: 'disturbFlag', defaultValue: 0)
  final int disturbFlag;

  @JsonKey(name: 'faceFlag', defaultValue: false)
  final bool faceFlag;

  @JsonKey(name: 'firstPaidTime', defaultValue: 0)
  final int firstPaidTime;

  @JsonKey(name: 'followFlag', defaultValue: '')
  final String followFlag;

  @JsonKey(name: 'hasPassword', defaultValue: 0)
  final int hasPassword;

  @JsonKey(name: 'hasPendingSplit', defaultValue: 0)
  final int hasPendingSplit;

  @JsonKey(name: 'hasSplitOrder', defaultValue: 0)
  final int hasSplitOrder;

  @JsonKey(name: 'isAdult', defaultValue: 0)
  final int isAdult;

  @JsonKey(name: 'isOnline', defaultValue: 0)
  final int isOnline;

  @JsonKey(name: 'levelConfig')
  final KekokukProfileLevelModel? levelModel;

  @JsonKey(name: 'likeFlag', defaultValue: '')
  final String likeFlag;

  @JsonKey(name: 'likeMeCount', defaultValue: '')
  final String likeMeCount;

  @JsonKey(name: 'multiUser', defaultValue: 0)
  final int multiUser;

  @JsonKey(name: 'nickname', defaultValue: '')
  final String nickname;

  @JsonKey(name: 'notifyFlag', defaultValue: 0)
  final int notifyFlag;

  @JsonKey(name: 'portrait', defaultValue: '')
  final String portrait;

  @JsonKey(name: 'propVoList')
  final List<KekokukiProfilePropModel> propVoList;

  @JsonKey(name: 'rechargeFlag', defaultValue: 0)
  final int rechargeFlag;

  @JsonKey(name: 'registerReportFlag', defaultValue: 0)
  final int registerReportFlag;

  @JsonKey(name: 'registerRewardFlag', defaultValue: 0)
  final int registerRewardFlag;

  @JsonKey(name: 'remainCoins', defaultValue: 0)
  final int remainCoins;

  @JsonKey(name: 'remainDiamonds', defaultValue: 0)
  final int remainDiamonds;

  @JsonKey(name: 'rflag', defaultValue: 1)
  final int rflag;

  @JsonKey(name: 'sexSelected', defaultValue: 0)
  final int sexSelected;

  @JsonKey(name: 'sexyMomentFlag', defaultValue: 0)
  final int sexyMomentFlag;

  @JsonKey(name: 'sexyTipFlag', defaultValue: 0)
  final int sexyTipFlag;

  @JsonKey(name: 'showGuild', defaultValue: 0)
  final int showGuild;

  @JsonKey(name: 'signature', defaultValue: '')
  final String signature;

  @JsonKey(name: 'signFlag', defaultValue: 0)
  final int signFlag;

  @JsonKey(name: 'tagImgId', defaultValue: 0)
  final int tagImgId;

  @JsonKey(name: 'todayUser', defaultValue: 0)
  final int todayUser;

  @JsonKey(name: 'totalRecharge', defaultValue: 0)
  final int totalRecharge;

  @JsonKey(name: 'userAuth', defaultValue: 0)
  final int userAuth;

  @JsonKey(name: 'userGuildFlag', defaultValue: 0)
  final int userGuildFlag;

  @JsonKey(name: 'userId', defaultValue: 0)
  final int userId;

  @JsonKey(name: 'username', defaultValue: '')
  final String username;

  @JsonKey(name: 'vipEndTime', defaultValue: 0)
  final int vipEndTime;

  @JsonKey(name: 'vipFlag', defaultValue: false)
  final bool vipFlag;

  @JsonKey(name: 'vipSignFlag', defaultValue: 0)
  final int vipSignFlag;

  const KekokukiProfileModel({
    this.birthday = 0,
    this.boundGoogle = 0,
    this.countryCode = 0,
    this.countryPath = '',
    this.countrySubCode = '',
    this.countryTitle = '',
    this.createdAt = 0,
    this.disturbFlag = 0,
    this.faceFlag = false,
    this.firstPaidTime = 0,
    this.followFlag = '',
    this.hasPassword = 0,
    this.hasPendingSplit = 0,
    this.hasSplitOrder = 0,
    this.isAdult = 0,
    this.isOnline = 0,
    this.levelModel,
    this.likeFlag = '',
    this.likeMeCount = '',
    this.multiUser = 0,
    this.nickname = '',
    this.notifyFlag = 0,
    this.portrait = '',
    this.propVoList = const [],
    this.rechargeFlag = 0,
    this.registerReportFlag = 0,
    this.registerRewardFlag = 0,
    this.remainCoins = 0,
    this.remainDiamonds = 0,
    this.rflag = 1,
    this.sexSelected = 0,
    this.sexyMomentFlag = 0,
    this.sexyTipFlag = 0,
    this.showGuild = 0,
    this.signature = '',
    this.signFlag = 0,
    this.tagImgId = 0,
    this.todayUser = 0,
    this.totalRecharge = 0,
    this.userAuth = 0,
    this.userGuildFlag = 0,
    this.userId = 0,
    this.username = '',
    this.vipEndTime = 0,
    this.vipFlag = false,
    this.vipSignFlag = 0,
  });

  factory KekokukiProfileModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiProfileModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiProfileModelToJson(this);
}

@JsonSerializable()
class KekokukProfileLevelModel extends Object {
  @JsonKey(name: 'avatarFrame')
  String? avatarFrame;

  @JsonKey(name: 'begin')
  num? begin;

  @JsonKey(name: 'end')
  num? end;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'level')
  num? level;

  @JsonKey(name: 'userIcon')
  String? userIcon;

  KekokukProfileLevelModel(
    this.avatarFrame,
    this.begin,
    this.end,
    this.icon,
    this.level,
    this.userIcon,
  );

  factory KekokukProfileLevelModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukProfileLevelModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukProfileLevelModelToJson(this);
}

@JsonSerializable()
class KekokukiProfilePropModel extends Object {
  @JsonKey(name: 'animEffectUrl', defaultValue: '')
  final String animEffectUrl;

  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'propNum', defaultValue: 0)
  final int propNum;

  @JsonKey(name: 'propType', defaultValue: 0)
  final int propType;

  @JsonKey(name: 'propValue', defaultValue: 0)
  final int propValue;

  const KekokukiProfilePropModel({
    this.animEffectUrl = '',
    this.icon = '',
    this.name = '',
    this.propNum = 0,
    this.propType = 0,
    this.propValue = 0,
  });

  factory KekokukiProfilePropModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiProfilePropModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiProfilePropModelToJson(this);
}
