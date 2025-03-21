import 'package:board/feature/board/domain/entities/pin_info_entity.dart';

class PinInfoModel {
  final bool isAlertPinned;
  final String? alertPinnedAt;
  final bool isPinned;
  final String? pinnedAt;
  final bool isTopPinned;
  final String? topPinnedAt;

  PinInfoModel({
    required this.isAlertPinned,
    required this.alertPinnedAt,
    required this.isPinned,
    required this.pinnedAt,
    required this.isTopPinned,
    required this.topPinnedAt,
  });
  factory PinInfoModel.fromJson(Map<String, dynamic> json) {
    return PinInfoModel(
      isAlertPinned: json['isAlertPinned'],
      alertPinnedAt: json['alertPinnedAt'],
      isPinned: json['isPinned'],
      pinnedAt: json['pinnedAt'],
      isTopPinned: json['isTopPinned'],
      topPinnedAt: json['topPinnedAt'],
    );
  }

  PinInfo toEntity() {
    return PinInfo(
      isAlertPinned: isAlertPinned,
      alertPinnedAt: alertPinnedAt,
      isPinned: isPinned,
      pinnedAt: pinnedAt,
      isTopPinned: isTopPinned,
      topPinnedAt: topPinnedAt,
    );
  }
}
