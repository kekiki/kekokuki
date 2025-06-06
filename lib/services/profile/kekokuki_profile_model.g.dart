// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiProfileModel _$KekokukiProfileModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiProfileModel(
      birthday: (json['birthday'] as num?)?.toInt() ?? 0,
      boundGoogle: (json['boundGoogle'] as num?)?.toInt() ?? 0,
      countryCode: (json['countryCode'] as num?)?.toInt() ?? 0,
      countryPath: json['countryPath'] as String? ?? '',
      countrySubCode: json['countrySubCode'] as String? ?? '',
      countryTitle: json['countryTitle'] as String? ?? '',
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      disturbFlag: (json['disturbFlag'] as num?)?.toInt() ?? 0,
      faceFlag: json['faceFlag'] as bool? ?? false,
      firstPaidTime: (json['firstPaidTime'] as num?)?.toInt() ?? 0,
      followFlag: json['followFlag'] as String? ?? '',
      hasPassword: (json['hasPassword'] as num?)?.toInt() ?? 0,
      hasPendingSplit: (json['hasPendingSplit'] as num?)?.toInt() ?? 0,
      hasSplitOrder: (json['hasSplitOrder'] as num?)?.toInt() ?? 0,
      isAdult: (json['isAdult'] as num?)?.toInt() ?? 0,
      isOnline: (json['isOnline'] as num?)?.toInt() ?? 0,
      levelModel: json['levelConfig'] == null
          ? null
          : KekokukProfileLevelModel.fromJson(
              json['levelConfig'] as Map<String, dynamic>),
      likeFlag: json['likeFlag'] as String? ?? '',
      likeMeCount: json['likeMeCount'] as String? ?? '',
      multiUser: (json['multiUser'] as num?)?.toInt() ?? 0,
      nickname: json['nickname'] as String? ?? '',
      notifyFlag: (json['notifyFlag'] as num?)?.toInt() ?? 0,
      portrait: json['portrait'] as String? ?? '',
      propVoList: (json['propVoList'] as List<dynamic>?)
              ?.map((e) =>
                  KekokukiProfilePropModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rechargeFlag: (json['rechargeFlag'] as num?)?.toInt() ?? 0,
      registerReportFlag: (json['registerReportFlag'] as num?)?.toInt() ?? 0,
      registerRewardFlag: (json['registerRewardFlag'] as num?)?.toInt() ?? 0,
      remainCoins: (json['remainCoins'] as num?)?.toInt() ?? 0,
      remainDiamonds: (json['remainDiamonds'] as num?)?.toInt() ?? 0,
      rflag: (json['rflag'] as num?)?.toInt() ?? 1,
      sexSelected: (json['sexSelected'] as num?)?.toInt() ?? 0,
      sexyMomentFlag: (json['sexyMomentFlag'] as num?)?.toInt() ?? 0,
      sexyTipFlag: (json['sexyTipFlag'] as num?)?.toInt() ?? 0,
      showGuild: (json['showGuild'] as num?)?.toInt() ?? 0,
      signature: json['signature'] as String? ?? '',
      signFlag: (json['signFlag'] as num?)?.toInt() ?? 0,
      tagImgId: (json['tagImgId'] as num?)?.toInt() ?? 0,
      todayUser: (json['todayUser'] as num?)?.toInt() ?? 0,
      totalRecharge: (json['totalRecharge'] as num?)?.toInt() ?? 0,
      userAuth: (json['userAuth'] as num?)?.toInt() ?? 0,
      userGuildFlag: (json['userGuildFlag'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
      vipEndTime: (json['vipEndTime'] as num?)?.toInt() ?? 0,
      vipFlag: json['vipFlag'] as bool? ?? false,
      vipSignFlag: (json['vipSignFlag'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukiProfileModelToJson(
        KekokukiProfileModel instance) =>
    <String, dynamic>{
      'birthday': instance.birthday,
      'boundGoogle': instance.boundGoogle,
      'countryCode': instance.countryCode,
      'countryPath': instance.countryPath,
      'countrySubCode': instance.countrySubCode,
      'countryTitle': instance.countryTitle,
      'createdAt': instance.createdAt,
      'disturbFlag': instance.disturbFlag,
      'faceFlag': instance.faceFlag,
      'firstPaidTime': instance.firstPaidTime,
      'followFlag': instance.followFlag,
      'hasPassword': instance.hasPassword,
      'hasPendingSplit': instance.hasPendingSplit,
      'hasSplitOrder': instance.hasSplitOrder,
      'isAdult': instance.isAdult,
      'isOnline': instance.isOnline,
      'levelConfig': instance.levelModel?.toJson(),
      'likeFlag': instance.likeFlag,
      'likeMeCount': instance.likeMeCount,
      'multiUser': instance.multiUser,
      'nickname': instance.nickname,
      'notifyFlag': instance.notifyFlag,
      'portrait': instance.portrait,
      'propVoList': instance.propVoList.map((e) => e.toJson()).toList(),
      'rechargeFlag': instance.rechargeFlag,
      'registerReportFlag': instance.registerReportFlag,
      'registerRewardFlag': instance.registerRewardFlag,
      'remainCoins': instance.remainCoins,
      'remainDiamonds': instance.remainDiamonds,
      'rflag': instance.rflag,
      'sexSelected': instance.sexSelected,
      'sexyMomentFlag': instance.sexyMomentFlag,
      'sexyTipFlag': instance.sexyTipFlag,
      'showGuild': instance.showGuild,
      'signature': instance.signature,
      'signFlag': instance.signFlag,
      'tagImgId': instance.tagImgId,
      'todayUser': instance.todayUser,
      'totalRecharge': instance.totalRecharge,
      'userAuth': instance.userAuth,
      'userGuildFlag': instance.userGuildFlag,
      'userId': instance.userId,
      'username': instance.username,
      'vipEndTime': instance.vipEndTime,
      'vipFlag': instance.vipFlag,
      'vipSignFlag': instance.vipSignFlag,
    };

KekokukProfileLevelModel _$KekokukProfileLevelModelFromJson(
        Map<String, dynamic> json) =>
    KekokukProfileLevelModel(
      json['avatarFrame'] as String?,
      json['begin'] as num?,
      json['end'] as num?,
      json['icon'] as String?,
      json['level'] as num?,
      json['userIcon'] as String?,
    );

Map<String, dynamic> _$KekokukProfileLevelModelToJson(
        KekokukProfileLevelModel instance) =>
    <String, dynamic>{
      'avatarFrame': instance.avatarFrame,
      'begin': instance.begin,
      'end': instance.end,
      'icon': instance.icon,
      'level': instance.level,
      'userIcon': instance.userIcon,
    };

KekokukiProfilePropModel _$KekokukiProfilePropModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiProfilePropModel(
      animEffectUrl: json['animEffectUrl'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      name: json['name'] as String? ?? '',
      propNum: (json['propNum'] as num?)?.toInt() ?? 0,
      propType:
          $enumDecodeNullable(_$KekokukiPropTypeEnumMap, json['propType']) ??
              KekokukiPropType.unknown,
      propValue: (json['propValue'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KekokukiProfilePropModelToJson(
        KekokukiProfilePropModel instance) =>
    <String, dynamic>{
      'animEffectUrl': instance.animEffectUrl,
      'icon': instance.icon,
      'name': instance.name,
      'propNum': instance.propNum,
      'propType': _$KekokukiPropTypeEnumMap[instance.propType]!,
      'propValue': instance.propValue,
    };

const _$KekokukiPropTypeEnumMap = {
  KekokukiPropType.unknown: -1,
  KekokukiPropType.callCard: 1,
  KekokukiPropType.diamondCard: 2,
  KekokukiPropType.giftCard: 3,
  KekokukiPropType.chatCard: 4,
  KekokukiPropType.matchCard: 5,
  KekokukiPropType.frame: 6,
};
