import 'package:flutter/material.dart';

import 'kekokuki_gradient_border.dart';

class KekokukiButtonWidget extends StatelessWidget {
  const KekokukiButtonWidget({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    this.child,
    this.backgroundGradient,
    this.borderGradient,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.splashColor = Colors.black12,
  });

  final Widget? child;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final double borderRadius;

  final Color borderColor;
  final double borderWidth;
  final Color splashColor;
  final Gradient? backgroundGradient;
  final Gradient? borderGradient;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(Radius.circular(this.borderRadius));
    BoxBorder? border;
    final gradient = borderGradient;
    if (gradient != null) {
      border = KekokukiGradientBorder(gradient: gradient, width: borderWidth);
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
        borderRadius: borderRadius,
        border: border,
      ),
      child: OutlinedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(splashColor),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          fixedSize: WidgetStateProperty.all(Size(width, height)),
          side: WidgetStateProperty.all(BorderSide(color: borderColor, width: borderWidth)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child ?? Container(),
      ),
    );
  }
}
