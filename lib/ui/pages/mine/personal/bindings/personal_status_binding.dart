import 'package:get/get.dart';

import '../controllers/personal_status_controller.dart';

class PersonalStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalStatusController>(
      () => PersonalStatusController(),
    );
  }
}
