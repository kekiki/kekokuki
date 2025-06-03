import 'package:flutter/material.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';
import '../../framework/adapts/kekokuki_screen_adapt.dart';

abstract class KekokukiStyles {
  /// font style
  static const TextStyle _textStyle = TextStyle(
    color: KekokukiColors.primaryTextColor,
    height: 1.5,
  );

  static final s10w400 = _textStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 10.pt);
  static final s10w500 = _textStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 10.pt);

  static final s12w400 = _textStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 12.pt);
  static final s12w500 = _textStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 12.pt);
  static final s12w700 = _textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 12.pt);

  static final s14w400 = _textStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 14.pt);
  static final s14w600 = _textStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 14.pt);

  static final s16w400 = _textStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 16.pt);
  static final s16w600 = _textStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16.pt);
  static final s16w700 = _textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 16.pt);

  static final s18w700 = _textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.pt);
  static final s22w700 = _textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 22.pt);
  static final s26w600 = _textStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 26.pt);
}
