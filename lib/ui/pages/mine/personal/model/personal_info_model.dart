import 'package:flutter/material.dart';

/// FileName personal_info_model
///
/// @Description 个人信息页面操作模型

class PersonalInfo {
  final String label;
  String? content;
  VoidCallback? onPress;

  PersonalInfo(this.label, {this.content, this.onPress});
}
