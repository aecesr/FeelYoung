import 'package:FeelYoung_getx/core/I18n/str_res_keys.dart';
import 'package:FeelYoung_getx/ui/shared/app_theme.dart';
import 'package:FeelYoung_getx/ui/shared/image_asset.dart';
import 'package:FeelYoung_getx/ui/widgets/feelyoung_classical_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'hot_logic.dart';

class HotScreen extends StatefulWidget {
  static const String routeName = "/home/hot";
  @override
  State<HotScreen> createState() => _HotScreenState();
}

class _HotScreenState extends State<HotScreen>
with AutomaticKeepAliveClientMixin{

  final logic = Get.find<HotLogic>();
  final state = Get.find<HotLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    ///未加载出数据时显示
    return GetBuilder<HotLogic>(builder: (logic) {
      if (state.feedIndexItemList.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageAssets.holderLoadingPNG,
                width: 150.r,
                height: 150.r,
              ),
              10.verticalSpace,
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        HYAppTheme.norMainThemeColors),
                  ),
                  onPressed: () {
                    ///有网络时拉取数据
                    logic.clearFeedIndexData();
                  },
                  child: Text(
                    SR.refresh.tr,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ))
            ],
          ),
        );
      } else {
        return EasyRefresh(
          // controller: state.easyRefreshController,
          // scrollController: state.easyRefreshScrollController,
          header: FeelYoungClassicalHeader(
            enableHapticFeedback: false,
            float: true,
          ),
          footer: ClassicalFooter(
            showInfo: false,
          ),
          onRefresh: () async {
            logic.refreshHotItemData();
          },
          onLoad: () async {
            logic.loadHotItemData();
          },
          child: Padding(
              padding:
              const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 0).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: state.homeHotWidgets,
              )),
        );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
