import 'package:json_annotation/json_annotation.dart';

part 'board_home_viewmodel.g.dart';

@JsonSerializable()
class BoardHomeViewModel {
  final String id;
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
  final PinInfo pinInfo;

  BoardHomeViewModel({
    required this.id,
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
    required this.pinInfo,
  });

  factory BoardHomeViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardHomeViewModelFromJson(json);
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
    this.isAlertPinned = false,
    this.alertPinnedAt,
    this.isPinned = false,
    this.pinnedAt,
    this.isTopPinned = false,
    this.topPinnedAt,
  });
  factory PinInfo.fromJson(Map<String, dynamic> json) =>
      _$PinInfoFromJson(json);
}
