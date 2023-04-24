import 'package:get/get.dart';

import '../controllers/setting_account_controller.dart';

class SettingAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingAccountController>(
      () => SettingAccountController(),
    );
  }
}
