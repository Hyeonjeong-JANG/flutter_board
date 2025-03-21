import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardWriteViewModel {
  final String content;
  final List<String> images;
  final String createdAt;
  final String? updatedAt;
  final bool isOwner;
  final bool isManager;

  BoardWriteViewModel({
    required this.content,
    this.images = const [],
    required this.createdAt,
    this.updatedAt,
    required this.isOwner,
    required this.isManager,
  });

  BoardWriteViewModel copyWith({
    String? content,
    List<String>? images,
    String? createdAt,
    String? updatedAt,
    bool? isOwner,
    bool? isManager,
  }) {
    return BoardWriteViewModel(
      content: content ?? this.content,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isOwner: isOwner ?? this.isOwner,
      isManager: isManager ?? this.isManager,
    );
  }

  static BoardWriteViewModel init(Ref ref) {
    final boardEntity = ref.read(boardProvider).boardEntity;
    return BoardWriteViewModel(
      content: boardEntity.content,
      images: boardEntity.images,
      createdAt: boardEntity.createdAt,
      updatedAt: boardEntity.updatedAt,
      isOwner: boardEntity.isOwner,
      isManager: boardEntity.isManager,
    );
  }
}
