import 'package:flustars/flustars.dart';
import 'package:get/get.dart';

import '../../../message/controllers/message_controller.dart';
import '../../../message/model/user_model.dart';
import '../bindings/personal_avatar_binding.dart';
import '../bindings/personal_email_binding.dart';
import '../bindings/personal_gender_binding.dart';
import '../bindings/personal_name_binding.dart';
import '../bindings/personal_phone_bind_binding.dart';
import '../bindings/personal_phone_binding.dart';
import '../bindings/personal_status_binding.dart';
import '../model/personal_info_model.dart';
import '../views/personal_avatar_view.dart';
import '../views/personal_email_view.dart';
import '../views/personal_gender_view.dart';
import '../views/personal_name_view.dart';
import '../views/personal_phone_bind_view.dart';
import '../views/personal_phone_view.dart';
import '../views/personal_status_view.dart';

class PersonalInfoController extends GetxController {
  /// 个人信息列表数据
  var personalInfoList = <PersonalInfo>[].obs;
  UserModel? user = SpUtil.getObj(
      "user", (v) => UserModel.fromJson(v as Map<String, dynamic>));

  /// 添加个人列表信息数据
  void addInfo() {
    // 性别列表
    Map<String, String> genderList = {"M": "男", "F": "女"};
    // 用户性别
    String gender = '';
    genderList.forEach((key, value) {
      // 遍历 拿到对应的性别
      if (key == user?.gender) {
        gender = value;
      }
    });

    personalInfoList.add(
      PersonalInfo('头像',
          content: '${user?.photo}',
          onPress: () => Get.to(() => PersonalAvatarView(),
              binding: PersonalAvatarBinding())),
    );
    personalInfoList.add(
      PersonalInfo('姓名',
          content: '${user?.name}',
          onPress: () =>
              Get.to(() => PersonalNameView(), binding: PersonalNameBinding())),
    );
    personalInfoList.add(
      PersonalInfo('性别',
          content: '${gender}',
          onPress: () => Get.to(() => PersonalGenderView(),
              binding: PersonalGenderBinding())),
    );
    personalInfoList.add(
      PersonalInfo('对外信息显示', content: '${user?.name}'),
    );
    personalInfoList.add(
      PersonalInfo('所在企业', content: 'AI南工'),
    );
    // personalInfoList.add(PersonalInfo('个人状态', '😃开心', () => Get.to(() => PersonalInfoView())),);
    personalInfoList.add(
      PersonalInfo('个人状态',
          content: '暂无',
          onPress: () => Get.to(() => PersonalStatusView(),
              binding: PersonalStatusBinding())),
    );
    // ?? -> user?.company为空，返回操作符 右边的值
    // personalInfoList.add(PersonalInfo('所在企业', '${user?.company??'暂无'}', () => LogUtil.v('跳转页面')),);
    personalInfoList.add(
      PersonalInfo('手机', content: '${user?.phone}', onPress: () {
        // 如果手机号没有绑定
        if (user?.phone != null) {
          Get.to(() => PersonalPhoneView(), binding: PersonalPhoneBinding());
        } else {
          Get.to(() => PersonalPhoneBindView(),
              binding: PersonalPhoneBindBinding());
        }
      }),
    );
    personalInfoList.add(
      PersonalInfo('邮箱',
          content: '${user?.email}',
          onPress: () => Get.to(() => PersonalEmailView(),
              binding: PersonalEmailBinding())),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // 初始化列表数据
    addInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 改变头像
  void changeAvatar(String avatarUrl) {
    personalInfoList[0].content = avatarUrl;
    personalInfoList.refresh();
  }

  // 改变用户名
  void changeName(String name) {
    personalInfoList[1].content = name;
    personalInfoList.refresh();
  }

  // 改变性别
  void changeGender(String gender) {
    personalInfoList[2].content = gender;
    personalInfoList.refresh();
  }

  // 改变手机号
  void changePhone(String phone) {
    // 更新缓存的用户信息
    user?.phone = phone;
    SpUtil.putObject("user", user!);
    personalInfoList[4].content = phone;
    personalInfoList.refresh();
    // 通讯录当前用户信息更新
    var msgCto = Get.find<MessageController>();
    // 通讯里里我的信息
    var curUser = msgCto.contactsMap['${user?.id}'];
    curUser?.phone = phone;
    SpUtil.putObject('contactList', msgCto.contactsMap);
  }

  // 改变邮箱
  void changeEmail(String email) {
    // 更新缓存的用户信息
    user?.email = email;
    SpUtil.putObject("user", user!);
    personalInfoList[5].content = email;
    personalInfoList.refresh();
  }
}
