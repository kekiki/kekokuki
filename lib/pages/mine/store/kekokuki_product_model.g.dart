// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekokuki_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KekokukiProductModel _$KekokukiProductModelFromJson(
        Map<String, dynamic> json) =>
    KekokukiProductModel(
      json['bonus'] as num?,
      json['callCardNum'] as num?,
      json['chatCardNum'] as num?,
      json['currencyCode'] as String?,
      json['currencyPrice'] as num?,
      json['diamonds'] as num?,
      json['discount'] as num?,
      json['discountType'] as String?,
      json['matchCardNum'] as num?,
      (json['ppp'] as List<dynamic>?)
          ?.map((e) =>
              KekokukiProductModelPpp.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['price'] as num?,
      json['productCode'] as String?,
      json['productId'] as num?,
      json['productOrder'] as num?,
      json['productType'] as num?,
      (json['splits'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['vipDays'] as num?,
      json['vipUnitPrice'] as num?,
    );

Map<String, dynamic> _$KekokukiProductModelToJson(
        KekokukiProductModel instance) =>
    <String, dynamic>{
      'bonus': instance.bonus,
      'callCardNum': instance.callCardNum,
      'chatCardNum': instance.chatCardNum,
      'currencyCode': instance.currencyCode,
      'currencyPrice': instance.currencyPrice,
      'diamonds': instance.diamonds,
      'discount': instance.discount,
      'discountType': instance.discountType,
      'matchCardNum': instance.matchCardNum,
      'ppp': instance.ppp,
      'price': instance.price,
      'productCode': instance.productCode,
      'productId': instance.productId,
      'productOrder': instance.productOrder,
      'productType': instance.productType,
      'splits': instance.splits,
      'vipDays': instance.vipDays,
      'vipUnitPrice': instance.vipUnitPrice,
    };

KekokukiProductModelPpp _$KekokukiProductModelPppFromJson(
        Map<String, dynamic> json) =>
    KekokukiProductModelPpp(
      json['browserOpen'] as num?,
      json['callCardNum'] as num?,
      json['ccName'] as String?,
      json['ccType'] as String?,
      json['chatCardNum'] as num?,
      json['currencyCode'] as String?,
      json['currencyPrice'] as num?,
      json['diamonds'] as num?,
      json['matchCardNum'] as num?,
      json['nationalFlagPath'] as String?,
      json['ppId'] as num?,
      json['ppOrder'] as num?,
      json['ppType'] as num?,
      json['supportCoupon'] as String?,
      json['uploadUsd'] as num?,
      json['vipDays'] as num?,
    );

Map<String, dynamic> _$KekokukiProductModelPppToJson(
        KekokukiProductModelPpp instance) =>
    <String, dynamic>{
      'browserOpen': instance.browserOpen,
      'callCardNum': instance.callCardNum,
      'ccName': instance.ccName,
      'ccType': instance.ccType,
      'chatCardNum': instance.chatCardNum,
      'currencyCode': instance.currencyCode,
      'currencyPrice': instance.currencyPrice,
      'diamonds': instance.diamonds,
      'matchCardNum': instance.matchCardNum,
      'nationalFlagPath': instance.nationalFlagPath,
      'ppId': instance.ppId,
      'ppOrder': instance.ppOrder,
      'ppType': instance.ppType,
      'supportCoupon': instance.supportCoupon,
      'uploadUsd': instance.uploadUsd,
      'vipDays': instance.vipDays,
    };
