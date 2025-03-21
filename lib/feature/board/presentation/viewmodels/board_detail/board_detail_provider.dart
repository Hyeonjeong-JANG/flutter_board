import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_notifier.dart';
import 'package:board/feature/board/presentation/viewmodels/board_detail/board_detail_viewmodel.dart';
import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardDetailProvider = StateNotifierProvider<BoardDetailNotifier, BoardDetailViewModel>((ref) {
  return BoardDetailNotifier(ref.read(boardUsecaseProvider),ref);
});
