

import 'package:board/feature/board/data/datasources/api/api_board_datasource.dart';
import 'package:board/feature/board/data/datasources/board_datasource_impl.dart';
import 'package:board/feature/board/data/datasources/i_board_datasource.dart';
import 'package:board/feature/board/data/datasources/local/local_board_datasource.dart';
import 'package:board/feature/board/data/repositories/board_repository_impl.dart';
import 'package:board/feature/board/data/repositories/i_board_repository.dart';
import 'package:board/feature/board/domain/usecase/board_usecase_impl.dart';
import 'package:board/feature/board/domain/usecase/i_board_usecase.dart';
import 'package:board/feature/board/presentation/viewmodels/board_notifier.dart';
import 'package:board/feature/board/presentation/viewmodels/board_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardProvider = StateNotifierProvider<BoardNotifier, BoardViewModel>((ref) {
  return BoardNotifier(ref.read(boardUsecaseProvider), ref);
});

final boardUsecaseProvider = Provider<IBoardUsecase>((ref) {
  return BoardUsecaseImpl(ref.read(boardRepositoryProvider));
});

final boardRepositoryProvider = Provider<IBoardRepository>((ref) {
  return BoardRepositoryImpl(ref.read(boardDataSourceProvider));
});

final boardDataSourceProvider = Provider<IBoardDataSource>((ref) {
  final apiBoardDataSource = ref.read(apiBoardDataSourceProvider);
  final localBoardDataSource = ref.read(localBoardDataSourceProvider);
  return BoardDataSourceImpl(apiBoardDataSource, localBoardDataSource);
});

final apiBoardDataSourceProvider = Provider<ApiBoardDataSource>((ref) {
  return ApiBoardDataSource();
});

final localBoardDataSourceProvider = Provider<LocalBoardDataSource>((ref) {
  return LocalBoardDataSource();
});
