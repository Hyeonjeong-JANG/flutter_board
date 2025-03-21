import 'package:json_annotation/json_annotation.dart';

part 'board_detail_viewmodel.g.dart';

@JsonSerializable()
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
  // final bool isAlertPinned;
  // final bool isPinned;
  // final bool isTopPinned;
  final PinInfo pinInfo;
  final List<Reply>? replies;

  BoardDetailViewModel({
    required this.boardId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.createdAt,
    this.updatedAt,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    required this.replyCounts,
    required this.pinInfo,
    this.replies,
  });

  factory BoardDetailViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardDetailViewModelFromJson(json);
}

@JsonSerializable()
class PinInfo {
  final bool isAlertPinned;
  final bool isPinned;
  final bool isTopPinned;

  PinInfo({
    required this.isAlertPinned,
    required this.isPinned,
    required this.isTopPinned,
  });

  factory PinInfo.fromJson(Map<String, dynamic> json) =>
      _$PinInfoFromJson(json);
}

@JsonSerializable()
class Reply {
  final String replyId;
  final String userId;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final String content;
  final int likeCounts;
  final List<String>? likeUserIds;

  Reply({
    required this.replyId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.createdAt,
    required this.content,
    required this.likeCounts,
    this.likeUserIds,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}
