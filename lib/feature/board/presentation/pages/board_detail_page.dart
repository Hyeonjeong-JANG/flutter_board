import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:board/core/utils/date_formatter.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_provider.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_viewmodel.dart';
import 'package:board/feature/board/presentation/viewmodels/board_home/board_home_viewmodel.dart';
import 'package:board/feature/board/presentation/widgets/board_detail/board_detail.dart';
import 'package:board/feature/board/presentation/widgets/board_detail/reply_List.dart';
import 'package:board/feature/board/presentation/widgets/board_home/content_bottom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailPage extends HookConsumerWidget {
  // final BoardHomeViewModel content;
  final String boardId;
  const BoardDetailPage({
    super.key,
    required this.boardId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardDetailNotifier = ref.read(boardDetailProvider.notifier);
    final content = ref.watch(boardDetailProvider);

    useEffect(() {
      boardDetailNotifier.loadBoardDetail(boardId);
      return null;
    }, []);

    return DefaultLayout(
      title: '게시글 상세',
      child: Container(
        padding: EdgeInsets.all(AppSizes.spacingL),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusXL),
        ),
        child: Column(
          children: [
            // 게시글 -> 좋아요, 댓글달기 버튼 분리해야할지도
            BoardDetail(),
            SizedBox(height: AppSizes.spacingL),
            // 댓글 + 대댓글 세트
            ReplyList(),
          ],
        ),
      ),
    );
  }
}
