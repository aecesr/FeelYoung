import 'package:get/get.dart';

import '../controllers/personal_email_controller.dart';


class PersonalEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalEmailController>(
          () => PersonalEmailController(),
    );
  }
}