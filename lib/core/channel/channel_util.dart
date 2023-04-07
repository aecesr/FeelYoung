import 'package:flutter/services.dart';

import 'feelYoung_channel.dart';

class ChannelUtil {
  static MethodChannel methodChannel = MethodChannel(FeelYoungChannel.uploadChannel);
  static MethodChannel stayAliveChannel = MethodChannel(FeelYoungChannel.stayAliveChannel);
  static MethodChannel startServiceChannel = MethodChannel(FeelYoungChannel.startServiceChannel);
}
