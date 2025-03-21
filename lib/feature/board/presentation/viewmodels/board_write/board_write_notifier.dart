import 'package:board/feature/board/domain/usecase/i_board_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_write_viewmodel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BoardWriteNotifier extends StateNotifier<BoardWriteViewModel> {
  final IBoardUsecase _boardUsecase;
  final Ref ref;

  BoardWriteNotifier(this._boardUsecase, this.ref)
      : super(BoardWriteViewModel.init(ref));

  // 글을 수정할 때 데이터를 불러오는 메서드
  Future<void> loadContentForEdit(String boardId) async {
    String jsonString =
        await rootBundle.loadString('assets/data/board_contents.json');
    final jsonData = json.decode(jsonString);

    final content = jsonData['boardContents']
        .firstWhere((x) => x['boardId'] == boardId, orElse: () => null);

    if (content != null) {
      state = BoardWriteViewModel.init(ref);
    }
  }
}
