import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../message/kekokuki_chat_message_page.dart';
import '../services/kekokuki_chat_service.dart';
import 'kekokuki_chat_conversation_mixin.dart';
import 'kekokuki_chat_conversation_model.dart';

class KekokukiChatConversationPageController extends GetxController with KekokukiChatConversationMixin {
  final _service = Get.find<KekokukiChatService>();
  final conversationListObs = RxList<KekokukiChatConversationModel>();
  late EasyRefreshController refreshController;

  @override
  void onInit() {
    refreshController = EasyRefreshController(controlFinishRefresh: true);
    addConversationListListener(onConversationListListener);
    super.onInit();
  }

  @override
  void onClose() {
    removeConversationListListener();
    refreshController.dispose();
    super.onClose();
  }

  void onConversationListListener(List<KekokukiChatConversationModel>? list) {
    if (list == null) return;
    conversationListObs.value = list;
  }

  void onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    refreshController.finishRefresh(IndicatorResult.success);
  }

  void onTapPin(KekokukiChatConversationModel conversation) async {
    _service.updateConversation(conversation.copyWith(isPined: !conversation.isPined));
  }

  void onTapDelete(KekokukiChatConversationModel conversation) {
    _service.deleteConversation(conversation);
  }

  void onTapConversation(KekokukiChatConversationModel conversation) {
    KekokukiChatMessagePage.show(anchorId: conversation.anchorId);
  }
}
