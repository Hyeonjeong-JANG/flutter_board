import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_home_viewmodel.dart';

// Notifier를 사용하여 상태(게시글 목록)를 관리하는 클래스
class BoardHomeNotifier extends Notifier<List<BoardHomeViewModel>> {
  @override
  List<BoardHomeViewModel> build() {

    return [];
  }

  // 데이터를 세팅하는 메서드
  void setContents(List<BoardHomeViewModel> contents) {
    state = contents;
  }

  // 알림판용 정렬: isAlertPinned가 true인 항목만 필터링 후, alertPinnedDate 기준 최신순 정렬
  List<BoardHomeViewModel> get alertBoardContents {
    final alertList =
        state.where((item) => item.pinInfo.isAlertPinned).toList();
    alertList.sort((a, b) => DateTime.parse(b.pinInfo.alertPinnedDate)
        .compareTo(DateTime.parse(a.pinInfo.alertPinnedDate)));
    return alertList;
  }

  // 게시글 리스트용 정렬:
  // 1. 최상단 고정(isTopPinned) 항목: topPinnedDate 기준 최신순 정렬
  // 2. 그 다음 일반 고정(isPinned) 항목: pinDate 기준 최신순 정렬
  // 3. 나머지는 일반 날짜(date) 기준 최신순 정렬
  List<BoardHomeViewModel> get boardListContents {
    final boardList = List<BoardHomeViewModel>.from(state);
    boardList.sort((a, b) {
      // 1. 최상단 고정 여부 비교
      if (a.pinInfo.isTopPinned != b.pinInfo.isTopPinned) {
        return a.pinInfo.isTopPinned ? -1 : 1;
      }
      if (a.pinInfo.isTopPinned && b.pinInfo.isTopPinned) {
        return DateTime.parse(b.pinInfo.topPinnedDate)
            .compareTo(DateTime.parse(a.pinInfo.topPinnedDate));
      }
      // 2. 일반 고정 여부 비교
      if (a.pinInfo.isPinned != b.pinInfo.isPinned) {
        return a.pinInfo.isPinned ? -1 : 1;
      }
      if (a.pinInfo.isPinned && b.pinInfo.isPinned) {
        return DateTime.parse(b.pinInfo.pinDate)
            .compareTo(DateTime.parse(a.pinInfo.pinDate));
      }
      // 3. 고정되지 않은 항목은 일반 날짜(date) 기준 내림차순 정렬
      return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
    });
    return boardList;
  }
}
