import 'package:get/get.dart';

import '../controllers/personal_email_bind_controller.dart';

class PersonalEmailBindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalEmailBindController>(
      () => PersonalEmailBindController(),
    );
  }
}
