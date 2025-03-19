import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/widgets/dropdown_arrows.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 알림 요약
class AlertContentsDropdownList extends HookConsumerWidget {
  const AlertContentsDropdownList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDropdownOpen = ref.watch(isDropdownOpenProvider);
    final isDropdownOpenNotifier = ref.read(isDropdownOpenProvider.notifier);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isDropdownOpenNotifier.state = !isDropdownOpen;
          },
          child: Container(
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
                isDropdownOpen
                    ? DropdownArrows(imgPath: 'assets/icons/arrow_up.png')
                    : DropdownArrows(imgPath: 'assets/icons/arrow_down.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
