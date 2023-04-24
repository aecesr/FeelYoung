import 'dart:convert';
import 'dart:io';

import 'package:FeelYoung_getx/core/service/request/login_request.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/home_logic.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/model/reult_model.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/model/user_info.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/permission/feelyoung_permission.dart';
import '../../../core/proto/dm.pb.dart';
import '../mine/mine_logic.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    ///手机端获取权限
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        getUserInfo();
        FeelYoungPermission.requestAllPermissions();
      }
    }
    super.onInit();
  }

  ///更新当前下标
  void updateCurrentIndex(index) {
    state.currentIndex = index;
    update();
  }

  void getUserInfo(){
      HYLoginRequest.getAccountMineData().then((value) {
        print(value);
        final mineState = Get.find<MineLogic>();
        final homeState = Get.find<HomeLogic>();
        homeState.initHomeUserInfo(value.user!.avatar!);
        mineState.fetchMineUserInfo(value.user!);
        // UserInfoModel userInfo = result.user!;
        // print(userInfo.createTime);
      });
  }
}
