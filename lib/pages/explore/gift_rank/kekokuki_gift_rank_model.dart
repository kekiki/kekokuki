//
//  KekokukiGiftRankModel.dart
//
//
//  Created by JSONConverter on 2025/06/04.
//  Copyright © 2025年 JSONConverter. All rights reserved.
//

import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_gift_rank_model.g.dart';

@JsonSerializable()
class KekokukiGiftRankModel extends Object {

	@JsonKey(name: 'diamonds')
	num? diamonds;

	@JsonKey(name: 'gid')
	num? gid;

	@JsonKey(name: 'icon')
	String? icon;

	@JsonKey(name: 'quantity')
	num? quantity;

	@JsonKey(name: 'receiverId')
	num? receiverId;

	@JsonKey(name: 'receiverNickname')
	String? receiverNickname;

	@JsonKey(name: 'receiverPortrait')
	String? receiverPortrait;

	@JsonKey(name: 'recordId')
	num? recordId;

	@JsonKey(name: 'senderId')
	num? senderId;

	@JsonKey(name: 'senderNickname')
	String? senderNickname;

	@JsonKey(name: 'senderPortrait')
	String? senderPortrait;

	@JsonKey(name: 'time')
	num? time;

	KekokukiGiftRankModel(this.diamonds,this.gid,this.icon,this.quantity,this.receiverId,this.receiverNickname,this.receiverPortrait,this.recordId,this.senderId,this.senderNickname,this.senderPortrait,this.time,);

	factory KekokukiGiftRankModel.fromJson(Map<String, dynamic> srcJson) => _$KekokukiGiftRankModelFromJson(srcJson);

	Map<String, dynamic> toJson() => _$KekokukiGiftRankModelToJson(this);

}
