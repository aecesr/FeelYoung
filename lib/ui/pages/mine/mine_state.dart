import 'package:FeelYoung_getx/ui/pages/main/home/model/user_info.dart';
import 'package:get/get.dart';

import '../../../core/model/account_mine.dart';
import '../../../core/permission/feelyoung_permission.dart';
import '../../../core/shared_preferences/feelYoung_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';
import '../publish/publish_view.dart';

class MineState {
  late bool isLogin;
  late bool finishLoading;

  ///用户的基本数据
  late UserInfoModel? accountMineData;
  late List<Item> mineItem;

  MineState() {
    accountMineData = UserInfoModel();
    mineItem = [
      Item(
          title: "创作",
          uri: "chu",
          icon:
              "https://i0.hdslb.com/bfs/archive/d3aad2d07538d2d43805f1fa14a412d7a45cc861.png",
          ontab: () {
            print("---------------------------");
            FeelYoungPermission.requestUploadPermissions();
            Get.toNamed(PublishScreen.routeName);
          }),
      Item(
          title: "稿件",
          uri: "chu",
          icon:
              "https://i0.hdslb.com/bfs/archive/97acb2d8dec09b296a38f7f7093d651947d13b91.png",
          ontab: () {}),
      Item(
          title: "历史记录",
          uri: "chu",
          icon:
              "http://i0.hdslb.com/bfs/archive/8385323c6acde52e9cd52514ae13c8b9481c1a16.png",
          ontab: () {}),
      Item(
          title: "我的收藏",
          uri: "chu",
          icon:
              "http://i0.hdslb.com/bfs/archive/d79b19d983067a1b91614e830a7100c05204a821.png",
          ontab: () {}),
    ];

    ///获取登录状态
    isLogin = SharedPreferenceUtil.getBool(FeelYoungSharedPreference.isLogin) ??
        false;

    ///加载是否完成
    finishLoading = false;
  }
}
