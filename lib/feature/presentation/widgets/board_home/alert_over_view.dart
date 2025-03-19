import 'package:flutter/material.dart';

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