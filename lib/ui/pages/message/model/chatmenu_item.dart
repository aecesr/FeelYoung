import 'package:flutter/material.dart';

/// 聊天底部菜单子类
class ChatMenuItem {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;
  ChatMenuItem({required this.title, required this.imageUrl, required this.onTap});
}
