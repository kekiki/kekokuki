//
//  KekokukiLoginInfoModel.dart
//
//
//  Created by JSONConverter on 2025/05/14.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_login_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class KekokukiLoginInfoModel extends Object {
  @JsonKey(name: 'appChannel', defaultValue: '')
  final String appChannel;

  @JsonKey(name: 'authorization', defaultValue: '')
  final String authorization;

  @JsonKey(name: 'deregisterFlag', defaultValue: 0)
  final int deregisterFlag;

  @JsonKey(name: 'userId', defaultValue: 0)
  final int userId;

  @JsonKey(name: 'username', defaultValue: '')
  final String username;

  const KekokukiLoginInfoModel({
    this.appChannel = '',
    this.authorization = '',
    this.deregisterFlag = 0,
    this.userId = 0,
    this.username = '',
  });

  factory KekokukiLoginInfoModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiLoginInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiLoginInfoModelToJson(this);
}
