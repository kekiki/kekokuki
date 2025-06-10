import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'kekokuki_status.dart';
import 'kekokuki_status_page.dart';

GlobalKey<_KekokukiStatusBuilderState> statusBuilderKey = GlobalKey<_KekokukiStatusBuilderState>();

class KekokukiStatusBuilder extends StatefulWidget {
  final Widget Function(BuildContext context) bodyBuilder;
  final Widget Function(BuildContext context)? errorBuilder;
  final Widget Function(BuildContext context)? emptyBuilder;

  /// only used when status is error and errorBuilder is not provided
  final void Function()? onReload;

  KekokukiStatusBuilder({
    required this.bodyBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.onReload,
  }) : super(key: statusBuilderKey);

  @override
  State<KekokukiStatusBuilder> createState() => _KekokukiStatusBuilderState();
}

class _KekokukiStatusBuilderState extends State<KekokukiStatusBuilder> {
  KekokukiStatus _status = KekokukiStatus.loading();

  void update(KekokukiStatus newStatus) {
    if (mounted) {
      setState(() {
        _status = newStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_status.isLoading) {
      return Skeletonizer(
        enabled: true,
        ignorePointers: true,
        textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(8)),
        child: widget.bodyBuilder(context),
      );
    }
    if (_status.isError) {
      return widget.errorBuilder?.call(context) ?? KekokukiStatusPage(status: KekokukiStatus.error(), onReload: widget.onReload);
    }
    if (_status.isEmpty) {
      return widget.emptyBuilder?.call(context) ?? KekokukiStatusPage(status: KekokukiStatus.empty());
    }
    if (_status.isSuccess) {
      return widget.bodyBuilder(context);
    }
    return const SizedBox.shrink();
  }
}
