import 'package:board/core/constants/size.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_provider.dart';
import 'package:board/feature/presentation/widgets/board_home/content_box.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 게시물 리스트
class BoardList extends HookConsumerWidget {
  const BoardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final boardList = ref.watch(boardHomeProvider);

    return Expanded(
      child: ListView.separated(
        itemCount: boardList.length,
        itemBuilder: (_, index) {
          final content = boardList[index];

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
