import 'package:board/feature/presentation/viewmodel/board_detail/board_detail_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BoardDetailNotifier extends Notifier<BoardDetailViewModel> {
  @override
  BoardDetailViewModel build() {
    loadBoardContent();
    return BoardDetailViewModel(
      boardId: '',
      userId: '',
      userName: '',
      shortName: '',
      iconColor: '',
      content: '',
      createdAt: '',
      updatedAt: '',
      isOwner: false,
      isManager: false,
      likeCounts: 0,
      replyCounts: 0,
      isAlertPinned: false,
      isPinned: false,
      isTopPinned: false,
      replies: [
        Reply(
          replyId: '',
          userId: '',
          userName: '',
          shortName: '',
          iconColor: '',
          createdAt: '',
          content: '',
          isOwner: false,
          isManager: false,
          likeCounts: 0,
        ),
      ],
    );
  }

  // 데이터를 가져오는 메서드
  Future<void> loadBoardContent() async {
    String jsonString =
        await rootBundle.loadString('assets/data/board_contents.json');
    final jsonData = json.decode(jsonString);

    state = BoardDetailViewModel.fromJson(jsonData);
  }
}
