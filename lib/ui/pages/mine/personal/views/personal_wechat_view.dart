import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/base_style.dart';
import '../../../message/model/user_model.dart';


class PersonalWechatView extends GetView {
  const PersonalWechatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? user = SpUtil.getObj(
        "user", (v) => UserModel.fromJson(v as Map<String, dynamic>));
    return Scaffold(
      appBar: AppBar(
        title: const Text('微信'),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '${user?.photo}',
                      width: 100.w,
                      height: 100.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      // '当前钉钉：${user?.phone}',
                      '当前微信：zk12345678',
                    ),
                  ),
                  Text(
                    '可使用当前绑定的微信登录',
                    textAlign: TextAlign.center,
                    style: BaseStyle.graySmallStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
