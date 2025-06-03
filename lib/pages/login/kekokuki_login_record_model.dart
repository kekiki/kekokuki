//
//  KekokukiLoginInfoModel.dart
//
//
//  Created by JSONConverter on 2025/05/14.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_login_record_model.g.dart';

// 用户登陆方式
@JsonEnum(valueField: 'value')
enum KekokukiLoginType {
  fast(1), // 快速登陆
  password(2), // 密码登陆
  google(3); // Google登陆

  final int value;
  const KekokukiLoginType(this.value);
}

@JsonSerializable(explicitToJson: true)
class KekokukiLoginRecordModel extends Object {
  @JsonKey(name: 'account', defaultValue: '')
  final String account;

  @JsonKey(name: 'password', defaultValue: '')
  final String password;

  @JsonKey(name: 'id', defaultValue: '')
  final String googleOpenId;

  @JsonKey(name: 'googleToken', defaultValue: '')
  final String googleToken;

  @JsonKey(name: 'cover', defaultValue: '')
  final String cover;

  @JsonKey(name: 'nickname', defaultValue: '')
  final String nickname;

  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  @JsonKey(name: 'type', defaultValue: KekokukiLoginType.fast)
  final KekokukiLoginType type;

  const KekokukiLoginRecordModel({
    this.type = KekokukiLoginType.fast,
    this.account = '',
    this.password = '',
    this.googleOpenId = '',
    this.googleToken = '',
    this.cover = '',
    this.nickname = '',
    this.email = '',
  });

  bool get isGoogleLogin => type == KekokukiLoginType.google;

  bool get isAccountLogin {
    return type == KekokukiLoginType.password || type == KekokukiLoginType.fast;
  }

  bool get isInvilid {
    if (isGoogleLogin) {
      return googleOpenId.isEmpty || googleToken.isEmpty;
    } else if (isAccountLogin) {
      return account.isEmpty || password.isEmpty;
    }
    return true;
  }

  factory KekokukiLoginRecordModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiLoginRecordModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiLoginRecordModelToJson(this);
}
