import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KekokukiEmojiListWidget extends StatelessWidget {
  const KekokukiEmojiListWidget({
    super.key,
    required this.textScrollController,
    required this.textEditingController,
    this.height = 300,
    this.width = double.infinity,
    this.backgroundColor = Colors.transparent,
  });

  final ScrollController textScrollController;
  final TextEditingController textEditingController;
  final double width;
  final double height;
  final Color backgroundColor;

  List<String> get emojiItems {
    List<String> emojis = [];
    int startCodePoint = 0x1F600;
    int endCodePoint = 0x1F64F;
    for (int codePoint = startCodePoint; codePoint <= endCodePoint; codePoint++) {
      emojis.add(String.fromCharCode(codePoint));
    }
    return emojis;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
            itemCount: emojiItems.length,
            itemBuilder: (context, index) {
              final emoji = emojiItems[index];
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  textEditingController
                    ..text += emoji
                    ..selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
                  Future.delayed(const Duration(milliseconds: 100), () {
                    textScrollController.jumpTo(textScrollController.position.maxScrollExtent);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(emoji, style: const TextStyle(fontSize: 20)),
                ),
              );
            },
          ),
          PositionedDirectional(
            bottom: 12,
            end: 4,
            child: IconButton(
              onPressed: () {
                textEditingController
                  ..text = textEditingController.text.characters.skipLast(1).toString()
                  ..selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
                Future.delayed(const Duration(milliseconds: 100), () {
                  textScrollController.jumpTo(textScrollController.position.maxScrollExtent);
                });
              },
              icon: const Icon(CupertinoIcons.delete_left_fill, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
