import 'dart:io';

import 'package:FeelYoung_getx/core/service/request/live_room_play_request.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../video_play/feelYoung_video_player/feelyoung_video_player_logic.dart';
import '../video_play/feelYoung_video_player/feelYoung_video_player_state.dart';
import 'live_play_state.dart';

class LivePlayLogic extends GetxController {
  final LivePlayState state = LivePlayState();

  @override
  void onReady() {
    // fetchLiveRoomVideoStream(21721813);
    initWebView();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///初始化WebView
  void initWebView() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        WebView.platform = AndroidWebView();
      }
    }
  }

  ///获取直播间的直播视频流flv
  void fetchLiveRoomVideoStream(int roomId) {
    state.roomId = roomId;
    HYLiveRoomPlayRequest.getLiveRoomStreamData(state.roomId).then((value) {
      // state.playUrl = value.durl[0].url;
      state.playUrl = state.url;
      print(state.playUrl);
      ///视频播放控件
      Get.put(FeelYoungVideoPlayerLogic());
      FeelYoungVideoPlayerState feelYoungVideoPlayerState =
          Get.find<FeelYoungVideoPlayerLogic>().state;
      feelYoungVideoPlayerState.haveFinishView = false;
      feelYoungVideoPlayerState.haveFullScreenFunction = false;
      feelYoungVideoPlayerState.haveDanMuFunction = false;
      feelYoungVideoPlayerState.haveProcessSlider = false;
      feelYoungVideoPlayerState.haveProcessTimePosition = false;
      feelYoungVideoPlayerState.videoOriginalUrl = state.playUrl;
      FeelYoungVideoPlayerLogic feelYoungliVideoPlayerLogic =
          Get.find<FeelYoungVideoPlayerLogic>();
      feelYoungliVideoPlayerLogic.initVideoPlayerVideoData();
      feelYoungliVideoPlayerLogic.initVideoPlayerDanMuData();
      feelYoungliVideoPlayerLogic.initVideoControllerAndDanMuController();

      state.isLoading = false;
      update();
    });
  }
}
