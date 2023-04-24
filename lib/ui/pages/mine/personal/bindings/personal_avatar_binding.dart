import 'package:get/get.dart';

import '../controllers/personal_avatar_controller.dart';


class PersonalAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalAvatarController>(
          () => PersonalAvatarController(),
    );
  }
}