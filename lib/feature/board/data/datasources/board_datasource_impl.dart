import 'package:board/feature/board/data/datasources/api/api_board_datasource.dart';
import 'package:board/feature/board/data/datasources/i_board_datasource.dart';
import 'package:board/feature/board/data/datasources/local/local_board_datasource.dart';

class BoardDataSourceImpl extends IBoardDataSource {
  final ApiBoardDataSource _apiBoardDataSource;
  final LocalBoardDataSource _localBoardDataSource;

  BoardDataSourceImpl(this._apiBoardDataSource, this._localBoardDataSource);
}