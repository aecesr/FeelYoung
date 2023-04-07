
import 'package:FeelYoung_getx/ui/pages/message/controllers/message_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:leancloud_official_plugin/leancloud_plugin.dart';


class SelectContactController extends GetxController {
  final groupMembers = <String>{}.obs; // 新建群聊的人员id
  // todo: 添加集合里或移除
  void addOrRemove(bool isSelected, String id) {
    if (isSelected) {
      groupMembers.remove(id);
    } else {
      groupMembers.add(id);
    }
  }

  // todo: 创建群聊会话
  void createGroupConversation(String GroupName) async {
    var msgCto = Get.find<MessageController>();
    try {
      Conversation conversation = await msgCto.me.createConversation(
        isUnique: true,
        members: groupMembers,
        name: GroupName,
      );
      TextMessage textMessage = TextMessage();
      textMessage.text = '欢迎～';
      // 向对话中发送一条消息
      await conversation.send(message: textMessage);

      // 返回到首页
      msgCto.updateConversationList();
      Get.back();
      Get.back();
    } catch (e) {
      EasyLoading.showError('状态异常，请重启App');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
