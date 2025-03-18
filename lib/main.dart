import 'package:flutter/material.dart';

void main() {
  runApp(const BoardHome());
}

class BoardHome extends StatelessWidget {
  const BoardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text('점포 공지', textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Column(
                  children: [
                    // 알림 요약
                    AlertOverView(),

                    SizedBox(height: 20.0),
                    // 게시물
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ContentBox(
                            author: '김지철',
                            content:
                                '오늘 주방에 파 10kg 주문했습니다. \n눈이 와서 배송이 어려운데 가락시장에서 픽업 가능한 분 픽업 해주세요! 🙏 픽업 해 주시면 감사하겠습니다.zzzzzzzz',
                            date: '2024년 12월 08일 오전 08:16분',
                            likes: 2,
                            comments: 2,
                            maxLines: 3,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20.0);
                        },
                        itemCount: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              left: 20.0,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // 게시글 작성하기 동작
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF9DCEFF),
                          Color(0xFF6499FF),
                          Color(0xFF3971FF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Text(
                        '게시글 작성하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 알림 요약
class AlertOverView extends StatelessWidget {
  const AlertOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/speaker.png',
                width: 28.0,
                height: 28.0,
              ),
              SizedBox(width: 5.0),
              Text('오늘 주방에 파 10kg 주문했습니다.'),
            ],
          ),
          Image.asset(
            'assets/icons/arrow_down.png',
            width: 28.0,
            height: 28.0,
          ),
        ],
      ),
    );
  }
}

// 게시글
class ContentBox extends StatelessWidget {
  final String author;
  final String content;
  final String date;
  final int likes;
  final int comments;
  final int maxLines;
  const ContentBox({
    super.key,
    required this.author,
    required this.content,
    required this.date,
    required this.likes,
    required this.comments,
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
                              color: Color(0xFF3F32D5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '지철',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('김지철'),
                                  Image.asset(
                                    'assets/icons/crown.png',
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                  Image.asset(
                                    'assets/icons/pin.png',
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                ],
                              ),
                              Text(
                                '2024년 12월 08일 오전 08:16분',
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
                            content,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: maxLines,
                            overflow: TextOverflow.ellipsis,
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('좋아요 2개'),
                    Text('댓글 2개'),
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Color(0xFFE5E5E5),
                  height: 1.0,
                ),
                SizedBox(height: 10.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 24.0,
            height: 24.0,
          ),
          SizedBox(width: 5.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF969696),
            ),
          ),
        ],
      ),
    );
  }
}
