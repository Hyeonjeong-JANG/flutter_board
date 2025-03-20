import 'package:board/feature/presentation/viewmodel/board_write/board_write_notifier.dart';
import 'package:board/feature/presentation/viewmodel/board_write/board_write_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardWriteProvider =
    NotifierProvider<BoardWriteNotifier, BoardWriteViewModel>(
  () => BoardWriteNotifier(),
);
