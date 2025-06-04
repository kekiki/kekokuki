// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_sign_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiSignInModel _$KekokukiSignInModelFromJson(Map<String, dynamic> json) =>
    KekokukiSignInModel(
      json['nexTimes'] as num?,
      (json['rewardList'] as List<dynamic>?)
          ?.map((e) =>
              KekokukiSignInModelRewardList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['signDay'] as num?,
      json['signFlag'] as bool?,
    );

Map<String, dynamic> _$KekokukiSignInModelToJson(
        KekokukiSignInModel instance) =>
    <String, dynamic>{
      'nexTimes': instance.nexTimes,
      'rewardList': instance.rewardList,
      'signDay': instance.signDay,
      'signFlag': instance.signFlag,
    };

KekokukiSignInModelRewardList _$KekokukiSignInModelRewardListFromJson(
        Map<String, dynamic> json) =>
    KekokukiSignInModelRewardList(
      json['countryCode'] as num?,
      json['icon'] as String?,
      json['id'] as num?,
      json['name'] as String?,
      json['rewardType'] as num?,
      json['rewardValue'] as num?,
      json['signDay'] as num?,
      json['vipDoubleReward'] as num?,
    );

Map<String, dynamic> _$KekokukiSignInModelRewardListToJson(
        KekokukiSignInModelRewardList instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'rewardType': instance.rewardType,
      'rewardValue': instance.rewardValue,
      'signDay': instance.signDay,
      'vipDoubleReward': instance.vipDoubleReward,
    };
