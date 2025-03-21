import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:board/core/utils/date_formatter.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_provider.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_viewmodel.dart';
import 'package:board/feature/board/presentation/viewmodels/board_home/board_home_viewmodel.dart';
import 'package:board/feature/board/presentation/widgets/board_home/content_bottom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailPage extends HookConsumerWidget {
  // final BoardHomeViewModel content;
  final String boardId;
  const BoardDetailPage({
    super.key,
    required this.boardId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardDetailNotifier = ref.read(boardDetailProvider.notifier);
    final content = ref.watch(boardDetailProvider);

    useEffect(() {
      boardDetailNotifier.loadBoardDetail(boardId);
      return null;
    }, []);

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
            // 게시글 -> 좋아요, 댓글달기 버튼 분리해야할지도
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
            // 댓글 + 대댓글 세트
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Color(
                        int.parse('0xFF${content.replies?.first.iconColor}')),
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadiusL,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    content.replies?.first.shortName ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: AppSizes.spacingM),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 아이콘 오른쪽 영역
                    Column(
                      children: [
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: AppColor.bgGrey,
                            borderRadius: BorderRadius.circular(
                              AppSizes.borderRadiusL,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 이름, 날짜
                                Row(
                                  children: [
                                    Text(
                                      content.replies?.first.userName ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(width: AppSizes.spacingS),
                                    Text(
                                      DateFormatter.formatToKoreanDateTime(
                                          '2024-01-05T08:00:00'),
                                      style: TextStyle(
                                        color: AppColor.grey,
                                        fontSize: 8.0,
                                      ),
                                    ),
                                  ],
                                ),
                                // 댓글 내용
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                      children: [
                                        // @로 호출을 하면 여기에 뜬다.
                                        TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              color: AppColor.mainBlue),
                                        ),
                                        TextSpan(
                                            text: content
                                                    .replies?.first.content ??
                                                '',
                                            style: TextStyle(
                                                color: AppColor.black)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spacingS),
                    // 좋아요, 답글달기
                    Row(
                      children: [
                        Row(
                          children: [
                            // 로그인한 사람이 좋아요 했으면 글씨랑 아이콘 파란색
                            Text(
                              '좋아요',
                              style: TextStyle(
                                color: AppColor.mainBlue,
                                fontSize: 12.0,
                              ),
                            ),
                            Icon(Icons.thumb_up,
                                color: AppColor.mainBlue, size: 15.0),
                            SizedBox(width: 2.0),
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSizes.spacingM),
                        Row(
                          children: [
                            Text('답글달기',
                                style: TextStyle(
                                  fontSize: 12.0,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spacingM),
                    // 대댓글
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32.0,
                          height: 32.0,
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
                        SizedBox(width: AppSizes.spacingM),
                        // 대댓글 -> 대댓글이 없으면 안 보임
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: AppColor.bgGrey,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.borderRadiusL,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '김철수',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(width: AppSizes.spacingS),
                                            Text(
                                              DateFormatter
                                                  .formatToKoreanDateTime(
                                                      '2024-01-05T08:00:00'),
                                              style: TextStyle(
                                                color: AppColor.grey,
                                                fontSize: 8.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            textAlign: TextAlign.left,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: AppSizes.spacingS),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text('좋아요',
                                        style: TextStyle(fontSize: 12.0)),
                                    Icon(Icons.thumb_up, size: 15.0),
                                    Text('2', style: TextStyle(fontSize: 12.0)),
                                  ],
                                ),
                                SizedBox(width: AppSizes.spacingM),
                                Row(
                                  children: [
                                    Text('답글달기',
                                        style: TextStyle(fontSize: 12.0)),
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
