import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class LivePlayState {
  ///是否在加载
  late bool isLoading;

  ///房间号码
  late int roomId;
  late String playUrl;

  late String url;

  LivePlayState() {
    isLoading = true;
    // url = 'https://cn-jsyz-ct-03-51.bilivideo.com/live-bvc/937894/live_47298021_1601001_1500/index.m3u8?expires=1680860425&len=0&oi=3027115228&pt=web&qn=0&trid=100738d92ca4d7d2486498d94deea7896d56&sigparams=cdn,expires,len,oi,pt,qn,trid&cdn=cn-gotcha01&sign=53a1815b912c669716f1b82f18842b68&sk=4d691d462e0501d8adb5b96e943071d2&flvsk=feae2fff580ad02f9f2fb4f00dfac3c0&p2p_type=1&sl=1&free_type=0&mid=297693429&sid=cn-jsyz-ct-03-51&chash=1&bmt=1&sche=ban&bvchls=1&score=6&pp=rtmp&source=onetier&trace=1099&site=44660aa7ef985c3718ed5865729b6ec2&order=1';
    url="http://www.patrickstarm.top:7001/live/rfBd56ti2SMtYvSgD5xAV0YU99zampta7Z7S575KLkIZ9PYk.flv";
  }
}
