import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum KekokukiCallType {
  unknown(-1), // 未知
  anchor(0), // 主播正常通话
  aib(1), // aib通话
  match(2), // 匹配通话
  aiv(3), // Aiv来电
  aim(4); // 匹配Aiv通话

  const KekokukiCallType(this.value);

  final int value;
}

@JsonEnum(valueField: 'value')
enum KekokukiCallStatus {
  none(-1), // 空闲
  comming(0), // 收到来电中
  going(1), // 拨打中
  connecting(2), // 连接中
  calling(3), // 通话中
  finished(4), // 完成通话
  hangup(5); // 挂断

  const KekokukiCallStatus(this.value);

  final int value;
}

/// 通话结束类型
@JsonEnum(valueField: 'value')
enum KekokukiCallEndStatus {
  callError(-1), // 通话失败
  localCallSuccess(0), // 成功发起呼叫
  localCallTimeout(10001), // 自己主叫超时
  localCallCancel(10002), // 自己主叫取消
  localCallReject(10003), // 自己主叫拒绝
  localCallFailed(10004), // 自己主叫失败
  remoteCallReject(10005), // 用户被叫用户主动拒绝
  remoteCallCancel(10006), // 用户被叫但对方取消0
  remoteCallTimeout(10007), // 用户被叫超时
  balanceNotEnough(10008), // 用户余额不足
  connectError(10009), // 用户连接异常
  connectCancel(10010), // 用户取消连接
  otherError(10011), // 对方异常
  otherJoinChannelTimeout(10012), // 对方加入频道超时
  waitBeginTimeout(10013), // 用户等待begin指令超时
  hangUp(10014), // 主动挂断
  renewFailedBalanceNotEnough(10015), // 通话中余额不足续费失败
  renewFailedRequestError(10016), // 用户续费接口调用失败
  otherOffline(10017), // 对方离线
  otherHangUp(10018), // 对方挂断
  otherBanned(10019), // 对方被封禁
  networkError(10020), // 用户网络异常挂断
  channelError(205); // 收到频道为null

  const KekokukiCallEndStatus(this.value);

  final int value;
}
