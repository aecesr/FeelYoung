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
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, size: 30),
            onPressed: () => controller.updateConversationList(),
          ),
        ],
      ),
      body: MessagesPage(),
    );
  }
}
