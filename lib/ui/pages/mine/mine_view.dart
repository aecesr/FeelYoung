import 'package:FeelYoung_getx/core/shared_preferences/feelYoung_shared_preference.dart';
import 'package:FeelYoung_getx/core/shared_preferences/shared_preference_util.dart';
import 'package:FeelYoung_getx/ui/pages/feelYoung_test/feelYoung_test_view.dart';
import 'package:FeelYoung_getx/ui/pages/functions/push_message/push_message_view.dart';
import 'package:FeelYoung_getx/ui/pages/functions/qq_share/qq_share_view.dart';
import 'package:FeelYoung_getx/ui/pages/functions/statistics_chart/statistics_chart_view.dart';
import 'package:FeelYoung_getx/ui/pages/functions/wx_share/wx_share_view.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/login/login_view.dart';
import 'package:FeelYoung_getx/ui/pages/main/home/search/search_view.dart';
import 'package:FeelYoung_getx/ui/pages/main/main_logic.dart';
import 'package:FeelYoung_getx/ui/pages/mine/scan_login/scan_login_view.dart';
import 'package:FeelYoung_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../../core/model/account_mine.dart';
import '../../shared/app_theme.dart';
import '../../shared/image_asset.dart';
import '../../widgets/advertising_row.dart';
import '../../widgets/icon_button_row.dart';
import '../../widgets/user_level.dart';
import '../functions/blue_tooth_connection/blue_tooth_connection_view.dart';
import 'mine_logic.dart';

class MineScreen extends StatelessWidget {
  static const String routeName = "/mine";
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineLogic>(builder: (logic) {
      return SafeArea(
          child:
              Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: .5,
                    actions: buildMineActions(),
                    bottom: PreferredSize(
                      preferredSize: Size(double.infinity, 200.h),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 25)
                                .r,
                        child: Column(
                          children: [
                            buildMineUserInfoRow(),
                            20.verticalSpace,
                            buildMineUserDetailsRow(),
                            20.verticalSpace,
                            buildMineAppBarFooter(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    controller: ScrollController(),
                    child: buildMineContentBody(),
                  ),
                  floatingActionButton: SpeedDial(
                    icon: Icons.star_rate_sharp,
                    backgroundColor: HYAppTheme.norMainThemeColors,
                    children: [
                      SpeedDialChild(
                        onTap: () {
                          Get.toNamed(StatisticsChartView.routeName);
                        },
                        backgroundColor: HYAppTheme.norWhite01Color,
                        label: '统计',
                        child: ImageIcon(
                          AssetImage(ImageAssets.chartsCustomPNG),
                          size: 10.h,
                        ),
                      ),
                      SpeedDialChild(
                        backgroundColor: HYAppTheme.norWhite01Color,
                        onTap: () {
                          Get.toNamed(PushMessageScreen.routeName);
                        },
                        label: '推送',
                        child: Icon(
                          Icons.announcement_sharp,
                          size: 10.h,
                        ),
                      ),
                      SpeedDialChild(
                        backgroundColor: HYAppTheme.norWhite01Color,
                        onTap: () {
                          Get.toNamed(QqShareView.routeName);
                        },
                        label: 'QQ分享',
                        child: Icon(
                          Icons.share,
                          size: 10.h,
                        ),
                      ),
                      SpeedDialChild(
                        backgroundColor: HYAppTheme.norWhite01Color,
                        onTap: () {
                          // Get.toNamed(BlueToothConnectionView.routeName);
                        },
                        label: '蓝牙',
                        child: Icon(
                          Icons.bluetooth,
                          size: 10.h,
                        ),
                      ),
                      SpeedDialChild(
                        backgroundColor: HYAppTheme.norWhite01Color,
                        onTap: () {
                          Get.toNamed(WxShareView.routeName);
                        },
                        label: '微信分享',
                        child: Icon(
                          Icons.wechat,
                          size: 10.h,
                        ),
                      ),
                      SpeedDialChild(
                        backgroundColor: HYAppTheme.norWhite01Color,
                        onTap: () {
                          ///切换语言并保存语言至本地
                          String? locale = SharedPreferenceUtil.getString(
                              FeelYoungSharedPreference.locale);
                          if (locale == 'zh') {
                            Get.updateLocale(const Locale('en', 'US'));
                            SharedPreferenceUtil.setString(
                                FeelYoungSharedPreference.locale, 'en');
                          } else {
                            Get.updateLocale(const Locale('zh', 'CN'));
                            SharedPreferenceUtil.setString(
                                FeelYoungSharedPreference.locale, 'zh');
                          }
                        },
                        label: '切换语言',
                        child: Icon(
                          Icons.abc,
                          size: 10.h,
                        ),
                      ),
                      SpeedDialChild(
                        backgroundColor: HYAppTheme.norWhite01Color,
                        onTap: () {
                          Get.toNamed(FeelYoungTestScreen.routeName);
                        },
                        label: '小窗口',
                        child: Icon(
                          Icons.desktop_windows_sharp,
                          size: 10.h,
                        ),
                      ),
                    ],
                  ),
                )
             );
    });
  }

  ///按钮列表
  Widget buildMineContentBody() {
    int index = 0;
    List<Widget> widgets = [];

    ///未登录时
    return Container(
      padding: const EdgeInsets.all(15).r,
      color: Colors.white,
      child: Column(
        children: [
          buildMineTitleAndButton("个人中心", const Center()),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15).r,
            child: HYIconButtonRow(
              items: state.mineItem,
              size: 20.sp,
            ),
          ),
          buildMineTitleAndButton("推荐", const Center()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15).r,
                  child: buildMineMoreServiceItem(
                      "http://i0.hdslb.com/bfs/archive/aa3a13c287e4d54a62b75917dd9970a3cde472e1.png",
                      "课程推荐"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15).r,
                  child: buildMineMoreServiceItem(
                      "http://i0.hdslb.com/bfs/archive/393dd15a4f0a149e016cd81b55bd8bd6fe40882c.png",
                      "流量卡办理"),
                ),
                buildSettingButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///设置按钮
  Widget buildSettingButton() {
    return GestureDetector(
      onTap: () {
        ///跳转至设置界面
        // Get.toNamed(HYSettingScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageAssets.settingPNG,
                  width: 16.sp,
                  height: 16.sp,
                  color: HYAppTheme.norMainThemeColors,
                ),
                10.horizontalSpace,
                Text(
                  "设置",
                  style: TextStyle(
                      fontSize: 16.sp, color: HYAppTheme.norTextColors),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12.sp,
              color: HYAppTheme.norGrayColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMineMoreServiceItem(String icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultFadeImage(
              imageUrl: icon,
              width: 16.sp,
              height: 16.sp,
            ),
            10.horizontalSpace,
            Text(
              text,
              style:
                  TextStyle(fontSize: 16.sp, color: HYAppTheme.norTextColors),
            ),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12.sp,
          color: HYAppTheme.norGrayColor,
        ),
      ],
    );
  }

  scan() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      Get.toNamed(ScanLoginScreen.routeName);
    }
  }

  List<Widget> buildMineActions() {
    return [
      // IconButton(
      //     onPressed: () => print("bilibili_connect"),
      //     icon: Image.asset(
      //       ImageAssets.bilibiliConnectPNG,
      //       width: 18.sp,
      //       height: 18.sp,
      //       color: HYAppTheme.norGrayColor,
      //     )),
      // IconButton(
      //     onPressed: () {
      //       scan();
      //     },
      //     icon: Image.asset(
      //       ImageAssets.scanPNG,
      //       width: 18.sp,
      //       height: 18.sp,
      //       color: HYAppTheme.norGrayColor,
      //     )),
      IconButton(
          onPressed: () {
            scan();
          },
          icon: Image.asset(
            ImageAssets.scanPNG,
            width: 18.sp,
            height: 18.sp,
            color: HYAppTheme.norGrayColor,
          )),
      IconButton(
          onPressed: () => print("clothes"),
          icon: Image.asset(
            ImageAssets.clothesPNG,
            width: 18.sp,
            height: 18.sp,
            color: HYAppTheme.norGrayColor,
          )),
      // color:HYAppTheme.norGrayColor ,
      // icon: DefaultFadeImage(
      //   imageUrl: state.accountMineData.data.mallHome.icon,
      //   width: 18.sp,
      //   height: 18.sp,
      //
      // )),
      IconButton(
          onPressed: () => logic.toggleTheme(),
          icon: Image.asset(
            ImageAssets.darkModelPNG,
            width: 18.sp,
            height: 18.sp,
            color: HYAppTheme.norGrayColor,
          )),
    ];
  }

  ///用户的粉丝数、动态数、关注数
  Widget buildMineUserDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildUserInfo(
            state.isLogin == false
                ? "—"
                : state.accountMineData.data.dataDynamic.toString(),
            SR.message),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              child: buildUserInfo(
                  state.isLogin == false
                      ? "—"
                      : state.accountMineData.data.following.toString(),
                  SR.follower),
            ),
            Container(
              height: 20.h,
              padding: const EdgeInsets.symmetric(horizontal: 60).r,
              decoration: BoxDecoration(
                  border: Border.symmetric(vertical: BorderSide(width: .2.w))),
            ),
          ],
        ),
        buildUserInfo(
            state.isLogin == false
                ? "—"
                : state.accountMineData.data.follower.toString(),
            SR.fan),
      ],
    );
  }

  Widget buildUserInfo(String num, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          num,
          style: TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
        ),
        Text(
          text.tr,
          style: TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
        ),
      ],
    );
  }

  Widget buildMineUserInfoRow() {
    return state.isLogin == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.r,
                width: 50.r,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(state.accountMineData.data.face),
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.accountMineData.data.name,
                              style: TextStyle(
                                  color: HYAppTheme.norTextColors,
                                  fontSize: 18.sp),
                            ),
                            5.horizontalSpace,
                            UserLevel(level: state.accountMineData.data.level)
                          ],
                        ),
                        5.verticalSpace,
                        Container(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: HYAppTheme.norMainThemeColors),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: Text(
                            SR.normalVip.tr,
                            style: TextStyle(
                                color: HYAppTheme.norMainThemeColors,
                                fontSize: 12.sp),
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "${SR.bCoin.tr}: ${state.accountMineData.data.bcoin}   ${SR.coin.tr}: ${state.accountMineData.data.coin}",
                          style: TextStyle(
                              color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          Text(
                            SR.space.tr,
                            style: TextStyle(
                                color: HYAppTheme.norGrayColor,
                                fontSize: 12.sp),
                          ),
                          5.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.sp,
                            color: HYAppTheme.norGrayColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Row(
            children: [
              10.horizontalSpace,
              Opacity(
                opacity: .8,
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: HYAppTheme.norWhite01Color,
                  child: Image.asset(ImageAssets.unLoginPNG),
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      SR.click2Login.tr.toUpperCase(),
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: HYAppTheme.norTextColors,
                          fontWeight: FontWeight.normal),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(LoginScreen.routeName);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: HYAppTheme.norGrayColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
  }

  ///成为会员
  Widget buildMineAppBarFooter() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
      decoration: BoxDecoration(
        color: HYAppTheme.norWhite03Color,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(4.r), bottom: Radius.circular(4.r)),
        border: Border.all(color: HYAppTheme.norPink05Colors, width: .5.w),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "加入我们，成为会员",
                style: TextStyle(
                    color: HYAppTheme.norPink06Colors, fontSize: 16.sp),
              ),
              Text(
                "了解更多权益",
                style: TextStyle(
                    color: HYAppTheme.norPink06Colors, fontSize: 12.sp),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 12.sp,
              color: HYAppTheme.norPink08Colors,
            ),
          )
        ],
      ),
    );
  }

  ///广告栏A
  // Widget buildMineAdvertisingA(SectionsV2 sectionsV2) {
  //   return AdvertisingRow(
  //     image: sectionsV2.items[0].commonOpItem!.titleIcon!,
  //     title: sectionsV2.items[0].commonOpItem!.title!,
  //     rightBtn: Icon(
  //       Icons.close,
  //       size: 20.sp,
  //       color: HYAppTheme.norGrayColor,
  //     ),
  //   );
  // }

  ///广告栏B
  Widget buildMineAdvertisingB() {
    return AdvertisingRow(
      image: state.accountMineData.data.liveTip!.icon,
      title: state.accountMineData.data.liveTip!.text,
      rightBtn: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            state.accountMineData.data.liveTip!.buttonText,
            style: TextStyle(
              color: HYAppTheme.norMainThemeColors,
              fontSize: 12.sp,
            ),
          ),
          state.accountMineData.data.liveTip!.buttonIcon.isEmpty
              ? Container()
              : DefaultFadeImage(
                  imageUrl: state.accountMineData.data.liveTip!.buttonIcon,
                  width: 12.sp,
                  height: 12.sp,
                )
        ],
      ),
    );
  }

  Widget buildMineTitleAndButton(String title, Widget button) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 5).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: HYAppTheme.norTextColors,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                fontFamily: 'feelYoung'),
          ),
          button
        ],
      ),
    );
  }
}
