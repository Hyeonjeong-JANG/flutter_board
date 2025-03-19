import 'package:board/feature/presentation/viewmodel/board_home/board_home_notifier.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardHomeProvider =
    NotifierProvider<BoardHomeNotifier, List<BoardHomeViewModel>>(
  () => BoardHomeNotifier(),
);

// 알림 드롭다운 상태
final isDropdownOpenProvider = StateProvider<bool>((ref) => false);
