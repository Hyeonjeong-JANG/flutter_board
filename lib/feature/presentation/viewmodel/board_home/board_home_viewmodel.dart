import 'package:json_annotation/json_annotation.dart';

part 'board_home_viewmodel.g.dart';

@JsonSerializable()
class BoardHomeViewModel {
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
  final PinInfo pinInfo;

  BoardHomeViewModel({
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
    required this.pinInfo,
  });

  factory BoardHomeViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardHomeViewModelFromJson(json);
}

@JsonSerializable()
class PinInfo {
  final bool isAlertPinned;
  final String alertPinnedAt;
  final bool isPinned;
  final String pinnedAt;
  final bool isTopPinned;
  final String topPinnedAt;

  PinInfo({
    required this.isAlertPinned,
    required this.alertPinnedAt,
    required this.isPinned,
    required this.pinnedAt,
    required this.isTopPinned,
    required this.topPinnedAt,
  });

  factory PinInfo.fromJson(Map<String, dynamic> json) =>
      _$PinInfoFromJson(json);
}
