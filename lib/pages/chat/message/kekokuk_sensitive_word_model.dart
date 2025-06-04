//
//  KekokukSensitiveWordModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuk_sensitive_word_model.g.dart';

@JsonSerializable()
class KekokukSensitiveWordModel extends Object {

	@JsonKey(name: 'id')
	num? id;

	@JsonKey(name: 'mode')
	num? mode;

	@JsonKey(name: 'type')
	num? type;

	@JsonKey(name: 'words')
	String? words;

	@JsonKey(name: 'wordsStop')
	String? wordsStop;

	KekokukSensitiveWordModel(this.id,this.mode,this.type,this.words,this.wordsStop,);

	factory KekokukSensitiveWordModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukSensitiveWordModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukSensitiveWordModelToJson(this);

}
