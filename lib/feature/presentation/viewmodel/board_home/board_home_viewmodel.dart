import 'package:json_annotation/json_annotation.dart';

part 'board_home_viewmodel.g.dart';

@JsonSerializable()
class BoardHomeViewModel {
  final String userName;
  final String shortName;
  final String iconColor;
  final String date;
  final bool isOwner;
  final bool isManager;
  final int likeCounts;
  final int replyCounts;
  final String content;
  final PinInfo pinInfo;

  BoardHomeViewModel({
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.date,
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
  final String alertPinnedDate;
  final bool isPinned;
  final String pinDate;
  final bool isTopPinned;
  final String topPinnedDate;

  PinInfo({
    required this.isAlertPinned,
    required this.alertPinnedDate,
    required this.isPinned,
    required this.pinDate,
    required this.isTopPinned,
    required this.topPinnedDate,
  });

  factory PinInfo.fromJson(Map<String, dynamic> json) =>
      _$PinInfoFromJson(json);
}
