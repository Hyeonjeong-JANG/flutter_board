import 'package:flutter/material.dart';

class AppColor {
  // 메인
  static const Color mainBlue = Color(0xFF3971FF);
  static const Color subBlue = Color(0xFF9DCEFF);

  static const Color containerBlue = Color(0xFFC8DDFF);

  // 비용 (Expenses)
  static const Color expensesColor = Color(0xff877af5);
  static const Color subExpensesColor = Color(0xffd7d1f8);

  // 노무 (Labor)
  static const Color laborColor = Color(0xFFFFEB54);
  static const Color subLaborColor = Color(0xFFF8EF97);

  // 매출 (Revenue)
  static const Color revenueColor = Color(0xffe884c6);
  static const Color subRevenueColor = Color(0xfff8e3f0);

  // 기타
  static const Color black = Color(0xff000000);
  static const Color fontDarkGrey = Color(0xFF473B35);
  static const Color grey = Color(0xff969696);
  static const Color white = Color(0xffffffff);
  static const Color lightLineGrey = Color(0xffe5e5e5);
  static const Color buttonGrey = Color(0xfff2f4f6);
  static const Color inputGrey = Color(0xfff7f8f8);
  static const Color bgGrey = Color(0xfff7f7f7);
// 0xfff2f4f6 0xfff7f7f7
  // 그래프

  static const Color rightBar = Color(0xFF99BDFF);
  static const Color leftBar = Color(0xFFFFB2B2);


  // 그라데이션
  static const List<Color> primaryGradient = [subBlue, mainBlue];
  static const List<Color> secondaryGradient = [subExpensesColor, expensesColor];
  static const List<Color> revenueGradient = [subRevenueColor, revenueColor];
}

class AppShadow {
  // 그림자기본
  static const BoxShadow defaultShadow = BoxShadow(
    color: Color(0x121d1617),
    blurRadius: 20.0,
    offset: Offset(0, 10),
  );



}
