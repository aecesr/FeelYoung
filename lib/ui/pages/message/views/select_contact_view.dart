import 'package:FeelYoung_getx/ui/pages/message/component/bg_position_image.dart';
import 'package:FeelYoung_getx/ui/pages/message/controllers/message_controller.dart';
import 'package:FeelYoung_getx/ui/pages/message/controllers/select_contact_controller.dart';
import 'package:FeelYoung_getx/ui/pages/message/model/contact_model.dart';
import 'package:FeelYoung_getx/ui/shared/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SelectContactView extends StatelessWidget {
  const SelectContactView({Key? key, this.type = 1}) : super(key: key);

  /// 1： 发起群聊；2： 邀请他人加入群聊
  final int type;

  @override
  Widget build(BuildContext context) {
    final msgCto = Get.find<MessageController>();
    final scCto = Get.find<SelectContactController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Obx(() {
          return Text('选择联系人 ${scCto.groupMembers.length}');
        }),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.close, size: 30),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined, size: 30),
            onPressed: () {
              EasyLoading.showToast('暂不支持搜索，开发中～');
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: msgCto.contactsMap.length,
          itemBuilder: (BuildContext context, int index) {
            return _contactTile(
              contactor: msgCto.contactsMap.values.elementAt(index),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        return Offstage(
          offstage: scCto.groupMembers.isEmpty,
          child: FloatingActionButton(
            backgroundColor: HYAppTheme.norPink03Colors,
            onPressed: () {
              if (type == 1) {
                // 发起群聊
                showDialog(context: context, builder: (_) => _customDialog());
              } else if (type == 2) {
                // 返回一组成员 id 集合给上一路由
                Get.back(result: scCto.groupMembers);
              }
            },
            child: Icon(Icons.group_add),
          ),
        );
      }),
    );
  }

  // 弹窗、输入群聊名称
  Widget _customDialog() {
    TextEditingController textTf = TextEditingController();
    return CupertinoAlertDialog(
      title: Text('输入群聊名称'),
      actions: [
        CupertinoDialogAction(child: Text('取消'), onPressed: () => Get.back()),
        CupertinoDialogAction(
          child: Text('创建'),
          onPressed: () {
            if (textTf.text.trim().isEmpty) {
              EasyLoading.showToast('群名称不能为空');
              return;
            }
            Get.find<SelectContactController>().createGroupConversation(textTf.text);
          },
        ),
      ],
      content: Column(
        children: [CupertinoTextField(controller: textTf)],
      ),
    );
  }
}

class _contactTile extends GetView<SelectContactController> {
  const _contactTile({Key? key, required this.contactor}) : super(key: key);
  final ContactModel contactor;

  @override
  Widget build(BuildContext context) {
    var isSelected = false.obs;
    return Container(
      height: 60.h,
      child: Obx(() {
        return ListTile(
          leading: Container(
            height: 55.r,
            width: 55.r,
            child: BGPositionImage.positionImage('${contactor.photo}'),
          ),
          title: Text('${contactor.name}'),
          trailing: Offstage(
            offstage: !isSelected.value,
            child: Icon(Icons.check),
          ),
          selectedColor: Colors.pink,
          selected: isSelected.value,
          selectedTileColor: HYAppTheme.norPink04Colors,
          onTap: () {
            controller.addOrRemove(isSelected.value, '${contactor.id}');
            isSelected.value = !isSelected.value;
            // 加入群聊数组或删除
          },
        );
      }),
    );
  }
}
