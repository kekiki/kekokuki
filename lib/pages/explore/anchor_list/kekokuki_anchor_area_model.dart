import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_anchor_area_model.g.dart';

@JsonSerializable(explicitToJson: true)
class KekokukiAnchorAreaModel {
  // 地区编码
  @JsonKey(name: 'areaCode')
  int areaCode;

  // 地区图片链接
  @JsonKey(name: 'path')
  String iconUrl;

  // 地区名称
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'anchorCount')
  int anchorCount;

  KekokukiAnchorAreaModel({
    this.areaCode = 0,
    this.iconUrl = '',
    this.title = '',
    this.anchorCount = 0,
  });

  factory KekokukiAnchorAreaModel.fromJson(Map<String, dynamic> json) => _$KekokukiAnchorAreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$KekokukiAnchorAreaModelToJson(this);
}
