import 'package:FeelYoung_getx/ui/shared/feel_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BaseStyle {
  /// 字号
  static TextStyle fs14 = TextStyle(fontSize: 14.sp);
  static TextStyle fs14bold =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold);
  static TextStyle fs16 = TextStyle(fontSize: 16.sp);
  static TextStyle fs16bold =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);
  static TextStyle fs18 = TextStyle(fontSize: 18.sp);
  static TextStyle fs18bold =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
  static TextStyle fs26 =
      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold);

  /// 样式
  static TextStyle wdStyle = TextStyle(color: Colors.pink, fontSize: 30.sp);

  /// 顶部导航字体样式(浅色
  static TextStyle topStyle = TextStyle(color: Colors.white, fontSize: 20.sp);

  /// 灰色中号字体
  static TextStyle grayContentStyle =
      TextStyle(color: Colors.grey.shade700, fontSize: 16.sp);

  /// 浅灰色大号加粗字体
  static TextStyle grayBoldBigContentStyle = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.sp);

  /// 浅灰色中号加粗字体
  static TextStyle grayCContentStyle =
      TextStyle(color: Colors.grey, fontSize: 16.sp);

  /// 灰色小号字体
  static TextStyle graySmallStyle =
      TextStyle(color: Colors.grey.shade500, fontSize: 14.sp);

  /// 黑色中号字体
  static TextStyle contentStyle =
      TextStyle(color: Colors.black, fontSize: 16.sp);

  /// 黑色小号字体
  static TextStyle smallStyle = TextStyle(color: Colors.black, fontSize: 14.sp);

  /// 黑色小号加粗字体
  static TextStyle smallBBoldStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  /// 深灰小号字体加粗
  static TextStyle smallBoldStyle = TextStyle(
    color: Colors.grey.shade700,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  /// 智慧入校主题色中号字体
  static TextStyle schoolContentStyle =
      TextStyle(color: SchoolConfig.primaryColor, fontSize: 16.sp);

  static TextStyle schoolS4ContentStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: SchoolConfig.primarySwatchColor.shade400,
  );

  /// 智慧入校主题色中号加粗字体
  static TextStyle schoolBoldContentStyle = TextStyle(
    color: SchoolConfig.primaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  /// 智慧入校主题色大号加粗字体
  static TextStyle schoolBoldBigContentStyle = TextStyle(
    color: SchoolConfig.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  /// 智慧入校主题色小号加粗字体
  static TextStyle schoolBoldSmallStyle = TextStyle(
    color: SchoolConfig.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  /// 智慧入校主题色小号字体
  static TextStyle schoolSmallStyle =
      TextStyle(color: SchoolConfig.primaryColor, fontSize: 14.sp);

  /// 通讯录标题
  static TextStyle messageMiddleStyle =
      TextStyle(color: Colors.black, fontSize: 22.sp);

  /// 个人信息蓝色标题
  static TextStyle messageBlueStyle =
       TextStyle(color: Colors.blue,fontSize: 24.sp);

  /// 通讯录灰色正常大小字体
  static TextStyle messageGreyNormalStyle =
  TextStyle(color: Colors.grey.shade600,fontSize: 22.sp);
}
