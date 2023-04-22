import '../../../core/model/account_mine.dart';
import '../../../core/shared_preferences/feelYoung_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';

class MineState {
  late bool isLogin;
  late bool finishLoading;

  ///用户的基本数据
  late HYAccountMineModel accountMineData;
  late List<Item> mineItem;

  MineState() {
    mineItem = [
      Item(
        title: "创作",
        uri: "chu",
        icon:
            "https://i0.hdslb.com/bfs/archive/d3aad2d07538d2d43805f1fa14a412d7a45cc861.png",
      ),
      Item(
        title: "稿件",
        uri: "chu",
        icon:
        "https://i0.hdslb.com/bfs/archive/97acb2d8dec09b296a38f7f7093d651947d13b91.png",
      ),Item(
        title: "历史记录",
        uri: "chu",
        icon:
        "http://i0.hdslb.com/bfs/archive/8385323c6acde52e9cd52514ae13c8b9481c1a16.png",
      ),Item(
        title: "我的收藏",
        uri: "chu",
        icon:
        "http://i0.hdslb.com/bfs/archive/d79b19d983067a1b91614e830a7100c05204a821.png",
      ),
    ];

    ///获取登录状态
    isLogin = SharedPreferenceUtil.getBool(FeelYoungSharedPreference.isLogin) ??
        false;

    ///加载是否完成
    finishLoading = false;
  }
}
