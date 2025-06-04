//
//  KekokukiAiConfigModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_ai_config_model.g.dart';

@JsonSerializable()
class KekokukiAiConfigModel extends Object {

	@JsonKey(name: 'aivDailyLimit')
	num? aivDailyLimit;

	@JsonKey(name: 'aivSwitch')
	num? aivSwitch;

	@JsonKey(name: 'aivTotalLimit')
	num? aivTotalLimit;

	@JsonKey(name: 'configType')
	num? configType;

	@JsonKey(name: 'idleDelay')
	num? idleDelay;

	@JsonKey(name: 'idleReset')
	num? idleReset;

	@JsonKey(name: 'minDelay')
	num? minDelay;

	@JsonKey(name: 'refuseLimit')
	num? refuseLimit;

	@JsonKey(name: 'refuseReset')
	num? refuseReset;

	@JsonKey(name: 'refuseUnit')
	num? refuseUnit;

	@JsonKey(name: 'scanDelay')
	num? scanDelay;

	@JsonKey(name: 'scanLimit')
	num? scanLimit;

	@JsonKey(name: 'scanReset')
	num? scanReset;

	@JsonKey(name: 'scanStay')
	num? scanStay;

	@JsonKey(name: 'slideLimit')
	num? slideLimit;

	@JsonKey(name: 'slideUnit')
	num? slideUnit;

	@JsonKey(name: 'typeDelay')
	num? typeDelay;

	KekokukiAiConfigModel(this.aivDailyLimit,this.aivSwitch,this.aivTotalLimit,this.configType,this.idleDelay,this.idleReset,this.minDelay,this.refuseLimit,this.refuseReset,this.refuseUnit,this.scanDelay,this.scanLimit,this.scanReset,this.scanStay,this.slideLimit,this.slideUnit,this.typeDelay,);

	factory KekokukiAiConfigModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiAiConfigModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiAiConfigModelToJson(this);

}
