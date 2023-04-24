import 'package:get/get.dart';

import '../controllers/personal_wechat_controller.dart';

class PersonalWechatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalWechatController>(
      () => PersonalWechatController(),
    );
  }
}
