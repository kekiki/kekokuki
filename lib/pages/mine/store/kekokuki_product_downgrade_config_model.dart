//
//  KekokukiProductDowngradeConfigModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_product_downgrade_config_model.g.dart';

@JsonSerializable()
class KekokukiProductDowngradeConfigModel extends Object {

	@JsonKey(name: 'roundCount')
	num? roundCount;

	@JsonKey(name: 'viewPayCount')
	num? viewPayCount;

	@JsonKey(name: 'viewProductCount')
	num? viewProductCount;

	KekokukiProductDowngradeConfigModel(this.roundCount,this.viewPayCount,this.viewProductCount,);

	factory KekokukiProductDowngradeConfigModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiProductDowngradeConfigModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiProductDowngradeConfigModelToJson(this);

}
