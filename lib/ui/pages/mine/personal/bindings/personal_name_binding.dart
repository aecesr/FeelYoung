import 'package:get/get.dart';

import '../controllers/personal_name_controller.dart';



class PersonalNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalNameController>(
          () => PersonalNameController(),
    );
  }
}