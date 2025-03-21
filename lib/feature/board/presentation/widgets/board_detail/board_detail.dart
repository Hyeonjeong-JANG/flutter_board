import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/utils/date_formatter.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_provider.dart';
import 'package:board/feature/board/presentation/widgets/board_home/content_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetail extends HookConsumerWidget {
  const BoardDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardDetailNotifier = ref.read(boardDetailProvider.notifier);
    final content = ref.watch(boardDetailProvider);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 글쓴이, 등급, 핀 고정 상태, 날짜
                    Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(
                                int.parse('0xFF${content.iconColor}')),
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadiusL,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            content.shortName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingM),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  content.userName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (content.isManager)
                                  Image.asset(
                                    'assets/icons/crown.png',
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                if (content.pinInfo.isPinned)
                                  Image.asset(
                                    'assets/icons/pin.png',
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                if (content.pinInfo.isAlertPinned)
                                  Image.asset(
                                    'assets/icons/speaker.png',
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                              ],
                            ),
                            Text(
                              DateFormatter.formatToKoreanDateTime(
                                content.createdAt,
                              ),
                              style: TextStyle(
                                color: AppColor.grey,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ...버튼 위치 수정 마저 하기
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: AppColor.grey,
                            size: AppSizes.iconSizeS,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.spacingM),
              Divider(
                color: AppColor.lightLineGrey,
                height: 1.0,
              ),
              SizedBox(height: AppSizes.spacingM),
              // 글 내용
              Row(
                children: [
                  Text(
                    content.content,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spacingL),
              // 좋아요, 댓글 수
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('좋아요 ${content.likeCounts}개'),
                  Text('댓글 ${content.replyCounts}개'),
                ],
              ),
              SizedBox(height: AppSizes.spacingM),

              Divider(
                color: AppColor.lightLineGrey,
                height: 1.0,
              ),
              SizedBox(height: AppSizes.spacingM),
              // 좋아요, 댓글달기 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentBottomButton(
                    title: '좋아요',
                    iconPath: 'assets/icons/like.png',
                  ),
                  ContentBottomButton(
                    title: '댓글달기',
                    iconPath: 'assets/icons/comment.png',
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spacingM),
              Divider(
                color: AppColor.lightLineGrey,
                height: 1.0,
              ),

              SizedBox(height: AppSizes.spacingM),
            ],
          ),
        ),
      ],
    );
  }
}
