// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_call_channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiCallChannelModel _$KekokukiCallChannelModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiCallChannelModel(
      channelId: (json['channelId'] as num?)?.toInt() ?? 0,
      callType: $enumDecodeNullable(_$KekokukiCallTypeEnumMap, json['callType'],
              unknownValue: KekokukiCallType.unknown) ??
          KekokukiCallType.anchor,
      noProfitSeconds: (json['noProfitSeconds'] as num?)?.toInt() ?? 0,
      usedCallCard: json['usedCallCard'] as bool? ?? false,
      callCardCoins: (json['callCardCoins'] as num?)?.toInt() ?? 0,
      callCardSeconds: (json['callCardSeconds'] as num?)?.toInt() ?? 0,
      chargePriceCoins: (json['chargePriceCoins'] as num?)?.toInt() ?? 0,
      matchCardCoins: (json['matchCardCoins'] as num?)?.toInt() ?? 0,
      matchCardSeconds: (json['matchCardSeconds'] as num?)?.toInt() ?? 20,
      remainDiamonds: (json['remainDiamonds'] as num?)?.toInt() ?? 0,
      chargePrice: (json['chargePrice'] as num?)?.toInt() ?? 0,
      rtcToken: json['rtcToken'] as String? ?? '',
    );

Map<String, dynamic> _$KekokukiCallChannelModelToJson(
        KekokukiCallChannelModel instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'callType': _$KekokukiCallTypeEnumMap[instance.callType]!,
      'noProfitSeconds': instance.noProfitSeconds,
      'usedCallCard': instance.usedCallCard,
      'callCardCoins': instance.callCardCoins,
      'callCardSeconds': instance.callCardSeconds,
      'matchCardCoins': instance.matchCardCoins,
      'matchCardSeconds': instance.matchCardSeconds,
      'remainDiamonds': instance.remainDiamonds,
      'chargePrice': instance.chargePrice,
      'chargePriceCoins': instance.chargePriceCoins,
      'rtcToken': instance.rtcToken,
    };

const _$KekokukiCallTypeEnumMap = {
  KekokukiCallType.unknown: -1,
  KekokukiCallType.anchor: 0,
  KekokukiCallType.aib: 1,
  KekokukiCallType.match: 2,
  KekokukiCallType.aiv: 3,
  KekokukiCallType.aim: 4,
};
