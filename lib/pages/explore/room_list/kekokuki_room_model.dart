//
//  KekokukiRoomModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_room_model.g.dart';

@JsonSerializable()
class KekokukiRoomModel extends Object {
  @JsonKey(name: 'anchorId')
  num? anchorId;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'gameIcon')
  String? gameIcon;

  @JsonKey(name: 'gameMode')
  num? gameMode;

  @JsonKey(name: 'gameUnique')
  String? gameUnique;

  @JsonKey(name: 'nickName')
  String? nickName;

  @JsonKey(name: 'rid')
  num? rid;

  @JsonKey(name: 'roomBgImg')
  String? roomBgImg;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'userTotal')
  num? userTotal;

  KekokukiRoomModel(
    this.anchorId,
    this.content,
    this.gameIcon,
    this.gameMode,
    this.gameUnique,
    this.nickName,
    this.rid,
    this.roomBgImg,
    this.title,
    this.userTotal,
  );

  factory KekokukiRoomModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiRoomModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukiRoomModelToJson(this);
}
