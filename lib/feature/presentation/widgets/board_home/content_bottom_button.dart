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
