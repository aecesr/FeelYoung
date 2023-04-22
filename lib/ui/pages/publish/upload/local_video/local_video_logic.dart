import 'package:get/get.dart';

import '../../../../../core/channel/channel_util.dart';
import '../../../../../core/model/local_video_model.dart';
import '../../../video_play/feelYoung_video_player/feelyoung_video_player_logic.dart';
import '../../../video_play/feelYoung_video_player/feelYoung_video_player_state.dart';
import '../pre_edit_video/pre_edit_video_view.dart';
import 'local_video_state.dart';

class LocalVideoLogic extends GetxController {
  final LocalVideoState state = LocalVideoState();

  @override
  void onReady() {
    fetchLocalVideo();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///获取手机本地的视频
  fetchLocalVideo() {
    ChannelUtil.methodChannel.invokeMethod("getVideos").then((value) {

      for (int i = 0; i < value.length; i++) {

        state.localVideoList.add(HYLocalVideoModel(
          videoLocation: value[i]["videoLocation"],
          videoName: value[i]["videoName"],

          ///这里的duration返回值单位为毫秒，
          duration: value[i]["duration"] ?? "0",
        ));
        print(value[i]["videoLocation"]+"---------------------");
        print(value.length);
        print(value[i]["videoName"]);
      }
      update();
    });
  }

  ///跳转至预编辑界面
  void go2PreEditScreen(int index) {
    Get.put(FeelYoungVideoPlayerLogic());
    FeelYoungVideoPlayerLogic feelYoungVideoPlayerLogic = Get.find<FeelYoungVideoPlayerLogic>();
    FeelYoungVideoPlayerState feelYoungVideoPlayerState = Get.find<FeelYoungVideoPlayerLogic>().state;

    feelYoungVideoPlayerLogic.initVideoPlayerVideoData();
    feelYoungVideoPlayerState.haveFinishView = true;
    feelYoungVideoPlayerState.haveFullScreenFunction = true;
    feelYoungVideoPlayerState.haveDanMuFunction = false;
    feelYoungVideoPlayerState.showDanMu = false;
    feelYoungVideoPlayerState.showTopBarHome = false;
    feelYoungVideoPlayerState.showTopBarMore = false;

    feelYoungVideoPlayerState.videoOriginalUrl = state.localVideoList[index].videoLocation;
    feelYoungVideoPlayerLogic.initVideoControllerAndDanMuController();

    Get.toNamed(PreEditVideoScreen.routeName);
  }
}
