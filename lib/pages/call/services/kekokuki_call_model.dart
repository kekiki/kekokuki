import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum KekokukiCallType {
  unknown(-1), // 未知
  normal(0), // 正常通话
  aib(1), // aib通话
  match(2), // 匹配通话
  aiv(3), // Aiv来电
  aim(4); // 匹配Aiv通话

  const KekokukiCallType(this.value);

  final int value;
}
