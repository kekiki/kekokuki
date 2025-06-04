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

	@JsonKey(name: 'anchorUserId')
	num? anchorUserId;

	@JsonKey(name: 'continueAiv')
	num? continueAiv;

	KekokukAibAnchorModel(this.anchorUserId,this.continueAiv,);

	factory KekokukAibAnchorModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukAibAnchorModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukAibAnchorModelToJson(this);

}
