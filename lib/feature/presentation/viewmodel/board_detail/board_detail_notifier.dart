import 'package:board/feature/presentation/viewmodel/board_detail/board_detail_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailNotifier extends Notifier<BoardDetailViewModel> {
  @override
  BoardDetailViewModel build() => BoardDetailViewModel(
        id: '',
        userName: '',
        shortName: '',
        iconColor: '',
        content: '',
        createdAt: '',
        isOwner: false,
        isManager: false,
        likeCounts: 0,
        replyCounts: 0,
        isAlertPinned: false,
        isPinned: false,
        isTopPinned: false,
        replies: Replies(
          id: '',
          userName: '',
          shortName: '',
          iconColor: '',
          createdAt: '',
          content: '',
          isOwner: false,
          isManager: false,
          likeCounts: 0,
        ),
      );
}
