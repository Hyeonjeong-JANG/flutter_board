import 'package:flutter/widgets.dart';

class AppSizes {

  // 여백
  static const double gapS = 8.0;
  static const double gapM = 12.0;
  static const double gapL = 24.0;
  static const double gapXL = 48.0;
  static const double gapXXL = 70.0;

  // 간격
  static const double spacingS = 4.0;
  static const double spacingM = 10.0;
  static const double spacingL = 18.0;
  static const double spacingXL = 30.0;

  // 모서리
  static const double borderRadiusS = 2.0;
  static const double borderRadiusM = 8.0;
  static const double borderRadiusL = 12.0;
  static const double borderRadiusXL = 20.0;
  static const double borderRadiusXXL = 99.0;

  static BorderRadius topCornersRoundedSmall = const BorderRadius.only(
    topLeft: Radius.circular(borderRadiusXL),
    topRight: Radius.circular(borderRadiusXL),
  );

  // 아이콘
  static const double iconSizeS = 25.0;
  static const double iconSizeM = 30.0;
  static const double iconSizeL = 32.0;
  static const double iconSizeXL = 50.0;

  // 비율에 따른 크기
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double proportionalWidth(BuildContext context, double percentage) =>
      MediaQuery.of(context).size.width * percentage;

  static double proportionalHeight(BuildContext context, double percentage) =>
      MediaQuery.of(context).size.height * percentage;
}
