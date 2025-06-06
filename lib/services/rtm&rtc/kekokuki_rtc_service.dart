import 'package:get/get.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

import '../../common/utils/kekokuki_log_util.dart';
import '../config/kekokuki_config_service.dart';
import '../profile/kekokuki_profile_service.dart';

class KekokukiRtcService extends GetxService {
  static const _tag = "RtcService";

  final _configService = Get.find<KekokukiConfigService>();
  final _profileService = Get.find<KekokukiProfileService>();

  RtcEngine? _engine;

  Future<KekokukiRtcService> init() async {
    return this;
  }

  Future<void> _initRtcEngine() async {
    // 创建 RtcEngine 对象
    _engine = createAgoraRtcEngine();

    // 初始化 RtcEngine，设置频道场景为 channelProfileLiveBroadcasting（直播场景）
    await _engine?.initialize(RtcEngineContext(
      appId: _configService.configModel.agoraAppId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    await _engine?.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    // 设置视频编码配置,影响主播端接收到的视频质量
    await _engine?.setVideoEncoderConfiguration(const VideoEncoderConfiguration(
      dimensions: VideoDimensions(width: 120, height: 160),
      degradationPreference: DegradationPreference.maintainFramerate,
      orientationMode: OrientationMode.orientationModeFixedPortrait,
    ));
  }

  void listen({
    required int anchorId,
    void Function()? onSelfJoined,
    void Function()? onAnchorJoined,
  }) {
    _engine?.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (connection, elapsed) {
        KekokukiLogUtil.i(_tag, "self join channel success [channelId: ${connection.channelId}]");
        onSelfJoined?.call();
      },
      onUserJoined: (connection, remoteUid, elapsed) {
        if (remoteUid == anchorId) {
          KekokukiLogUtil.i(_tag, "anchor join channel success [anchorId: $remoteUid],[channelId: ${connection.channelId}]");
          onAnchorJoined?.call();
        } else {
          KekokukiLogUtil.i(_tag, "robot joined channel [remoteUid: $remoteUid],[channelId: ${connection.channelId}]");
        }
      },
    ));
  }

  Future<void> connect({required int anchorId, required String channelId, required String token}) async {
    if (_engine == null) await _initRtcEngine();
    final userId = _profileService.profileModel.userId;
    await _engine?.joinChannel(
      token: token,
      channelId: channelId,
      uid: userId,
      options: const ChannelMediaOptions(
        // 自动订阅所有视频流
        autoSubscribeVideo: true,
        // 自动订阅所有音频流
        autoSubscribeAudio: true,
        // 发布摄像头采集的视频
        publishCameraTrack: true,
        // 发布麦克风采集的音频
        publishMicrophoneTrack: true,
        // 设置用户角色为 clientRoleBroadcaster（主播）或 clientRoleAudience（观众）
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  Future<void> release() async {
    await _engine?.leaveChannel();
    await _engine?.release();
    _engine = null;
  }
}
