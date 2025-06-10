import 'package:flutter/material.dart';

import '../../../services/styles/kekokuki_colors.dart';
import 'kekokuki_bottom_line_indicator.dart';

class KekokukiPrimaryTabbar extends TabBar {
  const KekokukiPrimaryTabbar({
    super.key,
    required super.tabs,
    super.controller,
    super.isScrollable = true,
    super.tabAlignment = TabAlignment.start,
    super.dividerHeight = 0,
    super.indicatorSize = TabBarIndicatorSize.tab,
    super.padding = EdgeInsets.zero,
    super.labelPadding,
    super.unselectedLabelColor = Colors.black54,
    super.unselectedLabelStyle,
    super.labelColor = KekokukiColors.primaryColor,
    super.labelStyle,
    super.indicator = const KekokukiAnchorTabIndicator(),
  });
}
