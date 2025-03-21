import 'package:board/feature/board/domain/usecase/i_board_usecase.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BoardDetailNotifier extends StateNotifier<BoardDetailViewModel> {
  final IBoardUsecase _boardUsecase;
  final Ref ref;

  BoardDetailNotifier(this._boardUsecase, this.ref)
      : super(BoardDetailViewModel.init());

  // 데이터를 가져오는 메서드
  Future<void> loadBoardDetail(String boardId) async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/data/board_contents.json');
      final jsonData = json.decode(jsonString);

      final content = jsonData['boardContents']
          .firstWhere((x) => x['boardId'] == boardId, orElse: () => null);

      if (content != null) {
        state = BoardDetailViewModel.fromJson(content);
      } else {
        print('게시글 데이터를 찾을 수 없습니다: boardId=$boardId');
      }
    } catch (e) {
      print('게시글 데이터 로딩 중 오류 발생: $e');
    }
  }
}
