import 'package:flutter/material.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';

import '../../../../services/styles/kekokuki_colors.dart';
import '../../../../services/styles/kekokuki_styles.dart';
import '../kekokuki_calling_model.dart';

class KekokukiCallingTitleBar extends StatelessWidget {
  const KekokukiCallingTitleBar({
    super.key,
    required this.callModel,
    required this.callingDuration,
    this.onTapClose,
  });

  final KekokukiCallingModel callModel;
  final String callingDuration;
  final VoidCallback? onTapClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.pt,
      padding: EdgeInsets.symmetric(horizontal: 14.pt),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                callModel.anchor.nickname,
                style: KekokukiStyles.s16w700.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.pt),
              Container(
                width: 64.pt,
                height: 22.pt,
                decoration: BoxDecoration(
                  color: rgba(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(11.pt),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6.pt,
                      height: 6.pt,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(3.pt),
                      ),
                    ),
                    SizedBox(width: 6.pt),
                    Text(
                      callingDuration,
                      style: KekokukiStyles.s12w700.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onTapClose,
            icon: const Icon(Icons.close, size: 24),
          ),
        ],
      ),
    );
  }
}
