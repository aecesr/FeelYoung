import 'dart:ui';

import 'package:FeelYoung_getx/ui/shared/feel_theme_data.dart';
import 'package:FeelYoung_getx/ui/shared/theme_data.dart';
import 'package:get/get.dart';


class SettingModelController extends GetxController {
  // 系统的模式
  final br = window.platformBrightness;
  var system = true.obs;
  var mode = false.obs;
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

  void changeSystem(bool flag) {
    system.value = flag;
    // Get.changeTheme(
    //     br == 'Brightness.dark' ? ThemeData.light() : ThemeData.dark());
  }

  void changeMode(bool flag) {
    mode.value = flag;
    if (mode.value == false) {
      changeSystem(true);
    }
    // LogUtil.v(window.platformBrightness);
    Get.changeTheme(Get.isDarkMode ? appDarkTheme : appDarkTheme);
  }
}
