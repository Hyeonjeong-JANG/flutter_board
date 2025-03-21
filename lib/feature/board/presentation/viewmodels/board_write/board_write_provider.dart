import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:board/feature/board/presentation/viewmodels/board_write/board_write_notifier.dart';
import 'package:board/feature/board/presentation/viewmodels/board_write/board_write_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardWriteProvider = StateNotifierProvider<BoardWriteNotifier, BoardWriteViewModel>((ref) {

  return BoardWriteNotifier(ref.read(boardUsecaseProvider), ref);
});

