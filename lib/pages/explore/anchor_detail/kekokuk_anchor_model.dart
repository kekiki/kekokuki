//
//  KekokukAnchorModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuk_anchor_model.g.dart';

/// 性别
@JsonEnum(valueField: 'value')
enum KekokukSex {
  male(1),
  female(2);

  const KekokukSex(this.value);
  final int value;
}

/// 在线状态
@JsonEnum(valueField: 'value')
enum KekokukOnlineStatus {
  unknown(-1), // 未知
  offline(0), // 离线
  online(1), // 在线
  busy(2); // 忙线

  const KekokukOnlineStatus(this.value);
  final int value;
}

/// 关注状态
@JsonEnum(valueField: 'value')
enum KekokukiFollowStatus {
  unFollow(0), // 双方未关注
  followMe(1), // 我未关注对方,对方关注了我
  followed(2), // 我关注了对方,对方未关注我
  friend(3); // 互为好友

  const KekokukiFollowStatus(this.value);
  final int value;
}

/// 认证状态
@JsonEnum(valueField: 'value')
enum KekokukiAuthType {
  unknown(-1), // 用于处理未知类型
  maleUser(0), // 男用户
  waitAuthAnchor(1), //待认证主播
  authedAnchor(2), // 已认证主播
  authFailedAnchor(3), // 认证失败主播
  anchorViolate(4), // 画面违规主播
  anchorBanExam(5), //封禁答题主播
  femaleUer(9), //"女用户"
  fakeUser(900); //"合规用户"

  const KekokukiAuthType(this.value);
  final int value;

  bool get isAnchor => this != KekokukiAuthType.maleUser;
}

@JsonSerializable(explicitToJson: true)
class KekokukiAnchorModel extends Object {
  @JsonKey(name: 'albumUrlList', defaultValue: [])
  final List<KekokukAnchorAlbumModel> albumUrlList;

  @JsonKey(name: 'birthday', defaultValue: 0)
  final int birthday;

  @JsonKey(name: 'callPrice', defaultValue: 0)
  final int callPrice;

  @JsonKey(name: 'countryCode', defaultValue: 0)
  final int countryCode;

  @JsonKey(name: 'countryPath', defaultValue: '')
  final String countryPath;

  @JsonKey(name: 'countryTitle', defaultValue: '')
  final String countryTitle;

  @JsonKey(name: 'faceFlag', defaultValue: false)
  final bool faceFlag;

  @JsonKey(name: 'followCount', defaultValue: 0)
  final int followCount;

  @JsonKey(name: 'followedCount', defaultValue: 0)
  final int followedCount;

  @JsonKey(name: 'followFlag', defaultValue: KekokukiFollowStatus.unFollow)
  final KekokukiFollowStatus followStatus;

  @JsonKey(name: 'isOnline', defaultValue: KekokukOnlineStatus.offline)
  final KekokukOnlineStatus onlineStatus;

  @JsonKey(name: 'language', defaultValue: 'en')
  final String language;

  @JsonKey(name: 'languageName', defaultValue: 'English')
  final String languageName;

  @JsonKey(name: 'levelConfig')
  final KekokukAnchorLevelModel? levelModel;

  @JsonKey(name: 'likeFlag', defaultValue: 1)
  final int likeFlag;

  @JsonKey(name: 'likeMeCount', defaultValue: 0)
  final int likeMeCount;

  @JsonKey(name: 'manyLanguage', defaultValue: '')
  final String manyLanguage;

  @JsonKey(name: 'manyLanguageName', defaultValue: '')
  final String manyLanguageName;

  @JsonKey(name: 'moments', defaultValue: [])
  final List<KekokukAnchorMomentModel> moments;

  @JsonKey(name: 'nickname', defaultValue: '')
  final String nickname;

  @JsonKey(name: 'onlineBegin', defaultValue: '')
  final String onlineBegin;

  @JsonKey(name: 'onlineEnd', defaultValue: '')
  final String onlineEnd;

  @JsonKey(name: 'portrait', defaultValue: '')
  final String portrait;

  // true表示不需要花钱,已免费聊天,false表示需要花钱
  @JsonKey(name: 'sendMsgFlag', defaultValue: false)
  final bool sendMsgFlag;

  @JsonKey(name: 'sendMsgPrice', defaultValue: 0)
  final int sendMsgPrice;

  @JsonKey(name: 'sex', defaultValue: KekokukSex.female)
  final KekokukSex sex;

  @JsonKey(name: 'signature', defaultValue: '')
  final String signature;

// 在设置了备注的情况下用来获取用户的原始昵称
  @JsonKey(name: 'srcNickname', defaultValue: '')
  final String srcNickname;

  @JsonKey(name: 'tagList', defaultValue: [])
  final List<String> tagList;

  @JsonKey(name: 'userAuth', defaultValue: KekokukiAuthType.authedAnchor)
  final KekokukiAuthType authType;

  @JsonKey(name: 'userId', defaultValue: 0)
  final int id;

// 登录的账户名
  @JsonKey(name: 'username', defaultValue: '')
  final String username;

// 用户状态 -1 注销  1 正常
  @JsonKey(name: 'userStatus', defaultValue: 1)
  final int userStatus;

  @JsonKey(name: 'wallVoList', defaultValue: [])
  final List<KekokukAnchorGiftModel> wallVoList;

  KekokukiAnchorModel(
    this.albumUrlList,
    this.birthday,
    this.callPrice,
    this.countryCode,
    this.countryPath,
    this.countryTitle,
    this.faceFlag,
    this.followCount,
    this.followedCount,
    this.followStatus,
    this.onlineStatus,
    this.language,
    this.languageName,
    this.levelModel,
    this.likeFlag,
    this.likeMeCount,
    this.manyLanguage,
    this.manyLanguageName,
    this.moments,
    this.nickname,
    this.onlineBegin,
    this.onlineEnd,
    this.portrait,
    this.sendMsgFlag,
    this.sendMsgPrice,
    this.sex,
    this.signature,
    this.srcNickname,
    this.tagList,
    this.authType,
    this.id,
    this.username,
    this.userStatus,
    this.wallVoList,
  );

  factory KekokukiAnchorModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiAnchorModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiAnchorModelToJson(this);
}

@JsonSerializable()
class KekokukAnchorGiftModel extends Object {
  @JsonKey(name: 'currDiffNum', defaultValue: 0)
  final int currDiffNum;

  @JsonKey(name: 'diamonds', defaultValue: 0)
  final int diamonds;

  @JsonKey(name: 'gid', defaultValue: 0)
  final int id;

  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'receiveNum', defaultValue: 0)
  final int receiveNum;

  @JsonKey(name: 'topOneNickname', defaultValue: '')
  final String topOneNickname;

  @JsonKey(name: 'topOnePortrait', defaultValue: '')
  final String topOnePortrait;

  @JsonKey(name: 'topOneUserId', defaultValue: 0)
  final int topOneUserId;

  @JsonKey(name: 'topOneVipFlag', defaultValue: false)
  final bool topOneVipFlag;

  KekokukAnchorGiftModel(
    this.currDiffNum,
    this.diamonds,
    this.id,
    this.icon,
    this.name,
    this.receiveNum,
    this.topOneNickname,
    this.topOnePortrait,
    this.topOneUserId,
    this.topOneVipFlag,
  );

  factory KekokukAnchorGiftModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukAnchorGiftModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukAnchorGiftModelToJson(this);
}

@JsonSerializable()
class KekokukAnchorMomentModel extends Object {
  @JsonKey(name: 'imageHeight', defaultValue: 0)
  final int imageHeight;

  @JsonKey(name: 'imageWidth', defaultValue: 0)
  final int imageWidth;

  @JsonKey(name: 'mediaId', defaultValue: 0)
  final int mediaId;

  @JsonKey(name: 'mediaUrl', defaultValue: '')
  final String mediaUrl;

  @JsonKey(name: 'momentId', defaultValue: 0)
  final int momentId;

// 审核模式尺度，1.正常尺度，2.大尺度
  @JsonKey(name: 'reviewScale', defaultValue: 1)
  final int reviewScale;

  // 资源尺度，1.正常尺度，2.大尺度，3.危险
  @JsonKey(name: 'scaleType', defaultValue: 1)
  final int scaleType;

  @JsonKey(name: 'userId', defaultValue: 0)
  final int userId;

  @JsonKey(name: 'visibleType', defaultValue: 0)
  final int visibleType;

  KekokukAnchorMomentModel(
    this.imageHeight,
    this.imageWidth,
    this.mediaId,
    this.mediaUrl,
    this.momentId,
    this.reviewScale,
    this.scaleType,
    this.userId,
    this.visibleType,
  );

  factory KekokukAnchorMomentModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukAnchorMomentModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukAnchorMomentModelToJson(this);
}

@JsonSerializable()
class KekokukAnchorLevelModel extends Object {
  @JsonKey(name: 'avatarFrame', defaultValue: '')
  final String avatarFrame;

  @JsonKey(name: 'begin', defaultValue: 0)
  final int begin;

  @JsonKey(name: 'end', defaultValue: 0)
  final int end;

  @JsonKey(name: 'icon', defaultValue: '')
  final String icon;

  @JsonKey(name: 'level', defaultValue: 0)
  final int level;

  @JsonKey(name: 'userIcon', defaultValue: '')
  final String userIcon;

  KekokukAnchorLevelModel(
    this.avatarFrame,
    this.begin,
    this.end,
    this.icon,
    this.level,
    this.userIcon,
  );

  factory KekokukAnchorLevelModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukAnchorLevelModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukAnchorLevelModelToJson(this);
}

@JsonSerializable()
class KekokukAnchorAlbumModel extends Object {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'userId', defaultValue: 0)
  final int userId;

  @JsonKey(name: 'value', defaultValue: '')
  final String url;

  @JsonKey(name: 'videoCover', defaultValue: '')
  final String videoCover;

  @JsonKey(name: 'videoSeconds', defaultValue: 0)
  final int videoSeconds;

  KekokukAnchorAlbumModel(
    this.id,
    this.userId,
    this.url,
    this.videoCover,
    this.videoSeconds,
  );

  factory KekokukAnchorAlbumModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukAnchorAlbumModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukAnchorAlbumModelToJson(this);
}
