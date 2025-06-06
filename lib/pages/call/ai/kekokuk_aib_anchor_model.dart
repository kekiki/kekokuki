//
//  KekokukAibAnchorModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuk_aib_anchor_model.g.dart';

@JsonSerializable()
class KekokukAibAnchorModel extends Object {
  @JsonKey(name: 'anchorUserId', defaultValue: 0)
  int anchorId;

// 是否继续拉一次aiv，0.否，1.是
  @JsonKey(name: 'continueAiv', defaultValue: 0)
  int continueAiv;

  KekokukAibAnchorModel(
    this.anchorId,
    this.continueAiv,
  );

  factory KekokukAibAnchorModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukAibAnchorModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$KekokukAibAnchorModelToJson(this);
}
