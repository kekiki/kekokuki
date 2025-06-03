import 'package:flutter/material.dart';

class KekokukiAppScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  final bool isAllowBack;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final Decoration? backgroundDecoration;
  final bool safeTop;
  final bool safeBottom;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool extendBody;

  const KekokukiAppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.isAllowBack = true,
    this.safeTop = true,
    this.safeBottom = true,
    this.onBackPressed,
    this.backgroundDecoration,
    this.backgroundColor = Colors.white,
    this.resizeToAvoidBottomInset = false,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
  });

  @override
  Widget build(BuildContext context) {
    if (onBackPressed != null || !isAllowBack) {
      return PopScope(
        canPop: isAllowBack,
        onPopInvoked: (didPop) {
          if (didPop) return;

          onBackPressed?.call();
        },
        child: _buildScoffold(context),
      );
    }
    return _buildScoffold(context);
  }

  Widget _buildScoffold(BuildContext context) {
    return Container(
      decoration: backgroundDecoration ?? BoxDecoration(color: backgroundColor),
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: bottomNavigationBar,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        extendBody: extendBody,
        body: SafeArea(
          top: safeTop,
          bottom: safeBottom,
          child: body ?? const SizedBox(),
        ),
      ),
    );
  }
}
