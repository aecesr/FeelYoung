import 'dart:async';

import 'package:FeelYoung_getx/ui/pages/video_play/feelYoung_video_player/feelYoung_video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

import 'live_play_logic.dart';

class LivePlayView extends StatefulWidget {
  static String routeName = "/live_play";

  @override
  State<LivePlayView> createState() => _LivePlayViewState();
}

class _LivePlayViewState extends State<LivePlayView> {
  final logic = Get.find<LivePlayLogic>();

  final state = Get.find<LivePlayLogic>().state;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LivePlayLogic>(
        builder: (logic) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  width: 1.sw,
                  height: 200.w,
                  child: state.isLoading
                      ? Container(
                          width: 40.w,
                          height: 40.w,
                          child: CircularProgressIndicator(),
                        )
                      : FeelYoungVideoPlayerComponent(),
                ),
                Expanded(
                  child: state.isLoading ? Container() : buildDanMuPanel(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildDanMuPanel() {
    return WebView(
      // backgroundColor: HYAppTheme.norTextColors,
      initialUrl:
          'file:///android_asset/flutter_assets/assets/html/live_dan_mu.html?roomid=21721813',
      // state.url,
      // 'file:///android_asset/flutter_assets/assets/html/live_dan_mu.html?roomid=${state.roomId}',
      zoomEnabled: false,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        print('WebView is loading (progress : $progress%)');
      },
    );
  }

}
