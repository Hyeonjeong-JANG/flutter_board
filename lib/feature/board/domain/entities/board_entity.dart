import 'package:board/feature/board/domain/entities/pin_info_entity.dart';
import 'package:board/feature/board/domain/entities/reply_entity.dart';
import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardEntity {
  final String boardId;
  final String userId;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final String? updatedAt;
  final bool isOwner;
  final bool isManager;
  final int likeCounts;
  final Set<String>? likeUserIds;
  final int replyCounts;
  final String content;
  final List<String> images;
  final PinInfo pinInfo;
  final List<Reply> replies;

  BoardEntity({
    required this.boardId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.createdAt,
    this.updatedAt,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    this.likeUserIds,
    required this.replyCounts,
    required this.content,
    required this.images,
    required this.pinInfo,
    required this.replies,
  });

  BoardEntity copyWith({
    String? boardId,
    String? userId,
    String? userName,
    String? shortName,
    String? iconColor,
    String? createdAt,
    String? updatedAt,
    bool? isOwner,
    bool? isManager,
    int? likeCounts,
    Set<String>? likeUserIds,
    int? replyCounts,
    String? content,
    List<String>? images,
    PinInfo? pinInfo,
    List<Reply>? replies,
  }) {
    return BoardEntity(
      boardId: boardId ?? this.boardId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      shortName: shortName ?? this.shortName,
      iconColor: iconColor ?? this.iconColor,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isOwner: isOwner ?? this.isOwner,
      isManager: isManager ?? this.isManager,
      likeCounts: likeCounts ?? this.likeCounts,
      likeUserIds: likeUserIds ?? this.likeUserIds,
      replyCounts: replyCounts ?? this.replyCounts,
      content: content ?? this.content,
      images: images ?? this.images,
      pinInfo: pinInfo ?? this.pinInfo,
      replies: replies ?? this.replies,
    );
  }

  static BoardEntity init(Ref ref) {
    final boardEntity = ref.read(boardProvider).boardEntity;
    return BoardEntity(
      boardId: boardEntity.boardId,
      userId: boardEntity.userId,
      userName: boardEntity.userName,
      shortName: boardEntity.shortName,
      iconColor: boardEntity.iconColor,
      createdAt: boardEntity.createdAt,
      isOwner: boardEntity.isOwner,
      isManager: boardEntity.isManager,
      likeCounts: boardEntity.likeCounts,
      likeUserIds: boardEntity.likeUserIds?.toSet(),
      replyCounts: boardEntity.replyCounts,
      content: boardEntity.content,
      images: boardEntity.images,
      pinInfo: boardEntity.pinInfo,
      replies: boardEntity.replies,
    );
  }
}
