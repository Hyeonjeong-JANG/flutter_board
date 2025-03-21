import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

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

  PinInfo copyWith({
    bool? isAlertPinned,
    String? alertPinnedAt,
    bool? isPinned,
    String? pinnedAt,
    bool? isTopPinned,
    String? topPinnedAt,
  }) {
    return PinInfo(
      isAlertPinned: isAlertPinned ?? this.isAlertPinned,
      alertPinnedAt: alertPinnedAt ?? this.alertPinnedAt,
      isPinned: isPinned ?? this.isPinned,
      pinnedAt: pinnedAt ?? this.pinnedAt,
      isTopPinned: isTopPinned ?? this.isTopPinned,
      topPinnedAt: topPinnedAt ?? this.topPinnedAt,
    );
  }
}
