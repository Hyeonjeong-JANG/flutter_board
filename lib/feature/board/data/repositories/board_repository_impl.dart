import 'package:board/feature/board/data/datasources/i_board_datasource.dart';
import 'package:board/feature/board/data/repositories/i_board_repository.dart';

class BoardRepositoryImpl extends IBoardRepository {
  final IBoardDataSource _boardDataSource;

  BoardRepositoryImpl(this._boardDataSource);
}