// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuk_anchor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiAnchorModel _$KekokukiAnchorModelFromJson(Map<String, dynamic> json) =>
    KekokukiAnchorModel(
      (json['albumUrlList'] as List<dynamic>?)
              ?.map((e) =>
                  KekokukAnchorAlbumModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['birthday'] as num?)?.toInt() ?? 0,
      (json['callPrice'] as num?)?.toInt() ?? 0,
      (json['countryCode'] as num?)?.toInt() ?? 0,
      json['countryPath'] as String? ?? '',
      json['countryTitle'] as String? ?? '',
      json['faceFlag'] as bool? ?? false,
      (json['followCount'] as num?)?.toInt() ?? 0,
      (json['followedCount'] as num?)?.toInt() ?? 0,
      $enumDecodeNullable(_$KekokukiFollowStatusEnumMap, json['followFlag']) ??
          KekokukiFollowStatus.unFollow,
      $enumDecodeNullable(_$KekokukOnlineStatusEnumMap, json['isOnline']) ??
          KekokukOnlineStatus.offline,
      json['language'] as String? ?? 'en',
      json['languageName'] as String? ?? 'English',
      json['levelConfig'] == null
          ? null
          : KekokukAnchorLevelModel.fromJson(
              json['levelConfig'] as Map<String, dynamic>),
      (json['likeFlag'] as num?)?.toInt() ?? 1,
      (json['likeMeCount'] as num?)?.toInt() ?? 0,
      json['manyLanguage'] as String? ?? '',
      json['manyLanguageName'] as String? ?? '',
      (json['moments'] as List<dynamic>?)
              ?.map((e) =>
                  KekokukAnchorMomentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      json['nickname'] as String? ?? '',
      json['onlineBegin'] as String? ?? '',
      json['onlineEnd'] as String? ?? '',
      json['portrait'] as String? ?? '',
      json['sendMsgFlag'] as bool? ?? false,
      (json['sendMsgPrice'] as num?)?.toInt() ?? 0,
      $enumDecodeNullable(_$KekokukSexEnumMap, json['sex']) ??
          KekokukSex.female,
      json['signature'] as String? ?? '',
      json['srcNickname'] as String? ?? '',
      (json['tagList'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      $enumDecodeNullable(_$KekokukiAuthTypeEnumMap, json['userAuth']) ??
          KekokukiAuthType.authedAnchor,
      (json['userId'] as num?)?.toInt() ?? 0,
      json['username'] as String? ?? '',
      (json['userStatus'] as num?)?.toInt() ?? 1,
      (json['wallVoList'] as List<dynamic>?)
              ?.map((e) =>
                  KekokukAnchorGiftModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$KekokukiAnchorModelToJson(
        KekokukiAnchorModel instance) =>
    <String, dynamic>{
      'albumUrlList': instance.albumUrlList.map((e) => e.toJson()).toList(),
      'birthday': instance.birthday,
      'callPrice': instance.callPrice,
      'countryCode': instance.countryCode,
      'countryPath': instance.countryPath,
      'countryTitle': instance.countryTitle,
      'faceFlag': instance.faceFlag,
      'followCount': instance.followCount,
      'followedCount': instance.followedCount,
      'followFlag': _$KekokukiFollowStatusEnumMap[instance.followStatus]!,
      'isOnline': _$KekokukOnlineStatusEnumMap[instance.onlineStatus]!,
      'language': instance.language,
      'languageName': instance.languageName,
      'levelConfig': instance.levelModel?.toJson(),
      'likeFlag': instance.likeFlag,
      'likeMeCount': instance.likeMeCount,
      'manyLanguage': instance.manyLanguage,
      'manyLanguageName': instance.manyLanguageName,
      'moments': instance.moments.map((e) => e.toJson()).toList(),
      'nickname': instance.nickname,
      'onlineBegin': instance.onlineBegin,
      'onlineEnd': instance.onlineEnd,
      'portrait': instance.portrait,
      'sendMsgFlag': instance.sendMsgFlag,
      'sendMsgPrice': instance.sendMsgPrice,
      'sex': _$KekokukSexEnumMap[instance.sex]!,
      'signature': instance.signature,
      'srcNickname': instance.srcNickname,
      'tagList': instance.tagList,
      'userAuth': _$KekokukiAuthTypeEnumMap[instance.authType]!,
      'userId': instance.id,
      'username': instance.username,
      'userStatus': instance.userStatus,
      'wallVoList': instance.wallVoList.map((e) => e.toJson()).toList(),
    };

const _$KekokukiFollowStatusEnumMap = {
  KekokukiFollowStatus.unFollow: 0,
  KekokukiFollowStatus.followMe: 1,
  KekokukiFollowStatus.followed: 2,
  KekokukiFollowStatus.friend: 3,
};

const _$KekokukOnlineStatusEnumMap = {
  KekokukOnlineStatus.unknown: -1,
  KekokukOnlineStatus.offline: 0,
  KekokukOnlineStatus.online: 1,
  KekokukOnlineStatus.busy: 2,
};

const _$KekokukSexEnumMap = {
  KekokukSex.male: 1,
  KekokukSex.female: 2,
};

const _$KekokukiAuthTypeEnumMap = {
  KekokukiAuthType.unknown: -1,
  KekokukiAuthType.maleUser: 0,
  KekokukiAuthType.waitAuthAnchor: 1,
  KekokukiAuthType.authedAnchor: 2,
  KekokukiAuthType.authFailedAnchor: 3,
  KekokukiAuthType.anchorViolate: 4,
  KekokukiAuthType.anchorBanExam: 5,
  KekokukiAuthType.femaleUer: 9,
  KekokukiAuthType.fakeUser: 900,
};

KekokukAnchorGiftModel _$KekokukAnchorGiftModelFromJson(
        Map<String, dynamic> json) =>
    KekokukAnchorGiftModel(
      (json['currDiffNum'] as num?)?.toInt() ?? 0,
      (json['diamonds'] as num?)?.toInt() ?? 0,
      (json['gid'] as num?)?.toInt() ?? 0,
      json['icon'] as String? ?? '',
      json['name'] as String? ?? '',
      (json['receiveNum'] as num?)?.toInt() ?? 0,
      json['topOneNickname'] as String? ?? '',
      json['topOnePortrait'] as String? ?? '',
      (json['topOneUserId'] as num?)?.toInt() ?? 0,
      json['topOneVipFlag'] as bool? ?? false,
    );

Map<String, dynamic> _$KekokukAnchorGiftModelToJson(
        KekokukAnchorGiftModel instance) =>
    <String, dynamic>{
      'currDiffNum': instance.currDiffNum,
      'diamonds': instance.diamonds,
      'gid': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'receiveNum': instance.receiveNum,
      'topOneNickname': instance.topOneNickname,
      'topOnePortrait': instance.topOnePortrait,
      'topOneUserId': instance.topOneUserId,
      'topOneVipFlag': instance.topOneVipFlag,
    };

KekokukAnchorMomentModel _$KekokukAnchorMomentModelFromJson(
        Map<String, dynamic> json) =>
    KekokukAnchorMomentModel(
      (json['imageHeight'] as num?)?.toInt() ?? 0,
      (json['imageWidth'] as num?)?.toInt() ?? 0,
      (json['mediaId'] as num?)?.toInt() ?? 0,
      json['mediaUrl'] as String? ?? '',
      (json['momentId'] as num?)?.toInt() ?? 0,
      (json['reviewScale'] as num?)?.toInt() ?? 1,
      (json['scaleType'] as num?)?.toInt() ?? 1,
      (json['userId'] as num?)?.toInt() ?? 0,
      (json['visibleType'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukAnchorMomentModelToJson(
        KekokukAnchorMomentModel instance) =>
    <String, dynamic>{
      'imageHeight': instance.imageHeight,
      'imageWidth': instance.imageWidth,
      'mediaId': instance.mediaId,
      'mediaUrl': instance.mediaUrl,
      'momentId': instance.momentId,
      'reviewScale': instance.reviewScale,
      'scaleType': instance.scaleType,
      'userId': instance.userId,
      'visibleType': instance.visibleType,
    };

KekokukAnchorLevelModel _$KekokukAnchorLevelModelFromJson(
        Map<String, dynamic> json) =>
    KekokukAnchorLevelModel(
      json['avatarFrame'] as String? ?? '',
      (json['begin'] as num?)?.toInt() ?? 0,
      (json['end'] as num?)?.toInt() ?? 0,
      json['icon'] as String? ?? '',
      (json['level'] as num?)?.toInt() ?? 0,
      json['userIcon'] as String? ?? '',
    );

Map<String, dynamic> _$KekokukAnchorLevelModelToJson(
        KekokukAnchorLevelModel instance) =>
    <String, dynamic>{
      'avatarFrame': instance.avatarFrame,
      'begin': instance.begin,
      'end': instance.end,
      'icon': instance.icon,
      'level': instance.level,
      'userIcon': instance.userIcon,
    };

KekokukAnchorAlbumModel _$KekokukAnchorAlbumModelFromJson(
        Map<String, dynamic> json) =>
    KekokukAnchorAlbumModel(
      (json['id'] as num?)?.toInt() ?? 0,
      (json['userId'] as num?)?.toInt() ?? 0,
      json['value'] as String? ?? '',
      json['videoCover'] as String? ?? '',
      (json['videoSeconds'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukAnchorAlbumModelToJson(
        KekokukAnchorAlbumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'value': instance.url,
      'videoCover': instance.videoCover,
      'videoSeconds': instance.videoSeconds,
    };
