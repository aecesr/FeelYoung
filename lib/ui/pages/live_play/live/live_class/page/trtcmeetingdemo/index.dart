import 'dart:io';

import 'package:FeelYoung_getx/ui/pages/live_play/live/live_class/page/trtcmeetingdemo/tool.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tencent_trtc_cloud/trtc_cloud_def.dart';


import '../../debug/GenerateTestUserSig.dart';
import '../../models/meeting.dart';

// Multiplayer video meeting page
class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  /// user id
  String userId = '';

  /// meeting id
  String liveId = '';

  /// whether turn on the camera
  bool enabledCamera = true;

  /// whether turn on the microphone
  bool enabledMicrophone = false;

  /// sound quality selection
  int quality = TRTCCloudDef.TRTC_AUDIO_QUALITY_SPEECH;

  final meetIdFocusNode = FocusNode();
  final userFocusNode = FocusNode();

  @override
  initState() {
    super.initState();
  }

  unFocus() {
    if (meetIdFocusNode.hasFocus) {
      meetIdFocusNode.unfocus();
    } else if (userFocusNode.hasFocus) {
      userFocusNode.unfocus();
    }
  }

  @override
  dispose() {
    super.dispose();
    unFocus();
  }

  enterMeeting() async {
    // if (GenerateTestUserSig.sdkAppId == 0) {
    //   MeetingTool.toast('Please fill in Sdkappid', context);
    //   return;
    // }
    // if (GenerateTestUserSig.secretKey == '') {
    //   MeetingTool.toast('Please fill in the key', context);
    //   return;
    // }
    // meetId = meetId.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    // if (meetId == '') {
    //   MeetingTool.toast('请输入会议号码', context);
    //   return;
    // } else if (meetId == '0') {
    //   MeetingTool.toast('请输入合法的直播ID', context);
    //   return;
    // } else if (meetId.toString().length > 10) {
    //   MeetingTool.toast('请输入一个有效的直播ID', context);
    //   return;
    // } else if (!new RegExp(r"[0-9]+$").hasMatch(meetId)) {
    //   MeetingTool.toast('只能是数字会议ID。请输入一个合法的会议ID', context);
    //   return;
    // }
    // userId = userId.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    // if (userId == '') {
    //   MeetingTool.toast('请输入用户ID', context);
    //   return;
    //   // }
    //   // else if (!new RegExp(r"[A-Za-z0-9_]+$").hasMatch(userId)) {
    //   //   MeetingTool.toast('用户ID只能是数字、字母和下划线。请输入正确的用户ID', context);
    //   //   return;
    // } else if (userId.length > 20) {
    //   MeetingTool.toast('用户ID太长了。请输入一个合法的用户ID', context);
    //   return;
    // }
    // unFocus();
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      if (!(await Permission.camera.request().isGranted) ||
          !(await Permission.microphone.request().isGranted)) {
        MeetingTool.toast('你需要获得音频和视频进入许可', context);
        return;
      }
    }
    var meetModel = context.read<MeetingModel>();
    meetModel.setUserSettig({
      "meetId": int.parse(liveId),
      "userId": userId,
      "enabledCamera": enabledCamera,
      "enabledMicrophone": enabledMicrophone,
      "quality": quality
    });
    Navigator.pushNamed(context, "/video");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (meetIdFocusNode.hasFocus) {
            meetIdFocusNode.unfocus();
          } else if (userFocusNode.hasFocus) {
            userFocusNode.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(14, 25, 44, 1),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(13, 44, 91, 1),
                  margin: const EdgeInsets.only(top: 60.0),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      TextField(
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          focusNode: meetIdFocusNode,
                          decoration: InputDecoration(
                            labelText: "直播间ID",
                            hintText: "请输入直播间ID",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) => liveId = value),
                      TextField(
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          focusNode: userFocusNode,
                          decoration: InputDecoration(
                            labelText: "用户名",
                            hintText: "请输入用户名",
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (value) => this.userId = value),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Column(
                //     children: [
                //       ListTile(
                //         contentPadding: EdgeInsets.all(0),
                //         title: Text("开启摄像头", style: TextStyle(color: Colors.white)),
                //         trailing: Switch(
                //           value: enabledCamera,
                //           onChanged: (value) => this.setState(() => enabledCamera = value),
                //         ),
                //       ),
                //       ListTile(
                //         contentPadding: EdgeInsets.all(0),
                //         title: Text("开启麦克风", style: TextStyle(color: Colors.white)),
                //         trailing: Switch(
                //           value: enabledMicrophone,
                //           onChanged: (value) => this.setState(() => enabledMicrophone = value),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15.0),
                              backgroundColor: Theme.of(context).primaryColor,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: Text("进入直播"),
                          onPressed: enterMeeting,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
