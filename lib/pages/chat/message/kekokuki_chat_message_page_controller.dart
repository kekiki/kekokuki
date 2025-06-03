import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../services/profile/kekokuki_profile_mixin.dart';
import '../../../services/profile/kekokuki_profile_model.dart';
import '../../widgets/dialogs/permission/kekokuki_permission_dialog.dart';
import 'kekokuki_chat_message_mixin.dart';
import 'kekokuki_chat_message_model.dart';

enum KekokukiChatInputType { none, keyboard, emoji }

class KekokukiChatMessagePageController extends GetxController with KekokukiChatMessageMixin, KekokukiProfileMixin, WidgetsBindingObserver {
  late int _anchorId;

  final messageListObs = RxList<KekokukiChatMessageModel>();
  final enableSendObs = false.obs;
  final inputTypeObs = KekokukiChatInputType.none.obs;
  final profileObs = const KekokukiProfileModel().obs;

  final inputScrollController = ScrollController();
  final inputEditingController = TextEditingController();
  final inputEditingNode = FocusNode();
  final keyboardHeightObs = 278.0.obs;

  @override
  void onInit() {
    _anchorId = Get.arguments;
    addProfileChangedListener(onProfileChangedListener);
    addAnchorMessageListListener(_anchorId, onMessageListListener);
    inputEditingController.addListener(_editControllerListener);
    inputEditingNode.addListener(_editNodeListener);
    Get.engine.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    Get.engine.removeObserver(this);
    inputEditingNode.removeListener(_editNodeListener);
    inputEditingController.removeListener(_editControllerListener);
    removeAnchorMessageListListener();
    removeProfileChangedListener();
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    if (Get.mediaQuery.viewInsets.bottom > 0) keyboardHeightObs.value = Get.mediaQuery.viewInsets.bottom;
  }

  void onProfileChangedListener(KekokukiProfileModel? profile) {
    if (profile == null) return;
    profileObs.value = profile;
  }

  void onMessageListListener(List<KekokukiChatMessageModel>? list) {
    if (list == null) return;
    messageListObs.value = list.reversed.toList();
  }

  void _editControllerListener() {
    enableSendObs.value = inputEditingController.text.isNotEmpty;
  }

  void _editNodeListener() {
    if (inputEditingNode.hasFocus) {
      inputTypeObs.value = KekokukiChatInputType.keyboard;
    } else {
      if (inputTypeObs.value == KekokukiChatInputType.keyboard) {
        inputTypeObs.value = KekokukiChatInputType.none;
      }
    }
  }

  void onCloseKeyboard() {
    if (inputEditingNode.hasFocus) {
      inputEditingNode.unfocus();
    } else {
      if (inputTypeObs.value != KekokukiChatInputType.none) {
        inputTypeObs.value = KekokukiChatInputType.none;
      }
    }
  }

  void onTapAnchorAvatar() {
    // Get.toNamed(
    //   KekokukiRoutes.anchorDetail,
    //   arguments: state.anchorInfoObs.value,
    // );
  }

  void onTapUserAvatar() {
    // do nothing
  }

  void onTapMessage(KekokukiChatMessageModel message) {}

  void onTapEmoji() async {
    if (inputTypeObs.value != KekokukiChatInputType.emoji) {
      inputTypeObs.value = KekokukiChatInputType.emoji;
    } else {
      inputTypeObs.value = KekokukiChatInputType.none;
    }
    if (inputEditingNode.hasFocus) {
      inputEditingNode.unfocus();
    }
  }

  void onTapGift() async {
    // Get.bottomSheet(
    //   KekokukiGiftDialog(
    //     isCalling: false,
    //     anchorId: state.anchorId,
    //     sessionId: state.sessionId,
    //   ),
    // );
  }

  void onTapTextField() {
    // if (_isChatLimited) {
    //   Get.toNamed(KekokukiRoutes.vip);
    //   return;
    // } else {
    //   editingNode.requestFocus();
    // }
    if (!inputEditingNode.hasFocus) {
      inputEditingNode.requestFocus();
    }
  }

  void onTapSend() async {
    final message = inputEditingController.text;
    if (message.isEmpty) return;

    // if (state.blockModelObs.value.isToBlock) {
    //   KekokukiLoadingUtil.showToast('kekokuki_to_block_tips'.tr);
    //   return;
    // }
    // if (state.blockModelObs.value.isBeBlock) {
    //   KekokukiLoadingUtil.showToast('kekokuki_be_block_tips'.tr);
    //   return;
    // }

    // editingController.clear();

    // try {
    //   KekokukiLoadingUtil.show();
    //   final isFilter = await _verifyMessage(KekokukiChatMessageType.text, message);
    //   if (isFilter) {
    //     await KekokukiChatManager.instance.sendTextMessage(
    //       sessionId: state.sessionId,
    //       text: message,
    //     );
    //   } else {
    //     // await KekokukiChatManager.instance.saveTextMessage(
    //     //   sessionId: state.sessionId,
    //     //   text: message,
    //     // );
    //     await KekokukiChatManager.instance.sendTextMessage(
    //       sessionId: state.sessionId,
    //       text: '****',
    //     );
    //   }
    //   KekokukiLoadingUtil.dismiss();
    // } catch (e) {
    //   KekokukiLoadingUtil.dismiss();
    //   KekokukiLogUtil.e('ChatContent', e.toString());
    // }
  }

  void onTapResend(KekokukiChatMessageModel messageModel) {
    // if (state.blockModelObs.value.isToBlock) {
    //   KekokukiLoadingUtil.showToast('kekokuki_to_block_tips'.tr);
    //   return;
    // }
    // if (state.blockModelObs.value.isBeBlock) {
    //   KekokukiLoadingUtil.showToast('kekokuki_be_block_tips'.tr);
    //   return;
    // }
    // KekokukiChatManager.instance.resendMessage(messageModel);
  }

  void onTapImage() async {
    onCloseKeyboard();

    final status = await Permission.photos.request();
    if (status.isPermanentlyDenied) {
      await Get.dialog(
        const KekokukiPermissionDialog(
          permissionList: [Permission.photos],
        ),
      );
      return;
    }

    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    // if (state.blockModelObs.value.isToBlock) {
    //   KekokukiLoadingUtil.showToast('kekokuki_to_block_tips'.tr);
    //   return;
    // }
    // if (state.blockModelObs.value.isBeBlock) {
    //   KekokukiLoadingUtil.showToast('kekokuki_be_block_tips'.tr);
    //   return;
    // }

    // try {
    //   KekokukiLoadingUtil.show();
    //   final imagePath = image.path;
    //   final fileSize = await image.length();
    //   List<int> imageBytes = await image.readAsBytes();
    //   String base64Image = base64Encode(imageBytes);
    //   final content = 'data:image/jpg;base64,$base64Image';
    //   final isFilter = await _verifyMessage(KekokukiChatMessageType.image, content);
    //   if (isFilter) {
    //     await KekokukiChatManager.instance.sendImageMessage(
    //       sessionId: state.sessionId,
    //       filePath: imagePath,
    //       fileSize: fileSize,
    //     );
    //   } else {
    //     // await KekokukiChatManager.instance.saveImageMessage(
    //     //   sessionId: state.sessionId,
    //     //   filePath: imagePath,
    //     //   fileSize: fileSize,
    //     // );
    //     await KekokukiChatManager.instance.sendTextMessage(
    //       sessionId: state.sessionId,
    //       text: '****',
    //     );
    //   }
    //   KekokukiLoadingUtil.dismiss();
    // } catch (e) {
    //   KekokukiLoadingUtil.dismiss();
    //   KekokukiLogUtil.e('ChatContent', e.toString());
    // }
  }
}
