import 'package:json_annotation/json_annotation.dart';

part 'board_entity.g.dart';

@JsonSerializable()
class BoardEntity {
  final String id;
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
  final PinInfo? pinInfo;
  final List<Reply>? replies;

  BoardEntity({
    required this.id,
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
    required this.pinInfo,
    this.replies,
  });

  factory BoardEntity.fromJson(Map<String, dynamic> json) =>
      _$BoardEntityFromJson(json);

  // 좋아요 수를 토글하는 메서드
  BoardEntity toggleLike(String userId) {
    final newLikedUserIds = Set<String>.from(likeUserIds ?? []);
    int newLikeCounts = likeCounts;

    if (newLikedUserIds.contains(userId)) {
      newLikedUserIds.remove(userId);
      newLikeCounts--;
    } else {
      newLikedUserIds.add(userId);
      newLikeCounts++;
    }

    return BoardEntity(
      id: id,
      userName: userName,
      shortName: shortName,
      iconColor: iconColor,
      createdAt: createdAt,
      updatedAt: DateTime.now().toIso8601String(),
      isOwner: isOwner,
      isManager: isManager,
      likeCounts: newLikeCounts,
      likeUserIds: newLikedUserIds,
      replyCounts: replyCounts,
      content: content,
      pinInfo: pinInfo,
      replies: replies,
    );
  }
}

@JsonSerializable()
class PinInfo {
  final bool isAlertPinned;
  final String? alertPinnedAt;
  final bool isPinned;
  final String? pinnedAt;
  final bool isTopPinned;
  final String? topPinnedAt;

  PinInfo({
    required this.isAlertPinned,
    this.alertPinnedAt,
    required this.isPinned,
    this.pinnedAt,
    required this.isTopPinned,
    this.topPinnedAt,
  });

  factory PinInfo.fromJson(Map<String, dynamic> json) =>
      _$PinInfoFromJson(json);
}

@JsonSerializable()
class Reply {
  final String id;
  final String userId;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final String content;
  final bool isOwner;
  final bool isManager;
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
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    this.likeUserIds,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}
