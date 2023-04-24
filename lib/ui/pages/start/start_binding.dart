import 'package:FeelYoung_getx/ui/pages/dynamic_circle/dynamic_circle_logic.dart';
import 'package:FeelYoung_getx/ui/pages/functions/animation_compoent/animation_compoent_logic.dart';
import 'package:FeelYoung_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_connection_logic.dart';
import 'package:FeelYoung_getx/ui/pages/functions/qq_share/qq_share_logic.dart';
import 'package:FeelYoung_getx/ui/pages/live_play/live_play_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/comic/comic_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/home_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/hot/hot_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/live/live_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/login/login_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/search/search_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/main_logic.dart';
import 'package:FeelYoung_getx/ui/pages/mall/mall_logic.dart';
import 'package:FeelYoung_getx/ui/pages/mine/mine_logic.dart';
import 'package:FeelYoung_getx/ui/pages/publish/publish_logic.dart';
import 'package:FeelYoung_getx/ui/pages/publish/upload/upload_logic.dart';
import 'package:FeelYoung_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:get/get.dart';

import '../main/home/recommend/recommend_logic.dart';

import '../message/controllers/message_controller.dart';
import '../message/controllers/search_mess_controller.dart';
import '../message/controllers/select_contact_controller.dart';
import '../mine/personal/controllers/personal_controller.dart';
import '../mine/personal/controllers/personal_ding_controller.dart';
import '../mine/personal/controllers/personal_email_bind_controller.dart';
import '../mine/personal/controllers/personal_gender_controller.dart';
import '../mine/personal/controllers/personal_info_controller.dart';
import '../mine/personal/controllers/personal_name_controller.dart';
import '../mine/personal/controllers/personal_phone_bind_controller.dart';
import '../mine/personal/controllers/personal_phone_controller.dart';
import '../mine/personal/controllers/personal_status_controller.dart';
import '../mine/personal/controllers/personal_wechat_controller.dart';
import '../mine/personal/controllers/setting_about_controller.dart';
import '../mine/personal/controllers/setting_account_controller.dart';
import '../mine/personal/controllers/setting_controller.dart';
import '../mine/personal/controllers/setting_language_controller.dart';
import '../mine/personal/controllers/setting_message_controller.dart';
import '../mine/personal/controllers/setting_model_controller.dart';
import 'start_logic.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartLogic());
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => PublishLogic());
    Get.lazyPut(() => MallLogic());
    Get.lazyPut(() => DynamicCircleLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => LoginLogic());
    Get.lazyPut(() => MineLogic());
    Get.lazyPut(() => ComicLogic());
    Get.lazyPut(() => RecommendLogic());
    Get.lazyPut(() => HotLogic());
    Get.lazyPut(() => LiveLogic());
    Get.lazyPut(() => SearchLogic());
    Get.lazyPut(() => UploadLogic());
    Get.lazyPut(() => VideoPlayLogic());
    Get.lazyPut(() => QqShareLogic());
    // Get.lazyPut(() => BlueToothConnectionLogic());
    Get.lazyPut(() => AnimationCompoentLogic());
    Get.lazyPut(() => LivePlayLogic());

    Get.lazyPut<SelectContactController>(
          () => SelectContactController(),
    );
    Get.lazyPut<SearchMessController>(
          () => SearchMessController(),
    );
    Get.lazyPut<MessageController>(
          () => MessageController(),
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
