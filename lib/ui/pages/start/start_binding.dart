import 'package:get/get.dart';

import 'start_logic.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartLogic());
  }
}
