import 'package:board/feature/board/data/repositories/i_board_repository.dart';
import 'package:board/feature/board/domain/usecase/i_board_usecase.dart';

class BoardUsecaseImpl extends IBoardUsecase {
  final IBoardRepository _boardRepository;

  BoardUsecaseImpl(this._boardRepository);
}
