import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:board/core/utils/date_formatter.dart';
import 'package:board/feature/presentation/viewmodel/board_detail/board_detail_provider.dart';
import 'package:board/feature/presentation/viewmodel/board_detail/board_detail_viewmodel.dart';
import 'package:board/feature/presentation/widgets/board_home/content_bottom_button.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailPage extends HookConsumerWidget {
  const BoardDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = ref.watch(boardDetailProvider);
    return DefaultLayout(
      title: '게시글 상세',
      child: Container(
        padding: EdgeInsets.all(AppSizes.spacingL),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusXL),
        ),
        child: Column(
          children: [
            Row(
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
                                    // color: Color(
                                    //     int.parse('0xFF${content.iconColor}')),
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.borderRadiusL,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    // content.shortName,
                                    '지영',
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
                                        // Text(content.userName),
                                        Text(
                                          '공지영',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // if (content.isManager)
                                        Image.asset(
                                          'assets/icons/crown.png',
                                          width: 16.0,
                                          height: 16.0,
                                        ),
                                        // if (content.pinInfo.isPinned)
                                        Image.asset(
                                          'assets/icons/pin.png',
                                          width: 16.0,
                                          height: 16.0,
                                        ),
                                        // if (content.pinInfo.isAlertPinned)
                                        Image.asset(
                                          'assets/icons/speaker.png',
                                          width: 16.0,
                                          height: 16.0,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      DateFormatter.formatToKoreanDateTime(
                                        // content.createdAt,
                                        '2024-01-05T08:00:00',
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
                            style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
            SizedBox(height: AppSizes.spacingL),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    // color: Color(
                    //     int.parse('0xFF${content.iconColor}')),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadiusL,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    // content.shortName,
                    '희철',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Column(
                  children: [
                    // 댓글
                    Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '최희철',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  DateFormatter.formatToKoreanDateTime(
                                      '2024-01-05T08:00:00'),
                                  style: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text: '',
                                    style: TextStyle(color: AppColor.mainBlue),
                                  ),
                                  TextSpan(
                                      text: '네, 확인했습니다.\n저번주 지영님인거 같아요!',
                                      style: TextStyle(color: AppColor.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text('좋아요'),
                            Icon(Icons.thumb_up),
                            Text('2'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('답글달기'),
                          ],
                        ),
                      ],
                    ),
                    // 대댓글
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            // color: Color(
                            //     int.parse('0xFF${content.iconColor}')),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadiusL,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '철수',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Column(
                          children: [
                            // 댓글
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('김철수'),
                                        Text('2024-01-05T08:00:00'),
                                      ],
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '@최희철 ',
                                            style: TextStyle(
                                                color: AppColor.mainBlue),
                                          ),
                                          TextSpan(
                                              text: '오키 고마워요!',
                                              style: TextStyle(
                                                  color: AppColor.black)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text('좋아요'),
                                    Icon(Icons.thumb_up),
                                    Text('2'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('답글달기'),
                                  ],
                                ),
                              ],
                            ),
                            // 대댓글
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
