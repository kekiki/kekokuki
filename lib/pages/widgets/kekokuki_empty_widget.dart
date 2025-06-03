import 'package:flutter/material.dart';
import 'package:kekokuki/framework/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/generated/assets.dart';

import '../../services/styles/kekokuki_styles.dart';

class KekokukiEmptyWidget extends StatelessWidget {
  const KekokukiEmptyWidget({
    super.key,
    required this.text,
    this.height,
    this.imageSize,
  });

  final String text;
  final double? height;
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 400.pt,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   Assets.imagesKekokukiIconNoData,
          //   width: imageSize ?? 256.pt,
          //   height: imageSize ?? 256.pt,
          // ),
          SizedBox(height: 10.pt),
          Text(
            text,
            style: KekokukiStyles.s16w400,
          ),
        ],
      ),
    );
  }
}
