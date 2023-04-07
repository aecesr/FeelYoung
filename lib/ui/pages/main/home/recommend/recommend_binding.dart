import 'package:FeelYoung_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:get/get.dart';

import '../../../video_play/feelYoung_video_player/feelyoung_video_player_logic.dart';
import 'recommend_logic.dart';

class RecommendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendLogic());
  }
}
