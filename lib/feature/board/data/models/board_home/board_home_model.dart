import 'package:board/feature/board/data/models/board_home/pin_info_model.dart';
import 'package:board/feature/board/domain/entities/board_entity.dart';
import 'package:board/feature/board/domain/entities/pin_info_entity.dart';

class BoardHomeModel {
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

  BoardHomeModel({
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

  

  factory BoardHomeModel.fromJson(Map<String, dynamic> json) {
    return BoardHomeModel(
      boardId: json['boardId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: json['likeCounts'] as int,
      likeUserIds: (json['likeUserIds'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toSet(),
      replyCounts: json['replyCounts'] as int,
      content: json['content'] as String,
      images: List<String>.from(json['images'] ?? []),
      pinInfo: PinInfoModel.fromJson(json['pinInfo'] ?? {}).toEntity(),
    );
  }

  BoardEntity toEntity() {
    return BoardEntity(
      boardId: boardId,
      userId: userId,
      userName: userName,
      shortName: shortName,
      iconColor: iconColor,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isOwner: isOwner,
      isManager: isManager,
      likeCounts: likeCounts,
      likeUserIds: likeUserIds,
      replyCounts: replyCounts,
      content: content,
      images: images,
      pinInfo: pinInfo,
      replies: [],
    );
  }
}
