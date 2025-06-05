import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kekokuki/common/adapts/kekokuki_screen_adapt.dart';
import 'package:kekokuki/common/widgets/kekokuki_round_image_widget.dart';

import '../../common/widgets/kekokuki_app_bar.dart';
import '../../common/widgets/kekokuki_app_scaffold.dart';
import '../../services/styles/kekokuki_styles.dart';
import 'anchor_detail/kekokuk_anchor_model.dart';
import 'kekokuki_explore_page_controller.dart';

class KekokukiExplorePage extends GetView<KekokukiExplorePageController> {
  const KekokukiExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        title: Text(
          "Explore".tr,
          style: KekokukiStyles.s18w700,
        ),
      ),
      body: PagingListener(
        controller: controller.pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedGridView(
            padding: EdgeInsets.symmetric(horizontal: 12.pt),
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<KekokukiAnchorModel>(
              itemBuilder: (context, item, index) {
                return KekokukiRoundImageWidget(
                  width: 184.pt,
                  height: 220.pt,
                  item.portrait,
                  fit: BoxFit.cover,
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3.pt,
              crossAxisSpacing: 3.pt,
              childAspectRatio: 184.pt / 220.pt,
            ),
          );
        },
      ),
    );
  }
}
