import 'package:get/get.dart';

import '../controllers/setting_about_controller.dart';

class SettingAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingAboutController>(
      () => SettingAboutController(),
    );
  }
}
