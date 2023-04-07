import 'package:FeelYoung_getx/ui/pages/message/controllers/message_controller.dart';
import 'package:FeelYoung_getx/ui/pages/message/controllers/search_mess_controller.dart';
import 'package:FeelYoung_getx/ui/pages/message/controllers/select_contact_controller.dart';
import 'package:get/get.dart';



class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectContactController>(
      () => SelectContactController(),
    );
    Get.lazyPut<SearchMessController>(
      () => SearchMessController(),
    );
    Get.lazyPut<MessageController>(
      () => MessageController(),
    );
  }
}
