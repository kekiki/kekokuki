import 'package:flutter/material.dart';
import 'package:kekokuki/common/utils/kekokuki_log_util.dart';

class KekokukiKeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KekokukiKeepAliveWidget({
    super.key,
    required this.child,
  });

  @override
  State<KekokukiKeepAliveWidget> createState() =>
      _KekokukiKeepAliveWidgetState();
}

class _KekokukiKeepAliveWidgetState extends State<KekokukiKeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    KekokukiLogUtil.i('_KeepAliveState', 'initState');
  }

  @override
  void dispose() {
    super.dispose();
    KekokukiLogUtil.i('_KeepAliveState', 'dispose');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
