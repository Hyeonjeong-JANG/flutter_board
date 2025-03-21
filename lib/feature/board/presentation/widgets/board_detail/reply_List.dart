import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/utils/date_formatter.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReplyList extends HookConsumerWidget {
  const ReplyList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardDetailNotifier = ref.read(boardDetailProvider.notifier);
    final replyList = ref.watch(boardDetailProvider).replies;
    return Expanded(
      child: ListView.separated(
        itemCount: replyList?.length ?? 0,
        itemBuilder: (_, index) {
          final reply = replyList?[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: Color(int.parse('0xFF${reply?.iconColor}')),
                  borderRadius: BorderRadius.circular(
                    AppSizes.borderRadiusL,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  reply?.shortName ?? '',
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
                                    reply?.userName ?? '',
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
                                        style:
                                            TextStyle(color: AppColor.mainBlue),
                                      ),
                                      TextSpan(
                                          text: reply?.content ?? '',
                                          style: TextStyle(
                                              color: AppColor.black,
                                              overflow: TextOverflow.ellipsis,
                                              ),),
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
                  /////////////////////////////////////// 대댓글 ///////////////////////////////////////

                  Column(
                    children: reply?.childReplies?.map((childReply) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Color(int.parse(
                                        '0xFF${childReply.iconColor}')),
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.borderRadiusL,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    childReply.shortName ?? '',
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
                                                      childReply.userName ?? '',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            AppSizes.spacingS),
                                                    Text(
                                                      DateFormatter
                                                          .formatToKoreanDateTime(
                                                              childReply
                                                                      .createdAt ??
                                                                  ''),
                                                      style: TextStyle(
                                                        color: AppColor.grey,
                                                        fontSize: 8.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: RichText(
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '@최희철 ', // 댓글쓴사람이 멘션!
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .mainBlue),
                                                        ),
                                                        TextSpan(
                                                            text: childReply
                                                                    .content ??
                                                                '',
                                                            style: TextStyle(
                                                              color: AppColor
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
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
                                        Text('좋아요',
                                            style: TextStyle(fontSize: 12.0)),
                                        Icon(Icons.thumb_up, size: 15.0),
                                        SizedBox(width: 2.0),
                                        Text(
                                            childReply.likeCounts.toString() ??
                                                '',
                                            style: TextStyle(fontSize: 12.0)),
                                      ],
                                    ),
                                    // 대댓글
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (_, index) {
          return SizedBox(height: AppSizes.spacingL);
        },
      ),
    );
  }
}
