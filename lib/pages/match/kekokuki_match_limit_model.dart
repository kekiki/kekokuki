//
//  KekokukiMatchLimitModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_match_limit_model.g.dart';

@JsonSerializable()
class KekokukiMatchLimitModel extends Object {

	@JsonKey(name: 'aivLeftCount')
	num? aivLeftCount;

	@JsonKey(name: 'aivLeftSeconds')
	num? aivLeftSeconds;

	@JsonKey(name: 'aivTotalCount')
	num? aivTotalCount;

	@JsonKey(name: 'leftCount')
	num? leftCount;

	@JsonKey(name: 'leftSeconds')
	num? leftSeconds;

	@JsonKey(name: 'totalCount')
	num? totalCount;

	KekokukiMatchLimitModel(this.aivLeftCount,this.aivLeftSeconds,this.aivTotalCount,this.leftCount,this.leftSeconds,this.totalCount,);

	factory KekokukiMatchLimitModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiMatchLimitModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiMatchLimitModelToJson(this);

}
