import 'package:get/get.dart';

import 'feelYoung_test_logic.dart';

class BilibiliTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeelYoungTestLogic());
  }
}
