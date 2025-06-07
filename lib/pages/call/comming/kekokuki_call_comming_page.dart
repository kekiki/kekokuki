import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'kekokuki_call_comming_page_controller.dart';

class KekokukiCallCommingPage extends GetView<KekokukiCallCommingPageController> {
  const KekokukiCallCommingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KekokukiCallCommingPage')),
      body: SafeArea(child: Text('KekokukiCallCommingPageController')),
    );
  }
}
