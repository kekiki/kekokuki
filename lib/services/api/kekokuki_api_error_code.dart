import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum KekokukiApiErrorCode {
  success(0), // 成功
  systemError(1001), // 系统错误
  unLoginIn(1002), //未登录
  loginInfoError(1003), // 登录信息错误
  accountBanned(1004), // 账号封禁
  accountNoFound(1005), // 账号不存在
  parameterError(1006), // 参数错误
  illegalIP(1007), // 非法IP
  balanceNotEnough(1008), // 余额不足
  frequentRequests(1009), // 频繁请求
  inBlocklist(1010), // 在黑名单
  getLockTimeout(1011), // 获取锁超时
  mediaDetectError(1012), //图片文本视频检测失败
  otherIdentityNotSupport(1013), // 对方身份不支持 不能聊天
  shareCodeError(1014), //共享无效代码异常
  anchorAuthTimeLimit(1015), // 主播当天认证达到次数上限
  userDataInReview(1016), // 图片文本昵称视频正在审核中
  passwordError(1017), // 密码错误
  googleBound(1018), // Google账号已被绑定
  tagOutOfLimit(1019), // 标签个数超过限制
  otherDeviceLogin(1020), // 其他设备登陆
  orderCanNotPay(2001), // 订单无法支付
  callError(3001), // 通话异常
  otherCanNotCall(3002), // 对方无法接听
  matchFailed(3003), //匹配失败
  inviteCodeError(4001), //邀请码错误
  repeatBindInviteCode(4002), // 重复绑定邀请码
  inviteCodeExpired(4003), // 邀请码过期
  giftNotFound(5001), // 礼物不存在
  repeatCheckIn(6001); // 重复签到

  const KekokukiApiErrorCode(this.value);

  final int value;
}
