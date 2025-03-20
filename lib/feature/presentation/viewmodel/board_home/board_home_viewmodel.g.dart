// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_home_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardHomeViewModel _$BoardHomeViewModelFromJson(Map<String, dynamic> json) =>
    BoardHomeViewModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
      replyCounts: (json['replyCounts'] as num).toInt(),
      pinInfo: PinInfo.fromJson(json['pinInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoardHomeViewModelToJson(BoardHomeViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'createdAt': instance.createdAt,
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
      'likeCounts': instance.likeCounts,
      'replyCounts': instance.replyCounts,
      'content': instance.content,
      'pinInfo': instance.pinInfo,
    };

PinInfo _$PinInfoFromJson(Map<String, dynamic> json) => PinInfo(
      isAlertPinned: json['isAlertPinned'] as bool,
      alertPinnedAt: json['alertPinnedAt'] as String,
      isPinned: json['isPinned'] as bool,
      pinnedAt: json['pinnedAt'] as String,
      isTopPinned: json['isTopPinned'] as bool,
      topPinnedAt: json['topPinnedAt'] as String,
    );

Map<String, dynamic> _$PinInfoToJson(PinInfo instance) => <String, dynamic>{
      'isAlertPinned': instance.isAlertPinned,
      'alertPinnedAt': instance.alertPinnedAt,
      'isPinned': instance.isPinned,
      'pinnedAt': instance.pinnedAt,
      'isTopPinned': instance.isTopPinned,
      'topPinnedAt': instance.topPinnedAt,
    };
