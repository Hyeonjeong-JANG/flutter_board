import 'package:board/feature/board/domain/usecase/i_board_usecase.dart';
import 'package:board/feature/board/presentation/viewmodels/board_viewmodel.dart';
import 'package:board/feature/board/domain/entities/board_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardNotifier extends StateNotifier<BoardViewModel> {
  final IBoardUsecase _boardUsecase;
  final Ref ref;
  BoardNotifier(this._boardUsecase, this.ref)
      : super(BoardViewModel(boardEntity: BoardEntity.init(ref)));
}
