import 'package:FeelYoung_getx/ui/pages/message/controllers/chat_controller.dart';
import 'package:get/get.dart';



/// 创建时间：2022/11/16
/// 作者：w2gd
/// 描述：

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
