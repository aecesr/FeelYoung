import 'package:get/get.dart';

import '../controllers/personal_gender_controller.dart';


class PersonalGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalGenderController>(
          () => PersonalGenderController(),
    );
  }
}