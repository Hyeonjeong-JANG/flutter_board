import 'package:flutter/material.dart';
import 'package:board/core/constants/color.dart';

class AppLines {
  // 얇은 구분선
  static Divider thinDivider = Divider(
    color: AppColor.grey,
    thickness: 1.0,
    height: 8.0, // 기본 여백 추가
  );

  // 굵은 구분선
  static Divider thickDivider = Divider(
    color: AppColor.lightLineGrey,
    thickness: 2.0,
    height: 12.0,
  );

  // 점선 구분선
  static Widget dottedDivider({double dotWidth = 5.0, double dotHeight = 1.0, Color color = AppColor.grey}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            (constraints.constrainWidth() / (dotWidth + 5)).floor(),
                (index) => SizedBox(
              width: dotWidth,
              height: dotHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
        );
      },
    );
  }

  // 커스텀 구분선
  static Divider customDivider({Color color = AppColor.grey, double thickness = 1.0}) {
    return Divider(
      color: color,
      thickness: thickness,
      height: thickness * 4, // 약간의 여백 포함
    );
  }

  // 여백이 있는 연한 회색 구분선
  static Divider greyDivider({double padding = 24.0}) {
    return Divider(
      color: AppColor.lightLineGrey,
      thickness: 1.0,
      indent: padding,
      endIndent: padding,
      height: 16.0,
    );
  }

  // 여백이 있는 진한 회색 구분선
  static Divider darkGreyDivider({double padding = 24.0}) {
    return Divider(
      color: AppColor.grey,
      thickness: 1.0,
      indent: padding,
      endIndent: padding,
      height: 16.0,
    );
  }

  // 버튼 직전까지 오는 구분선
  static Widget paddedDivider({double padding = 24.0}) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: const Divider(
        color: AppColor.lightLineGrey,
        thickness: 1.0,
        height: 0.0,
      ),
    );
  }
}

