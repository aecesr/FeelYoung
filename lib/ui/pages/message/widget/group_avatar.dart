// ignore_for_file: prefer_const_constructors
import 'package:FeelYoung_getx/ui/pages/message/controllers/message_controller.dart';
import 'package:FeelYoung_getx/ui/pages/message/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


/// 描述：群头像

class GroupAvatar extends GetView<MessageController> {
  const GroupAvatar({Key? key, required this.list}) : super(key: key);
  final List? list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list!.length >= 9 ? 9 : 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: list!.length < 9 ? 2 : 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index >= list!.length) {
          return Container();
        } else {
          ContactModel? contact = controller.contactsMap[list?[index]];
          return Image.network('${contact?.photo}');
        }
      },
    );
  }
}
