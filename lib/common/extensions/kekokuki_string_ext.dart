import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

extension KekokukiStringExt on String {
  String get md5 => crypto.md5.convert(utf8.encode(this)).toString();

  Size boundingSize(
    TextStyle style, {
    int maxLines = 2 ^ 31,
    double maxWidth = double.infinity,
  }) {
    TextPainter textPainter = TextPainter(
      maxLines: maxLines,
      text: TextSpan(
        text: this,
        style: style,
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  static String generateRandomString(int length) {
    final random = Random.secure();
    final valuesList = List.generate(length, (i) => random.nextInt(256));
    final bytes = Uint8List.fromList(valuesList);
    return base64Url.encode(bytes).substring(0, length); // 使用base64编码缩短长度（可选）
  }
}
