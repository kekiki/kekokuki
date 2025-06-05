import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekokuki/pages/login/kekokuki_login_service.dart';
import 'package:kekokuki/common/utils/kekokuki_log_util.dart';
import 'package:kekokuki/services/preference/kekokuki_app_preference.dart';

import '../common/widgets/kekokuki_app_bar.dart';
import '../common/widgets/kekokuki_app_scaffold.dart';
import '../services/styles/kekokuki_styles.dart';
import 'kekokuki_test_log_page.dart';

class KekokukiTestToolsPage extends StatelessWidget {
  const KekokukiTestToolsPage({super.key});

  KekokukiLoginService get _loginService => Get.find<KekokukiLoginService>();

  @override
  Widget build(BuildContext context) {
    return KekokukiAppScaffold(
      appBar: KekokukiAppBar(
        title: Text(
          "Test",
          style: KekokukiStyles.s18w700,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        ListTile(
          tileColor: Colors.black12,
          title: const Text('环境切换'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(KekokukiAppPreference.config.isApiServerTest ? "测试环境" : "正式环境"),
              const Icon(Icons.navigate_next_rounded, size: 20),
            ],
          ),
        ),
        ListTile(
          tileColor: Colors.white,
          title: const Text('查看日志'),
          trailing: const Icon(Icons.navigate_next_rounded, size: 20),
          onTap: () async {
            final lines = await KekokukiLogUtil.readAsLines();
            final clear = await Get.to(() => KekokukiTestLogPage(lines: lines.reversed.toList()));
            if (clear == true) KekokukiLogUtil.clear();
          },
        ),
        if (_loginService.isLogin) ...[
          const ListTile(
            tileColor: Colors.black12,
            title: Text('弹窗测试'),
            trailing: Icon(Icons.navigate_next_rounded, size: 20),
          ),
          const ListTile(
            tileColor: Colors.white,
            title: Text('通话测试'),
            trailing: Icon(Icons.navigate_next_rounded, size: 20),
          ),
        ],
      ],
    );
  }
}
