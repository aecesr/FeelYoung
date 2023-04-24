import 'package:FeelYoung_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/image_asset.dart';
import '../controllers/setting_about_controller.dart';

class SettingAboutView extends GetView<SettingAboutController> {
  const SettingAboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于飞漾'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 应用图标
          Container(
            padding: EdgeInsets.only(top: 80.h),
            child: Image.asset(
              ImageAssets.uperCustomPNG,
              width: 250.w,
              height: 150.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Text('FeelYoung'),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.h),
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Text('检查更新'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
                Divider(
                  height: 0,
                ),
                InkWell(
                  onTap:(){
                    Dialog.fullscreen(
                      backgroundColor: HYAppTheme.norBlue01Colors,
                      child: Text("年轻人的平台"),
                    );
                  },
                  child: ListTile(
                    leading: Text('关于我们'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                ),
                ListTile(
                  leading: Text('用户协议'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
                Divider(
                  height: 0,
                ),
                ListTile(
                  leading: Text('隐私政策'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
                Divider(
                  height: 0,
                ),
                ListTile(
                  leading: Text('个人信息收集清单'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
