import 'package:board/feature/board/presentation/viewmodels/board_home/board_home_notifier.dart';
import 'package:board/feature/board/presentation/viewmodels/board_home/board_home_viewmodel.dart';
import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardHomeProvider =
    StateNotifierProvider<BoardHomeNotifier, List<BoardHomeViewModel>>(
  (ref) {
    return BoardHomeNotifier(ref.read(boardUsecaseProvider), ref);
  }
);

