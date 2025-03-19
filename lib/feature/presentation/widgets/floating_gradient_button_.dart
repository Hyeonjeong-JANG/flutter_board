import 'package:flutter/material.dart';

class FloatingGradientButton extends StatelessWidget {
  final String title;
  const FloatingGradientButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                title,
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
    );
  }
}
