// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_home_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardHomeViewModel _$BoardHomeViewModelFromJson(Map<String, dynamic> json) =>
    BoardHomeViewModel(
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      content: json['content'] as String,
      date: json['date'] as String,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
      replyCounts: (json['replyCounts'] as num).toInt(),
      pinInfo: PinInfo.fromJson(json['pinInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoardHomeViewModelToJson(BoardHomeViewModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'date': instance.date,
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
      'likeCounts': instance.likeCounts,
      'replyCounts': instance.replyCounts,
      'content': instance.content,
      'pinInfo': instance.pinInfo,
    };

PinInfo _$PinInfoFromJson(Map<String, dynamic> json) => PinInfo(
      isAlertPinned: json['isAlertPinned'] as bool,
      alertPinnedDate: json['alertPinnedDate'] as String,
      isPinned: json['isPinned'] as bool,
      pinDate: json['pinDate'] as String,
      isTopPinned: json['isTopPinned'] as bool,
      topPinnedDate: json['topPinnedDate'] as String,
    );

Map<String, dynamic> _$PinInfoToJson(PinInfo instance) => <String, dynamic>{
      'isAlertPinned': instance.isAlertPinned,
      'alertPinnedDate': instance.alertPinnedDate,
      'isPinned': instance.isPinned,
      'pinDate': instance.pinDate,
      'isTopPinned': instance.isTopPinned,
      'topPinnedDate': instance.topPinnedDate,
    };
