import 'package:json_annotation/json_annotation.dart';

part 'board_detail_viewmodel.g.dart';

@JsonSerializable()
class BoardDetailViewModel {
  final String id;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final bool isOwner;
  final bool isManager;
  final int likeCounts;
  final int replyCounts;
  final String content;
  final bool isAlertPinned;
  final bool isPinned;
  final bool isTopPinned;
  final Replies replies;

  BoardDetailViewModel({
    required this.id,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.createdAt,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    required this.replyCounts,
    required this.isAlertPinned,
    required this.isPinned,
    required this.isTopPinned,
    required this.replies,
  });

  factory BoardDetailViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardDetailViewModelFromJson(json);
}

@JsonSerializable()
class Replies {
  final String id;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final String content;
  final bool isOwner;
  final bool isManager;
  final int likeCounts;

  Replies({
    required this.id,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.createdAt,
    required this.content,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
  });

  factory Replies.fromJson(Map<String, dynamic> json) =>
      _$RepliesFromJson(json);
}
