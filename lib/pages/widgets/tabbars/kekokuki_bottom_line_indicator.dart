import 'package:flutter/material.dart';
import 'package:kekokuki/services/styles/kekokuki_colors.dart';

class KekokukiAnchorTabIndicator extends Decoration {
  final Color color;
  final double width;
  final double height;
  final double topSpacing;
  final double radius;

  const KekokukiAnchorTabIndicator({
    this.color = KekokukiColors.primaryColor,
    this.width = 20,
    this.height = 3,
    this.topSpacing = 8,
    this.radius = 1,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(onChanged, this);
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }

  Rect _indicatorRectFor(Rect indicator, TextDirection textDirection) {
    double left = indicator.center.dx - (width / 2);
    double top = indicator.bottom + topSpacing;
    return Rect.fromLTWH(left, top, width, height);
  }
}

class _UnderlinePainter extends BoxPainter {
  final Paint underLinePaint = Paint();
  final KekokukiAnchorTabIndicator decoration;

  _UnderlinePainter(super.onChanged, this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration._indicatorRectFor(rect, textDirection);
    underLinePaint.style = PaintingStyle.fill;
    underLinePaint.color = decoration.color;
    canvas.drawRRect(RRect.fromRectXY(indicator, decoration.radius, decoration.radius), underLinePaint);
  }
}
