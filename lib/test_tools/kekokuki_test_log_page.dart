import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KekokukiTestLogPage extends StatelessWidget {
  final List<String> lines;
  const KekokukiTestLogPage({super.key, required this.lines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '错误日志',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          InkWell(
            onTap: () => Get.back(result: true),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '清空',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
        reverse: true,
        itemCount: lines.length,
        itemBuilder: (context, index) {
          if (lines[index].trim().isEmpty) {
            return const SizedBox.shrink();
          }
          final text = lines[index];
          return Text(
            text,
            style: TextStyle(
              color: text.contains('❌')
                  ? Colors.red
                  : text.contains('⚠️')
                      ? Colors.orange
                      : Colors.blue,
              fontSize: 10,
            ),
          );
        },
      ),
    );
  }
}
