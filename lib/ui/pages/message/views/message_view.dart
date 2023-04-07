import 'package:FeelYoung_getx/ui/pages/message/bindings/message_binding.dart';
import 'package:FeelYoung_getx/ui/pages/message/controllers/message_controller.dart';
import 'package:FeelYoung_getx/ui/pages/message/views/message_page.dart';
import 'package:FeelYoung_getx/ui/pages/message/views/scan_view.dart';
import 'package:FeelYoung_getx/ui/pages/message/views/select_contact_view.dart';
import 'package:FeelYoung_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:wit_niit/app/modules/index/controllers/index_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var indexC = Get.find<IndexController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('消息'),
        centerTitle: true,
        // leading: Builder(builder: (context) {
        //   return IconButton(icon: Icon(Icons.menu), onPressed: () => indexC.open());
        // }),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined, size: 30),
            onPressed: () => Get.toNamed('/message/search'),
          ),
          SizedBox(width: 10),
          _popupMenu(context),
          SizedBox(width: 15),
        ],
      ),
      body: MessagesPage(),
    );
  }

  /// + 号 菜单
  Widget _popupMenu(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 50),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(20),
        ),
      ),
      onSelected: (v) {
        if (v == '发起群聊') {
          Get.to(() => SelectContactView(), binding: MessageBinding());
        } else if (v == '添加好友') {
          controller.updateConversationList(); // 更新会话
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: '发起群聊',
            child: Wrap(
              spacing: 10,
              children: [
                Icon(Icons.message, color: HYAppTheme.norPink04Colors),
                Text('发起群聊', style: TextStyle(color: HYAppTheme.norPink04Colors, fontSize: 20.sp)),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: '添加好友',
            child: Wrap(
              spacing: 10,
              children: [
                Icon(Icons.wechat, color: HYAppTheme.norPink04Colors),
                Text('更新会话', style: TextStyle(color: HYAppTheme.norPink04Colors, fontSize: 20.sp)),
              ],
            ),
          ),
        ];
      },
      child: Icon(Icons.add_circle_outline, size: 28),
    );
  }

}
