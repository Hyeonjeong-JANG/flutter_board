import 'package:board/core/widgets/app_bar_with_back_button.dart';
import 'package:flutter/material.dart';

class BoardWritePage extends StatelessWidget {
  const BoardWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBackButton(
        title: '게시글 작성',
      ),
    );
  }
}
