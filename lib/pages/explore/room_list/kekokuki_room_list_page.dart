import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'kekokuki_room_list_page_controller.dart';

class KekokukiRoomListPage extends GetView<KekokukiRoomListPageController> {
  const KekokukiRoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KekokukiRoomListPage')),
      body: SafeArea(child: Text('KekokukiRoomListPageController')),
    );
  }
}
