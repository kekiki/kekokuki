//
//  KekokukiProductModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_product_model.g.dart';

@JsonSerializable()
class KekokukiProductModel extends Object {

	@JsonKey(name: 'bonus')
	num? bonus;

	@JsonKey(name: 'callCardNum')
	num? callCardNum;

	@JsonKey(name: 'chatCardNum')
	num? chatCardNum;

	@JsonKey(name: 'currencyCode')
	String? currencyCode;

	@JsonKey(name: 'currencyPrice')
	num? currencyPrice;

	@JsonKey(name: 'diamonds')
	num? diamonds;

	@JsonKey(name: 'discount')
	num? discount;

	@JsonKey(name: 'discountType')
	String? discountType;

	@JsonKey(name: 'matchCardNum')
	num? matchCardNum;

	@JsonKey(name: 'ppp')
	List<KekokukiProductModelPpp>? ppp;

	@JsonKey(name: 'price')
	num? price;

	@JsonKey(name: 'productCode')
	String? productCode;

	@JsonKey(name: 'productId')
	num? productId;

	@JsonKey(name: 'productOrder')
	num? productOrder;

	@JsonKey(name: 'productType')
	num? productType;

	@JsonKey(name: 'splits')
	List<String>? splits;

	@JsonKey(name: 'vipDays')
	num? vipDays;

	@JsonKey(name: 'vipUnitPrice')
	num? vipUnitPrice;

	KekokukiProductModel(this.bonus,this.callCardNum,this.chatCardNum,this.currencyCode,this.currencyPrice,this.diamonds,this.discount,this.discountType,this.matchCardNum,this.ppp,this.price,this.productCode,this.productId,this.productOrder,this.productType,this.splits,this.vipDays,this.vipUnitPrice,);

	factory KekokukiProductModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiProductModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiProductModelToJson(this);

}

@JsonSerializable()
class KekokukiProductModelPpp extends Object {

	@JsonKey(name: 'browserOpen')
	num? browserOpen;

	@JsonKey(name: 'callCardNum')
	num? callCardNum;

	@JsonKey(name: 'ccName')
	String? ccName;

	@JsonKey(name: 'ccType')
	String? ccType;

	@JsonKey(name: 'chatCardNum')
	num? chatCardNum;

	@JsonKey(name: 'currencyCode')
	String? currencyCode;

	@JsonKey(name: 'currencyPrice')
	num? currencyPrice;

	@JsonKey(name: 'diamonds')
	num? diamonds;

	@JsonKey(name: 'matchCardNum')
	num? matchCardNum;

	@JsonKey(name: 'nationalFlagPath')
	String? nationalFlagPath;

	@JsonKey(name: 'ppId')
	num? ppId;

	@JsonKey(name: 'ppOrder')
	num? ppOrder;

	@JsonKey(name: 'ppType')
	num? ppType;

	@JsonKey(name: 'supportCoupon')
	String? supportCoupon;

	@JsonKey(name: 'uploadUsd')
	num? uploadUsd;

	@JsonKey(name: 'vipDays')
	num? vipDays;

	KekokukiProductModelPpp(this.browserOpen,this.callCardNum,this.ccName,this.ccType,this.chatCardNum,this.currencyCode,this.currencyPrice,this.diamonds,this.matchCardNum,this.nationalFlagPath,this.ppId,this.ppOrder,this.ppType,this.supportCoupon,this.uploadUsd,this.vipDays,);

	factory KekokukiProductModelPpp.fromJson(Map<String, dynamic> srcJson) => _$KekokukiProductModelPppFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiProductModelPppToJson(this);

}
