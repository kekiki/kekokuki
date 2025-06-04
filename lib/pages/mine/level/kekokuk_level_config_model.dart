//
//  KekokukLevelConfigModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuk_level_config_model.g.dart';

@JsonSerializable()
class KekokukLevelConfigModel extends Object {

	@JsonKey(name: 'configs')
	List<KekokukLevelConfigModelConfigs>? configs;

	@JsonKey(name: 'total')
	num? total;

	KekokukLevelConfigModel(this.configs,this.total,);

	factory KekokukLevelConfigModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukLevelConfigModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukLevelConfigModelToJson(this);

}

@JsonSerializable()
class KekokukLevelConfigModelConfigs extends Object {

	@JsonKey(name: 'avatarFrame')
	String? avatarFrame;

	@JsonKey(name: 'begin')
	num? begin;

	@JsonKey(name: 'end')
	num? end;

	@JsonKey(name: 'icon')
	String? icon;

	@JsonKey(name: 'level')
	num? level;

	@JsonKey(name: 'userIcon')
	String? userIcon;

	KekokukLevelConfigModelConfigs(this.avatarFrame,this.begin,this.end,this.icon,this.level,this.userIcon,);

	factory KekokukLevelConfigModelConfigs.fromJson(Map<String, dynamic> srcJson) => _$KekokukLevelConfigModelConfigsFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukLevelConfigModelConfigsToJson(this);

}
