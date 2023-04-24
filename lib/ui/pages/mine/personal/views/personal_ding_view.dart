import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/base_style.dart';
import '../../../../shared/bg_gradinent.dart';
import '../../../message/model/user_model.dart';


class PersonalDingView extends GetView {
  const PersonalDingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? user = SpUtil.getObj(
        "user", (v) => UserModel.fromJson(v as Map<String, dynamic>));
    return Scaffold(
      appBar: AppBar(
        title: const Text('钉钉'),
        centerTitle: true,
      ),
      //通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/setting/dingtalk.png',
                    width: 150.w,
                    height: 150.w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      // '当前钉钉：${user?.phone}',
                      '当前钉钉：12345678',
                    ),
                  ),
                  Text(
                    '可使用当前绑定的钉钉登录',
                    textAlign: TextAlign.center,
                    style: BaseStyle.graySmallStyle,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 166.h,
              child: InkWell(
                onTap: () => LogUtil.v('更换微信'),
                child: BGGradient(
                  alignment: Alignment.center,
                  width: Get.width * 0.8,
                  height: Get.width / 8,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Text(
                    '更换钉钉',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
