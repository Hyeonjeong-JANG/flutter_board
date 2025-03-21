import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Reply {
  final String id;
  final String userId;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final String content;
  final int likeCounts;
  final Set<String>? likeUserIds;
  Reply({
    required this.id,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.createdAt,
    required this.content,
    required this.likeCounts,
    this.likeUserIds,
  });

  Reply copyWith({
    String? id,
    String? userId,
    String? userName,
    String? shortName,
    String? iconColor,
    String? createdAt,
    String? content,
    int? likeCounts,
    Set<String>? likeUserIds,
  }) {
    return Reply(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      shortName: shortName ?? this.shortName,
      iconColor: iconColor ?? this.iconColor,
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
      likeCounts: likeCounts ?? this.likeCounts,
      likeUserIds: likeUserIds ?? this.likeUserIds,
    );
  }

  static Reply init(Ref ref) {
    final boardEntity = ref.read(boardProvider).boardEntity;
    return Reply(
      id: '',
      userId: '',
      userName: '',
      shortName: '',
      iconColor: '',
      createdAt: '',
      content: '',
      likeCounts: 0,
      likeUserIds: boardEntity.likeUserIds?.toSet(),
    );
  }
}
