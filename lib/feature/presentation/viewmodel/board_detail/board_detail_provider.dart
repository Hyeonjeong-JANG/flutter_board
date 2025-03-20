import 'package:board/feature/presentation/viewmodel/board_detail/board_detail_notifier.dart';
import 'package:board/feature/presentation/viewmodel/board_detail/board_detail_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardDetailProvider =
    NotifierProvider<BoardDetailNotifier, BoardDetailViewModel>(
  () => BoardDetailNotifier(),
);
