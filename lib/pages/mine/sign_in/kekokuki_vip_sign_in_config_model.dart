//
//  KekokukiVipSignInConfigModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_vip_sign_in_config_model.g.dart';

@JsonSerializable()
class KekokukiVipSignInConfigModel extends Object {
  @JsonKey(name: 'configs')
  List<KekokukiVipSignInConfigModelConfigs>? configs;

  @JsonKey(name: 'signInFlag')
  num? signInFlag;

  KekokukiVipSignInConfigModel(
    this.configs,
    this.signInFlag,
  );

  factory KekokukiVipSignInConfigModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiVipSignInConfigModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiVipSignInConfigModelToJson(this);
}

@JsonSerializable()
class KekokukiVipSignInConfigModelConfigs extends Object {
  @JsonKey(name: 'configType')
  int configType;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'num')
  int num;

  KekokukiVipSignInConfigModelConfigs(
    this.configType,
    this.id,
    this.num,
  );

  factory KekokukiVipSignInConfigModelConfigs.fromJson(Map<String, dynamic> srcJson) => _$KekokukiVipSignInConfigModelConfigsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiVipSignInConfigModelConfigsToJson(this);
}
