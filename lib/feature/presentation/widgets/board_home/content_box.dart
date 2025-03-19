import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:board/feature/presentation/widgets/board_home/content_bottom_button.dart';
import 'package:flutter/material.dart';

// 게시글
class ContentBox extends StatelessWidget {
  final BoardHomeViewModel content;
  final int maxLines;
  const ContentBox({
    super.key,
    required this.content,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
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
                              color: Color(int.parse('0xFF${content.iconColor}')),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              content.shortName,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(content.fullName),
                                  if (content.isManager)
                                    Image.asset(
                                      'assets/icons/crown.png',
                                      width: 16.0,
                                      height: 16.0,
                                    ),
                                  if (content.isPinned)
                                    Image.asset(
                                      'assets/icons/pin.png',
                                      width: 16.0,
                                      height: 16.0,
                                    ),
                                ],
                              ),
                              Text(
                                content.date,
                                style: TextStyle(
                                  color: Color(0xFF969696),
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
                              color: Color(0xFF969696),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                // 글 내용
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content.content,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: maxLines,
                            overflow: TextOverflow
                                .ellipsis, // ellipsis 색깔 Color(0xFF969696)로 변경하기
                          ),
                          SizedBox(height: 5.0),
                          // 더보기 옆에 붙이는 것은 나중에
                          GestureDetector(
                            onTap: () {
                              // 게시글로 이동
                            },
                            child: Text(
                              '더보기',
                              style: TextStyle(
                                color: Color(0xFF969696),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                // 좋아요, 댓글 수
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('좋아요 ${content.likeCount}개'),
                    Text('댓글 ${content.commentCount}개'),
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Color(0xFFE5E5E5),
                  height: 1.0,
                ),
                SizedBox(height: 10.0),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

