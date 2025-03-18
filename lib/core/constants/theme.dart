import 'package:flutter/material.dart';
import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/style.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColor.mainBlue,
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColor.white,
        titleTextStyle: AppTextStyle.pageHeadline,
        iconTheme: IconThemeData(color: AppColor.fontDarkGrey),
      ),
      textTheme: const TextTheme(
        headlineLarge: AppTextStyle.headlineMoney,
        headlineMedium: AppTextStyle.sectionHeadline,
        headlineSmall: AppTextStyle.pageHeadline,
        titleLarge: AppTextStyle.bodyTextBig,
        bodyLarge: AppTextStyle.bodyTextBig,
        bodyMedium: AppTextStyle.bodyTextSemi,
        bodySmall: AppTextStyle.bodyTextPrimary,
        labelLarge: AppTextStyle.button,
        labelSmall: AppTextStyle.caption,
      ),
      dividerColor: AppColor.lightLineGrey,
      iconTheme: const IconThemeData(
        color: AppColor.fontDarkGrey,
        size: 24.0,
      ),
    );
  }
}
