import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/widgets/dropdown_arrows.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


// 알림 요약
class AlertContentsDropdownList extends HookConsumerWidget {
  const AlertContentsDropdownList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 알림 드롭다운 상태
    final isDropdownOpen = useState(false);
    

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isDropdownOpen.value = !isDropdownOpen.value;
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
                isDropdownOpen.value
                    ? DropdownArrows(imgPath: 'assets/icons/arrow_up.png')
                    : DropdownArrows(imgPath: 'assets/icons/arrow_down.png'),
              ],
            ),
          ),
        ),
        if (isDropdownOpen.value)
          Container(
            padding: EdgeInsets.all(AppSizes.spacingM),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusL),
            ),
            child: Consumer(
              builder: (context, ref, child) {
                final alertPosts =
                    ref.watch(boardHomeProvider.notifier).alertBoardContents;
                return Column(
                  children: alertPosts
                      .map((post) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(post.content,
                                style: TextStyle(fontSize: 14)),
                          ))
                      .toList(),
                );
              },
            ),
          ),
      ],
    );
  }
}
