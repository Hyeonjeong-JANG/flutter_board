import 'package:board/feature/board/domain/entities/pin_info_entity.dart';
import 'package:board/feature/board/domain/entities/board_entity.dart';

class BoardHomeViewModel {
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

  BoardHomeViewModel({
    required this.boardId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    required this.likeUserIds,
    required this.replyCounts,
    required this.content,
    required this.images,
    required this.pinInfo,
  });

  factory BoardHomeViewModel.fromEntity(BoardEntity boardEntity) {
    return BoardHomeViewModel(
      boardId: boardEntity.boardId,
      userId: boardEntity.userId,
      userName: boardEntity.userName,
      shortName: boardEntity.shortName,
      iconColor: boardEntity.iconColor,
      createdAt: boardEntity.createdAt,
      updatedAt: boardEntity.updatedAt,
      isOwner: boardEntity.isOwner,
      isManager: boardEntity.isManager,
      likeCounts: boardEntity.likeCounts,
      likeUserIds: boardEntity.likeUserIds?.toSet(),
      replyCounts: boardEntity.replyCounts,
      content: boardEntity.content,
      images: boardEntity.images,
      pinInfo: boardEntity.pinInfo,
    );
  }
}
