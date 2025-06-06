import 'package:json_annotation/json_annotation.dart';

part 'kekokuki_aiv_anchor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class KekokukiAivAnchorModel {
  @JsonKey(name: 'anchorUserId')
  int anchorId;

  @JsonKey(name: 'videoId')
  int videoId;

  @JsonKey(name: 'videoUrl')
  String videoUrl;

  // 声音开关 0:关闭 1:开启
  @JsonKey(name: 'voiceFlag')
  int voiceFlag;

  // 是否可看虚拟视频，0.不能看，1.能看
  @JsonKey(name: 'isFree')
  int isFree;

  // 是否可通话，0.不可通话，1.可通话
  @JsonKey(name: 'callable')
  int callable;

  KekokukiAivAnchorModel({
    this.anchorId = 0,
    this.videoId = 0,
    this.videoUrl = '',
    this.voiceFlag = 0,
    this.isFree = 0,
    this.callable = 0,
  });

  KekokukiAivAnchorModel copyWith({
    int? anchorId,
    int? videoId,
    String? videoUrl,
    int? voiceFlag,
    int? isFree,
    int? callable,
  }) {
    return KekokukiAivAnchorModel(
      anchorId: anchorId ?? this.anchorId,
      videoId: videoId ?? this.videoId,
      videoUrl: videoUrl ?? this.videoUrl,
      voiceFlag: voiceFlag ?? this.voiceFlag,
      isFree: isFree ?? this.isFree,
      callable: callable ?? this.callable,
    );
  }

  bool get canCreateCall => callable == 1;

  bool get canPlayAiv => videoUrl.isNotEmpty;

  factory KekokukiAivAnchorModel.fromJson(Map<String, dynamic> json) => _$KekokukiAivAnchorModelFromJson(json);

  Map<String, dynamic> toJson() => _$KekokukiAivAnchorModelToJson(this);
}
