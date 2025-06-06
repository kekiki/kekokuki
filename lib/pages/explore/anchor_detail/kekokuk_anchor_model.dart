//
//  KekokukAnchorModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import 'kekokuki_album_list_converter.dart';
import 'kekokuki_gift_list_converter.dart';
import 'kekokuki_level_model_converter.dart';
import 'kekokuki_moment_list_converter.dart';
import 'kekokuki_tag_list_converter.dart';

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
@Entity(tableName: KekokukiAnchorModel.tableName)
@TypeConverters([
  KekokukiAlbumListConverter,
  KekokukiMomentListConverter,
  KekokukiTagListConverter,
  KekokukiGiftListConverter,
  KekokukiLevelModelConverter,
])
class KekokukiAnchorModel extends Object {
  static const String tableName = 'database_table_anchor_info';

  @JsonKey(name: 'albumUrlList')
  final List<KekokukAnchorAlbumModel> albumUrlList;

  @JsonKey(name: 'birthday')
  final int birthday;

  @JsonKey(name: 'callPrice')
  final int callPrice;

  @JsonKey(name: 'countryCode')
  final int countryCode;

  @JsonKey(name: 'countryPath')
  final String countryPath;

  @JsonKey(name: 'countryTitle')
  final String countryTitle;

  @JsonKey(name: 'faceFlag')
  final bool faceFlag;

  @JsonKey(name: 'followCount')
  final int followCount;

  @JsonKey(name: 'followedCount')
  final int followedCount;

  @JsonKey(name: 'followFlag')
  final KekokukiFollowStatus followStatus;

  @JsonKey(name: 'isOnline')
  final KekokukOnlineStatus onlineStatus;

  @JsonKey(name: 'language')
  final String language;

  @JsonKey(name: 'languageName')
  final String languageName;

  @JsonKey(name: 'levelConfig')
  final KekokukAnchorLevelModel levelModel;

// 是否已点赞, 1未点 2已点
  @JsonKey(name: 'likeFlag')
  final int likeFlag;

  @JsonKey(name: 'likeMeCount')
  final int likeMeCount;

  @JsonKey(name: 'manyLanguage')
  final String manyLanguage;

  @JsonKey(name: 'manyLanguageName')
  final String manyLanguageName;

  @JsonKey(name: 'moments')
  final List<KekokukAnchorMomentModel> moments;

  @JsonKey(name: 'nickname')
  final String nickname;

  @JsonKey(name: 'onlineBegin')
  final String onlineBegin;

  @JsonKey(name: 'onlineEnd')
  final String onlineEnd;

  @JsonKey(name: 'portrait')
  final String portrait;

  // true表示不需要花钱,已免费聊天,false表示需要花钱
  @JsonKey(name: 'sendMsgFlag')
  final bool sendMsgFlag;

  @JsonKey(name: 'sendMsgPrice')
  final int sendMsgPrice;

  @JsonKey(name: 'sex')
  final KekokukSex sex;

  @JsonKey(name: 'signature')
  final String signature;

// 在设置了备注的情况下用来获取用户的原始昵称
  @JsonKey(name: 'srcNickname')
  final String srcNickname;

  @JsonKey(name: 'tagList')
  final List<String> tagList;

  @JsonKey(name: 'userAuth')
  final KekokukiAuthType authType;

  @primaryKey
  @JsonKey(name: 'userId')
  final int id;

// 登录的账户名
  @JsonKey(name: 'username')
  final String username;

// 用户状态 -1 注销  1 正常
  @JsonKey(name: 'userStatus')
  final int userStatus;

  @JsonKey(name: 'wallVoList')
  final List<KekokukAnchorGiftModel> wallVoList;

  const KekokukiAnchorModel({
    this.albumUrlList = const [],
    this.birthday = 0,
    this.callPrice = 0,
    this.countryCode = 0,
    this.countryPath = '',
    this.countryTitle = '',
    this.faceFlag = false,
    this.followCount = 0,
    this.followedCount = 0,
    this.followStatus = KekokukiFollowStatus.unFollow,
    this.onlineStatus = KekokukOnlineStatus.offline,
    this.language = 'en',
    this.languageName = 'English',
    this.levelModel = const KekokukAnchorLevelModel(),
    this.likeFlag = 1,
    this.likeMeCount = 0,
    this.manyLanguage = '',
    this.manyLanguageName = '',
    this.moments = const [],
    this.nickname = '',
    this.onlineBegin = '',
    this.onlineEnd = '',
    this.portrait = '',
    this.sendMsgFlag = false,
    this.sendMsgPrice = 0,
    this.sex = KekokukSex.female,
    this.signature = '',
    this.srcNickname = '',
    this.tagList = const [],
    this.authType = KekokukiAuthType.authedAnchor,
    this.id = 0,
    this.username = '',
    this.userStatus = 1,
    this.wallVoList = const [],
  });

  KekokukiAnchorModel copyWith({
    final List<KekokukAnchorAlbumModel>? albumUrlList,
    final int? birthday,
    final int? callPrice,
    final int? countryCode,
    final String? countryPath,
    final String? countryTitle,
    final bool? faceFlag,
    final int? followCount,
    final int? followedCount,
    final KekokukiFollowStatus? followStatus,
    final KekokukOnlineStatus? onlineStatus,
    final String? language,
    final String? languageName,
    final KekokukAnchorLevelModel? levelModel,
    final int? likeFlag,
    final int? likeMeCount,
    final String? manyLanguage,
    final String? manyLanguageName,
    final List<KekokukAnchorMomentModel>? moments,
    final String? nickname,
    final String? onlineBegin,
    final String? onlineEnd,
    final String? portrait,
    final bool? sendMsgFlag,
    final int? sendMsgPrice,
    final KekokukSex? sex,
    final String? signature,
    final String? srcNickname,
    final List<String>? tagList,
    final KekokukiAuthType? authType,
    final int? id,
    final String? username,
    final int? userStatus,
    List<KekokukAnchorGiftModel>? wallVoList,
  }) {
    return KekokukiAnchorModel(
      albumUrlList: albumUrlList ?? this.albumUrlList,
      birthday: birthday ?? this.birthday,
      callPrice: callPrice ?? this.callPrice,
      countryCode: countryCode ?? this.countryCode,
      countryPath: countryPath ?? this.countryPath,
      countryTitle: countryTitle ?? this.countryTitle,
      faceFlag: faceFlag ?? this.faceFlag,
      followCount: followCount ?? this.followCount,
      followedCount: followedCount ?? this.followedCount,
      followStatus: followStatus ?? this.followStatus,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      language: language ?? this.language,
      languageName: languageName ?? this.languageName,
      levelModel: levelModel ?? this.levelModel,
      likeFlag: likeFlag ?? this.likeFlag,
      likeMeCount: likeMeCount ?? this.likeMeCount,
      manyLanguage: manyLanguage ?? this.manyLanguage,
      manyLanguageName: manyLanguageName ?? this.manyLanguageName,
      moments: moments ?? this.moments,
      nickname: nickname ?? this.nickname,
      onlineBegin: onlineBegin ?? this.onlineBegin,
      onlineEnd: onlineEnd ?? this.onlineEnd,
      portrait: portrait ?? this.portrait,
      sendMsgFlag: sendMsgFlag ?? this.sendMsgFlag,
      sendMsgPrice: sendMsgPrice ?? this.sendMsgPrice,
      sex: sex ?? this.sex,
      signature: signature ?? this.signature,
      srcNickname: srcNickname ?? this.srcNickname,
      tagList: tagList ?? this.tagList,
      authType: authType ?? this.authType,
      id: id ?? this.id,
      username: username ?? this.username,
      userStatus: userStatus ?? this.userStatus,
      wallVoList: wallVoList ?? this.wallVoList,
    );
  }

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

  const KekokukAnchorLevelModel({
    this.avatarFrame = '',
    this.begin = 0,
    this.end = 0,
    this.icon = '',
    this.level = 0,
    this.userIcon = '',
  });

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
