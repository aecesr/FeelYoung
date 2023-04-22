// import 'package:FeelYoung_getx/ui/pages/main/home/message/message_view.dart';
import 'package:FeelYoung_getx/ui/pages/message/views/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';

import '../../../core/jPush_util/dynamic_circle_view.dart';
import '../mall/mall_view.dart';
import '../mine/mine_view.dart';
import '../publish/publish_view.dart';
import 'home/home_view.dart';

class MainState {
  ///当前下标
  late int currentIndex;
  ///主页界面子页面
  late List<Widget> mainIndexStackPages;

  late bool showAdd;
  MainState() {
    showAdd = true;
    currentIndex = 0;
    mainIndexStackPages = [
      HomeScreen(),
      // DynamicCircleScreen(),
      MessageView(),
      MineScreen(),
    ];
  }
}
// PublishScreen(),
// MallScreen(),