import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';

class FeelYoungTestState {
  ///浮动窗口
  late FloatingManager floatingManager;
  late Floating floatingOne;

  ///视频控件
  late VideoPlayerController controller;

  FeelYoungTestState() {
    floatingManager = FloatingManager();
    controller = VideoPlayerController.network(
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      ..initialize().then((value) {});
  }
}
