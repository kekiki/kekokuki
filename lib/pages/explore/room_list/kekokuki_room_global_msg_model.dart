//
//  KekokukiRoomGlobalMsgModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_room_global_msg_model.g.dart';

@JsonSerializable()
class KekokukiRoomGlobalMsgModel extends Object {

	@JsonKey(name: 'content')
	String? content;

	@JsonKey(name: 'diamonds')
	num? diamonds;

	@JsonKey(name: 'gameMode')
	num? gameMode;

	@JsonKey(name: 'nickname')
	String? nickname;

	@JsonKey(name: 'portrait')
	String? portrait;

	@JsonKey(name: 'rid')
	num? rid;

	@JsonKey(name: 'roomBgImg')
	String? roomBgImg;

	@JsonKey(name: 'roomTitle')
	String? roomTitle;

	KekokukiRoomGlobalMsgModel(this.content,this.diamonds,this.gameMode,this.nickname,this.portrait,this.rid,this.roomBgImg,this.roomTitle,);

	factory KekokukiRoomGlobalMsgModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiRoomGlobalMsgModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiRoomGlobalMsgModelToJson(this);

}
