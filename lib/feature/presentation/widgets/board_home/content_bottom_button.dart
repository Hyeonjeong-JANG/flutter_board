import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:flutter/material.dart';

// 게시물 하단 버튼
class ContentBottomButton extends StatelessWidget {
  final String title;
  final String iconPath;
  const ContentBottomButton({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: AppSizes.iconSizeM,
            height: AppSizes.iconSizeM,
          ),
          SizedBox(width: AppSizes.spacingS),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
