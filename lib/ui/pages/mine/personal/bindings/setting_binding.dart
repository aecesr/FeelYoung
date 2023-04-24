import 'package:get/get.dart';

import '../controllers/personal_controller.dart';
import '../controllers/setting_controller.dart';
import '../controllers/personal_ding_controller.dart';
import '../controllers/personal_email_bind_controller.dart';
import '../controllers/personal_gender_controller.dart';
import '../controllers/personal_info_controller.dart';
import '../controllers/personal_name_controller.dart';
import '../controllers/personal_phone_bind_controller.dart';
import '../controllers/personal_phone_controller.dart';
import '../controllers/personal_status_controller.dart';
import '../controllers/personal_wechat_controller.dart';
import '../controllers/setting_about_controller.dart';
import '../controllers/setting_account_controller.dart';
import '../controllers/setting_language_controller.dart';
import '../controllers/setting_message_controller.dart';
import '../controllers/setting_model_controller.dart';
class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
    Get.lazyPut<PersonalController>(
          () => PersonalController(),
    );
    Get.lazyPut<PersonalEmailBindController>(
          () => PersonalEmailBindController(),
    );
    Get.lazyPut<PersonalPhoneBindController>(
          () => PersonalPhoneBindController(),
    );
    Get.lazyPut<PersonalDingController>(
          () => PersonalDingController(),
    );
    Get.lazyPut<PersonalWechatController>(
          () => PersonalWechatController(),
    );
    Get.lazyPut<SettingAboutController>(
          () => SettingAboutController(),
    );
    Get.lazyPut<SettingAccountController>(
          () => SettingAccountController(),
    );
    Get.lazyPut<SettingMessageController>(
          () => SettingMessageController(),
    );
    Get.lazyPut<SettingModelController>(
          () => SettingModelController(),
    );
    Get.lazyPut<SettingLanguageController>(
          () => SettingLanguageController(),
    );
    Get.lazyPut<SettingController>(
          () => SettingController(),
    );
    Get.lazyPut<PersonalStatusController>(
          () => PersonalStatusController(),
    );
    Get.lazyPut<PersonalPhoneController>(
          () => PersonalPhoneController(),
    );
    Get.lazyPut<PersonalGenderController>(
          () => PersonalGenderController(),
    );
    Get.lazyPut<PersonalNameController>(
          () => PersonalNameController(),
    );
    Get.lazyPut<PersonalInfoController>(
          () => PersonalInfoController(),
    );
  }
}
