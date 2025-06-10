import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'kekokuki_anchor_list_page_controller.dart';

class KekokukiAnchorListPage extends GetView<KekokukiAnchorListPageController> {
  const KekokukiAnchorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KekokukiAnchorListPage')),
      body: SafeArea(child: Text('KekokukiAnchorListPageController')),
    );
  }
}
