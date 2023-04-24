import 'package:flutter/material.dart';


/// @Description 自定义主题
final ThemeData defaultTheme = buildDefaultTheme();

class SchoolConfig {
  static const IconThemeData iconTheme = IconThemeData(color: Colors.white);

  /// 主题颜色
  static const int _primaryColorValue = 0xFF4CB2B6;
  static const Color primaryColor = Color(_primaryColorValue);
  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFF4FAFB),
      100: Color(0xFFC5DDDA),
      200: Color(_primaryColorValue),
      300: Color(0xFF6C896F),
      500: Color(0xFFA65341),
      600: Color(0xFFDB922A),
      700: Color(0xFF41A6B4),
      800: Color(0xFFC9BCAD),
      900: Color(0xFFECE7E1),
      400: Color(0xFF392A27)
    },
  );
}

ThemeData buildDefaultTheme() {
  return ThemeData(
    // useMaterial3: true,
    primarySwatch: SchoolConfig.primarySwatchColor,

    // primaryColor: Config.primaryColor,
    // buttonTheme: ButtonThemeData(
    //   //按钮主题，最窄150，按钮文本主题复用ButtonTextTheme，圆角边框10，水平垂直留空
    //   minWidth: 150,
    //   textTheme: ButtonTextTheme.primary,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    //   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   //文本输入框主题，圆角，内边距
    //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    //   contentPadding: const EdgeInsets.all(16.0),
    // ),
  );
}
