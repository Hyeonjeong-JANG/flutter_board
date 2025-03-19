import 'package:board/feature/presentation/viewmodel/board_home/board_home_notifier.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardHomeProvider =
    NotifierProvider<BoardHomeNotifier, List<BoardHomeViewModel>>(
  () => BoardHomeNotifier(),
);

