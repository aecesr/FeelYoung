import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @Description 自定义主题
final ThemeData defaultTheme = buildDefaultTheme();

class Config {
  ///主色
  static const mainColor = Color(0xFF7693d5);

  /// 副色
  static const viceColor = Color(0xFFa9a2cd);

  /// 主题颜色
  static const int _primaryColorValue = 0xFF7693d5;
  static const Color primaryColor = Color(_primaryColorValue);
  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFBED6C1),
      100: Color(0xFFA9C2AC),
      200: Color(_primaryColorValue),
      300: Color(0xFF6C896F),
      400: Color(0xFF2C646E),
      500: Color(0xFF1A4B57),
      600: Color(0xFF0B3946),
      700: Color(0xFF022D3B),
    },
  );
}

ThemeData buildDefaultTheme() {
  return ThemeData(
    // useMaterial3: true,
    primarySwatch: Config.primarySwatchColor,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(elevation: 0),
    textTheme: TextTheme(
      headline1: TextStyle(color: Color(0xff838181), fontSize: 15.sp),
      headline2: TextStyle(color: Color(0xff000000), fontSize: 15.sp),
    ),
    colorScheme: ColorScheme.light().copyWith(
      primary: Config.primarySwatchColor,
      background: Color(0xfff2f2f2),
      onBackground: Colors.white,
      onError: Colors.pink,
      secondary: Colors.black87,
    ),
  );
}

ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.red,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Color(0xff282727),
  appBarTheme: AppBarTheme(elevation: 0),
  textTheme: TextTheme(
    headline1: TextStyle(color: Color(0xfff5f2f2), fontSize: 15.sp),
    headline2: TextStyle(color: Color(0xfff5f2f2), fontSize: 15.sp),
  ),
  colorScheme: ColorScheme.dark().copyWith(
    secondary: Colors.white,
    background: Colors.black87,
    onBackground: Color(0xff1e1d1d),
    // onError: Colors.,
  ),
);
