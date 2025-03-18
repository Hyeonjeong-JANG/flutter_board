import 'package:flutter/material.dart';

import 'color.dart';

class AppTextStyle {
  static const String lineFont = 'Line';
  static const String nanumNeo = 'NanumNeo';
  static const String nanumRound = 'NanumRound';
  static const String pretendard = 'Pretendard';
  static const String hanbit = 'Hanbit';

  // 제목
  static const TextStyle sectionHeadline = TextStyle(
    fontFamily: nanumNeo,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineMoney = TextStyle(
    fontFamily: nanumNeo,
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle pageHeadline = TextStyle(
    fontFamily: lineFont,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle pointHeadline = TextStyle(
    fontFamily: pretendard,
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle bodyTextPrimary = TextStyle(
    fontFamily: pretendard,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyTextSemi = TextStyle(
    fontFamily: pretendard,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyTextBig = TextStyle(
    fontFamily: pretendard,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  // 버튼, 탭
  static const TextStyle button = TextStyle(
    fontFamily: nanumNeo,
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
  );

  // 캡션
  static const TextStyle caption = TextStyle(
    fontFamily: pretendard,
    fontSize: 10.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle errorMessage = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );

  static const TextStyle guideText = TextStyle(
    fontFamily: hanbit,
    fontSize: 23,
    fontWeight: FontWeight.w500,
    color: AppColor.white
  );
}
