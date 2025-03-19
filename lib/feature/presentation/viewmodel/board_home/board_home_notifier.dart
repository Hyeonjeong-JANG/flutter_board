import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_home_viewmodel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Notifier를 사용하여 상태(게시글 목록)를 관리하는 클래스
class BoardHomeNotifier extends Notifier<List<BoardHomeViewModel>> {
  @override
  List<BoardHomeViewModel> build() {
    loadBoardContents();

    return [];
  }

  // 데이터를 가져오는 메서드
  Future<void> loadBoardContents() async {
    String jsonString =
        await rootBundle.loadString('assets/data/board_contents.json');
    final jsonData = json.decode(jsonString);

    state = List<BoardHomeViewModel>.from(
        jsonData['boardContents'].map((x) => BoardHomeViewModel.fromJson(x)));
  }

  // 데이터를 세팅하는 메서드
  void setContents(List<BoardHomeViewModel> contents) {
    state = contents;
  }

  // 알림판용 정렬: isAlertPinned가 true인 항목만 필터링 후, alertPinnedDate 기준 최신순 정렬
  List<BoardHomeViewModel> get alertBoardContents {
    final alertList =
        state.where((item) => item.pinInfo.isAlertPinned).toList();
    alertList.sort((a, b) => DateTime.parse(b.pinInfo.alertPinnedAt)
        .compareTo(DateTime.parse(a.pinInfo.alertPinnedAt)));
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
        return DateTime.parse(b.pinInfo.topPinnedAt)
            .compareTo(DateTime.parse(a.pinInfo.topPinnedAt));
      }
      // 2. 일반 고정 여부 비교
      if (a.pinInfo.isPinned != b.pinInfo.isPinned) {
        return a.pinInfo.isPinned ? -1 : 1;
      }
      if (a.pinInfo.isPinned && b.pinInfo.isPinned) {
        return DateTime.parse(b.pinInfo.pinnedAt)
            .compareTo(DateTime.parse(a.pinInfo.pinnedAt));
      }
      // 3. 고정되지 않은 항목은 일반 날짜(date) 기준 내림차순 정렬
      return DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt));
    });
    return boardList;
  }
}
