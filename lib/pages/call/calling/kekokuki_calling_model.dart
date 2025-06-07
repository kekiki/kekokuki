import 'package:kekokuki/pages/explore/anchor_detail/kekokuk_anchor_model.dart';

import '../ai/kekokuki_aiv_anchor_model.dart';
import '../going/kekokuki_call_channel_model.dart';
import '../services/kekokuki_call_model.dart';

class KekokukiCallingModel {
  final KekokukiAnchorModel anchor;
  final KekokukiCallType callType;
  final KekokukiCallChannelModel? channelModel;
  final KekokukiAivAnchorModel? aivModel;
  const KekokukiCallingModel(this.anchor, this.callType, {this.channelModel, this.aivModel});
}
