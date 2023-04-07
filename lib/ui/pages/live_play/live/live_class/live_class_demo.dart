import 'package:FeelYoung_getx/ui/pages/live_play/live/live_class/page/trtcmeetingdemo/index.dart';
import 'package:FeelYoung_getx/ui/pages/live_play/live/live_class/page/trtcmeetingdemo/meeting.dart';
import 'package:FeelYoung_getx/ui/pages/live_play/live/live_class/page/trtcmeetingdemo/member_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'models/meeting.dart';

class TXAppDemo extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TXAppDemo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MeetingModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => IndexPage(),
          "/index": (context) => IndexPage(),
          "/video": (context) => MeetingPage(),
          "/memberList": (context) => MemberListPage(),
        },
      ),
    );
  }
}
