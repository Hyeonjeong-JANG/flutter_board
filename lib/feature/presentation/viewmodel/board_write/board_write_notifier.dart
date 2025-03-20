import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_write_viewmodel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BoardWriteNotifier extends Notifier<BoardWriteViewModel> {
  @override
  BoardWriteViewModel build() {
    return BoardWriteViewModel(
      content: '',
      images: [],
      createdAt: DateTime.now().toString(),
      updatedAt: null,
      isOwner: false,
      isManager: false,
    );
  }

  // 글을 수정할 때 데이터를 불러오는 메서드
  Future<void> loadContentForEdit(String id) async {
    String jsonString =
        await rootBundle.loadString('assets/data/board_contents.json');
    final jsonData = json.decode(jsonString);

    final content = jsonData['boardContents']
        .firstWhere((x) => x['id'] == id, orElse: () => null);

    if (content != null) {
      state = BoardWriteViewModel.fromJson(content);
    }
  }
}
