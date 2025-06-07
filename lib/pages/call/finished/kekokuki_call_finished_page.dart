import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'kekokuki_call_finished_page_controller.dart';

class KekokukiCallFinishedPage extends GetView<KekokukiCallFinishedPageController> {
  const KekokukiCallFinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KekokukiCallFinishedPage')),
      body: SafeArea(child: Text('KekokukiCallFinishedPageController')),
    );
  }
}
