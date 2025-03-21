import 'package:board/feature/board/domain/entities/pin_info_entity.dart';
import 'package:board/feature/board/domain/entities/reply_entity.dart';
import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailViewModel {
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
  final int replyCounts;
  final String content;
  final List<String> images;
  final PinInfo pinInfo;
  final List<Reply>? replies;

  BoardDetailViewModel({
    required this.boardId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.images,
    required this.createdAt,
    this.updatedAt,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    required this.replyCounts,
    required this.pinInfo,
    this.replies,
  });

  factory BoardDetailViewModel.fromJson(Map<String, dynamic> json) {
    return BoardDetailViewModel(
      boardId: json['boardId'],
      userId: json['userId'],
      userName: json['userName'],
      shortName: json['shortName'],
      iconColor: json['iconColor'],
      content: json['content'],
      images: json['images'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isOwner: json['isOwner'],
      isManager: json['isManager'],
      likeCounts: json['likeCounts'],
      replyCounts: json['replyCounts'],
      pinInfo: json['pinInfo'],
      replies: json['replies'],
    );
  }

  BoardDetailViewModel copyWith({
    String? boardId,
    String? userId,
    String? userName,
    String? shortName,
    String? iconColor,
    String? content,
    String? createdAt,
    String? updatedAt,
    bool? isOwner,
    bool? isManager,
    int? likeCounts,
    int? replyCounts,
    PinInfo? pinInfo,
    List<Reply>? replies,
  }) {
    return BoardDetailViewModel(
      boardId: boardId ?? this.boardId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      shortName: shortName ?? this.shortName,
      iconColor: iconColor ?? this.iconColor,
      content: content ?? this.content,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isOwner: isOwner ?? this.isOwner,
      isManager: isManager ?? this.isManager,
      likeCounts: likeCounts ?? this.likeCounts,
      replyCounts: replyCounts ?? this.replyCounts,
      pinInfo: pinInfo ?? this.pinInfo,
      replies: replies ?? this.replies,
    );
  }

  static BoardDetailViewModel init(Ref ref) {
    final boardEntity = ref.read(boardProvider).boardEntity;
    return BoardDetailViewModel(
      boardId: boardEntity.boardId,
      userId: boardEntity.userId,
      userName: boardEntity.userName,
      shortName: boardEntity.shortName,
      iconColor: boardEntity.iconColor,
      content: boardEntity.content,
      images: boardEntity.images,
      createdAt: boardEntity.createdAt,
      updatedAt: boardEntity.updatedAt,
      isOwner: boardEntity.isOwner,
      isManager: boardEntity.isManager,
      likeCounts: boardEntity.likeCounts,
      replyCounts: boardEntity.replyCounts,
      pinInfo: boardEntity.pinInfo,
      replies: boardEntity.replies,
    );
  }
}
