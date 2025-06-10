import 'package:flutter/material.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/pages/call/going/kekokuki_call_going_page.dart';

import '../pages/call/services/kekokuki_call_model.dart';
import '../services/styles/kekokuki_colors.dart';
import '../services/styles/kekokuki_styles.dart';

class KekokukiTestCallPage extends StatelessWidget {
  const KekokukiTestCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    String anchorId = '10028761';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '通话测试',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.pt),
        child: Column(
          children: [
            Container(
              width: 339.pt,
              height: 46.pt,
              padding: EdgeInsets.symmetric(horizontal: 12.pt),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(6.pt),
              ),
              child: TextField(
                maxLines: 1,
                cursorColor: KekokukiColors.primaryColor,
                keyboardType: TextInputType.number,
                style: KekokukiStyles.s14w400,
                textInputAction: TextInputAction.none,
                decoration: InputDecoration(
                  hintText: anchorId,
                  hintStyle: KekokukiStyles.s14w400.copyWith(
                    color: Colors.black26,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  anchorId = value;
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  final id = int.tryParse(anchorId) ?? 0;
                  if (id <= 0) return;
                  KekokukiCallGoingPage.show(anchorId: id, callType: KekokukiCallType.anchor);
                },
                child: const Text('主叫')),
            TextButton(onPressed: () {}, child: const Text('AIB')),
          ],
        ),
      ),
    );
  }
}
