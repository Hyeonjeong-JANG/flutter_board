import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:flutter/material.dart';

// 알림 요약
class AlertContentsDropdownList extends StatelessWidget {
  const AlertContentsDropdownList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.spacingM),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusXL),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/speaker.png',
                width: AppSizes.iconSizeM,
                height: AppSizes.iconSizeM,
              ),
              SizedBox(width: AppSizes.spacingS),
              Text('오늘 주방에 파 10kg 주문했습니다.'),
            ],
          ),
          Image.asset(
            'assets/icons/arrow_down.png',
            width: AppSizes.iconSizeM,
            height: AppSizes.iconSizeM,
          ),
        ],
      ),
    );
  }
}
