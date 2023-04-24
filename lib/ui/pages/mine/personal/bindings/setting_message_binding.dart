import 'package:get/get.dart';

import '../controllers/setting_message_controller.dart';

class SettingMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingMessageController>(
      () => SettingMessageController(),
    );
  }
}
