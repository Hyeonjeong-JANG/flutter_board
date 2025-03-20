import 'package:board/core/constants/color.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:board/feature/presentation/widgets/floating_gradient_button_.dart';
import 'package:flutter/material.dart';

class BoardWritePage extends StatelessWidget {
  const BoardWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '게시글 작성',
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
              width: double.infinity,
              height: 150.0,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.expensesColor,
                      width: 2.0,
                    ),
                  ),
                  hintText: '게시글 작성칸',
                ),
                maxLines: null,
              ),
            ),
            Text('사진등록칸'),
            ],
          ),
          FloatingGradientButton(title: '공지 수정하기', onTap: () {}),
        ],
      ),
    );
  }
}
