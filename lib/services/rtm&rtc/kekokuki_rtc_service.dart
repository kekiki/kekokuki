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
  RtcEngineEventHandler? _eventHandler;
  bool _isCameraFront = true;

  Future<KekokukiRtcService> init() async {
    return this;
  }

  Future<void> initRtcEngine() async {
    // 创建 RtcEngine 对象
    _engine = createAgoraRtcEngine();

    // 初始化 RtcEngine，设置频道场景为 channelProfileLiveBroadcasting（直播场景）
    await _engine?.initialize(RtcEngineContext(
      appId: _configService.configModel.agoraAppId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    await _engine?.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
  }

  void listen({
    required int anchorId,
    void Function()? onSelfJoined,
    void Function()? onAnchorJoined,
    void Function()? onAnchorOffline,
    void Function()? onDisconnected,
    void Function()? onTokenWillExpire,
  }) {
    _eventHandler = RtcEngineEventHandler(
      onError: (err, msg) {
        KekokukiLogUtil.e(_tag, 'RTC error: [code: ${err.toString()}] msg: $msg}');
      },
      onConnectionStateChanged: (connection, state, reason) {
        KekokukiLogUtil.i(_tag, "Connection state changed: [state: ${state.toString()}],[channelId: ${connection.channelId}],[reason: $reason]");
        if (reason == ConnectionChangedReasonType.connectionChangedBannedByServer) {
          onDisconnected?.call();
        }
      },
      onJoinChannelSuccess: (connection, elapsed) {
        KekokukiLogUtil.i(_tag, "Local join channel success [channelId: ${connection.channelId}]");
        onSelfJoined?.call();
      },
      onUserJoined: (connection, remoteUid, elapsed) {
        if (remoteUid == anchorId) {
          KekokukiLogUtil.i(_tag, "Anchor join channel success [anchorId: $remoteUid],[channelId: ${connection.channelId}]");
          onAnchorJoined?.call();
        } else {
          KekokukiLogUtil.i(_tag, "Robot joined channel [remoteUid: $remoteUid],[channelId: ${connection.channelId}]");
        }
      },
      onUserOffline: (connection, remoteUid, reason) {
        if (remoteUid == anchorId) {
          if (reason == UserOfflineReasonType.userOfflineQuit) {
            onAnchorOffline?.call();
          }
          KekokukiLogUtil.i(_tag, "Anchor offline [remoteUid: $remoteUid],[channelId: ${connection.channelId}],[reason: $reason]");
        } else {
          KekokukiLogUtil.i(_tag, "Robot offline [remoteUid: $remoteUid],[channelId: ${connection.channelId}],[reason: $reason]");
        }
      },
      onConnectionLost: (connection) {
        // 声网连接中断,且SDK无法在10秒内连接服务器
        KekokukiLogUtil.w(_tag, 'RTC connection lost');
      },
      onTokenPrivilegeWillExpire: (connection, token) {
        KekokukiLogUtil.w(_tag, 'RTC token will expire: $token');
        onTokenWillExpire?.call();
      },
      onRequestToken: (connection) {
        KekokukiLogUtil.w(_tag, 'RTC token expired');
        onDisconnected?.call();
      },
    );
    _engine?.registerEventHandler(_eventHandler!);
  }

  Future<void> joinChannel({required int anchorId, required String channelId, required String token}) async {
    final userId = _profileService.profileModel.userId;
    await _engine?.joinChannel(
      token: token,
      channelId: channelId,
      uid: userId,
      options: const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  Future<void> release() async {
    try {
      if (_eventHandler != null) {
        _engine?.registerEventHandler(_eventHandler!);
      }
      await _engine?.leaveChannel();
      await _engine?.release();
      _engine = null;
      KekokukiLogUtil.i(_tag, "RTC release success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTC release failed: ${e.toString()}", s);
    }
  }

  Future<void> renewToken(String token) async {
    try {
      await _engine?.renewToken(token);
      KekokukiLogUtil.i(_tag, "RTC renew token success");
    } catch (e, s) {
      KekokukiLogUtil.e(_tag, "RTC renew token failed: ${e.toString()}", s);
    }
  }

  Future<void> setupVideoConfig() async {
    // 设置视频编码配置,影响主播端接收到的视频质量
    await _engine?.setVideoEncoderConfiguration(const VideoEncoderConfiguration(
      dimensions: VideoDimensions(width: 120, height: 160),
      degradationPreference: DegradationPreference.maintainFramerate,
      orientationMode: OrientationMode.orientationModeFixedPortrait,
    ));
  }

  /// 切换摄像头正反
  Future<void> switchCamera({bool reset = false}) async {
    if (reset) {
      if (!_isCameraFront) {
        await _engine?.switchCamera();
        _isCameraFront = true;
      }
    } else {
      _isCameraFront = !_isCameraFront;
      await _engine?.switchCamera();
    }
  }

  AgoraVideoView createLocalVideoWidget() {
    return AgoraVideoView(controller: VideoViewController(rtcEngine: _engine!, canvas: const VideoCanvas(uid: 0)));
  }

  AgoraVideoView createRemoteVideoWidget(int anchorId, String channelId) {
    return AgoraVideoView(controller: VideoViewController.remote(rtcEngine: _engine!, canvas: VideoCanvas(uid: anchorId), connection: RtcConnection(channelId: channelId)));
  }

  Future<void> startPreview() async {
    await _engine?.enableVideo();
    await switchCamera(reset: true);
    await _engine?.startPreview();
    await _engine?.setBeautyEffectOptions(
      enabled: true,
      options: const BeautyOptions(
        lighteningContrastLevel: LighteningContrastLevel.lighteningContrastHigh,
        // 对比度
        lighteningLevel: 1.0,
        // 美白程度
        smoothnessLevel: 1.0,
        // 磨皮程度
        rednessLevel: 1.0,
        // 红润度
        // sharpnessLevel: 1.0, // 锐化晰度
      ),
    );
  }

  Future<void> stopPreview() async {
    await _engine?.stopPreview();
    await _engine?.disableVideo();
  }

  void muteRemoteVideoStream(int anchorId, bool mute) {
    _engine?.muteRemoteVideoStream(uid: anchorId, mute: mute);
  }

  void muteRemoteAudioStream(int anchorId, bool mute) {
    _engine?.muteRemoteAudioStream(uid: anchorId, mute: mute);
  }

  void muteLocalVideoStream(bool mute) {
    _engine?.muteLocalVideoStream(mute);
  }

  void muteLocalAudioStream(bool mute) {
    _engine?.muteLocalAudioStream(mute);
  }

  void setEnableSpeakerphone(bool speakerOn) {
    _engine?.setEnableSpeakerphone(speakerOn);
  }
}
