import 'package:FeelYoung_getx/ui/pages/message/controllers/search_mess_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMessView extends GetView<SearchMessController> {
  const SearchMessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SearchView is working${controller.count}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
