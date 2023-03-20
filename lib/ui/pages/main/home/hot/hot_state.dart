import 'package:FeelYoung_getx/core/model/feed_index_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

class HotState {
  ///Initialize variables
  late List<Widget> homeHotWidgets;
  late ScrollController easyRefreshScrollController;
  late SwiperController swiperController;
  late ScrollController gridViewController;
  late EasyRefreshController easyRefreshController;
  late List<FeedIndexItem> feedIndexItemList;

  HotState() {
    homeHotWidgets = [];
    easyRefreshController = EasyRefreshController();
    swiperController = SwiperController();
    easyRefreshScrollController = ScrollController();
    gridViewController = ScrollController();
    feedIndexItemList = [];
  }
}
