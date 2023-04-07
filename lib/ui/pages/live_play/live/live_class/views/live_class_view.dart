import 'package:FeelYoung_getx/ui/pages/live_play/live/live_class/live_class_demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/live_class_controller.dart';

class LiveClassView extends GetView<LiveClassController> {
  const LiveClassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('直播'),
      ),
      body: TXAppDemo(),
    );
  }
}
