import 'dart:async';

import 'package:FeelYoung_getx/ui/pages/main/main_view.dart';
import 'package:FeelYoung_getx/ui/shared/app_theme.dart';
import 'package:FeelYoung_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'start_logic.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = "/start";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  //设置启动图生效时间
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Get.off(MainScreen());

  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<StartLogic>();
    final state = Get.find<StartLogic>().state;

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: ExactAssetImage(ImageAssets.launchPNG),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
          appBar: AppBar(
            backgroundColor: Colors.transparent, //把appbar的背景色改成透明
            elevation: 0, //appbar的阴影
          ),
          body: Center(
            child: Column(
              children: const [
                Text("Feel Young",
                    style: TextStyle(
                        fontFamily: 'start',
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: HYAppTheme.norPink05Colors)),
                Text(
                  "感受年轻",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'feelYoung',
                      fontSize: 50,
                      color: HYAppTheme.norPink08Colors),
                )
              ],
            ),
          ),
        ));
  }
}
