import 'package:board/core/constants/size.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:board/feature/presentation/widgets/board_home/content_box.dart';
import 'package:flutter/material.dart';

// 게시물 리스트
class BoardList extends StatelessWidget {
  final List<BoardHomeViewModel> contents;
  const BoardList({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: contents.length,
        itemBuilder: (_, index) {
          final content = contents[index];

          return ContentBox(
            content: content,
            maxLines: 3,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.spacingL);
        },
      ),
    );
  }
}
