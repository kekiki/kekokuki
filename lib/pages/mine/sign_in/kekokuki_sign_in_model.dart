//
//  KekokukiSignInModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_sign_in_model.g.dart';

@JsonSerializable()
class KekokukiSignInModel extends Object {

	@JsonKey(name: 'nexTimes')
	num? nexTimes;

	@JsonKey(name: 'rewardList')
	List<KekokukiSignInModelRewardList>? rewardList;

	@JsonKey(name: 'signDay')
	num? signDay;

	@JsonKey(name: 'signFlag')
	bool? signFlag;

	KekokukiSignInModel(this.nexTimes,this.rewardList,this.signDay,this.signFlag,);

	factory KekokukiSignInModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiSignInModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiSignInModelToJson(this);

}

@JsonSerializable()
class KekokukiSignInModelRewardList extends Object {

	@JsonKey(name: 'countryCode')
	num? countryCode;

	@JsonKey(name: 'icon')
	String? icon;

	@JsonKey(name: 'id')
	num? id;

	@JsonKey(name: 'name')
	String? name;

	@JsonKey(name: 'rewardType')
	num? rewardType;

	@JsonKey(name: 'rewardValue')
	num? rewardValue;

	@JsonKey(name: 'signDay')
	num? signDay;

	@JsonKey(name: 'vipDoubleReward')
	num? vipDoubleReward;

	KekokukiSignInModelRewardList(this.countryCode,this.icon,this.id,this.name,this.rewardType,this.rewardValue,this.signDay,this.vipDoubleReward,);

	factory KekokukiSignInModelRewardList.fromJson(Map<String, dynamic> srcJson) => _$KekokukiSignInModelRewardListFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiSignInModelRewardListToJson(this);

}
