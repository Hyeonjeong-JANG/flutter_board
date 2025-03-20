import 'package:board/core/constants/color.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class BoardWritePage extends StatelessWidget {
  const BoardWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '게시글 작성',
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.expensesColor,
                ),
              ),
              hintText: '게시글 작성칸',
            ),
          ),
          Text('사진등록칸'),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}
