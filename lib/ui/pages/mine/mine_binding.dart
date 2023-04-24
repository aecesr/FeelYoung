import 'package:FeelYoung_getx/ui/pages/mine/personal/controllers/setting_controller.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';
// import 'personal/controllers/personal_ding_controller.dart';
// import 'personal/controllers/personal_email_bind_controller.dart';
// import 'personal/controllers/personal_gender_controller.dart';
// import 'personal/controllers/personal_info_controller.dart';
// import 'personal/controllers/personal_name_controller.dart';
// import 'personal/controllers/personal_phone_bind_controller.dart';
// import 'personal/controllers/personal_phone_controller.dart';
// import 'personal/controllers/personal_status_controller.dart';
// import 'personal/controllers/personal_wechat_controller.dart';
// import 'personal/controllers/setting_about_controller.dart';
// import 'personal/controllers/setting_account_controller.dart';
// import 'personal/controllers/setting_controller.dart';
// import 'personal/controllers/setting_language_controller.dart';
// import 'personal/controllers/setting_message_controller.dart';
// import 'personal/controllers/setting_model_controller.dart';
class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineLogic());
    Get.lazyPut<SettingController>(
          () => SettingController(),
    );
  }

}
