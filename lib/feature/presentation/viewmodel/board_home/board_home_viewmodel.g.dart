// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_home_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardHomeViewModel _$BoardHomeViewModelFromJson(Map<String, dynamic> json) =>
    BoardHomeViewModel(
      boardId: json['boardId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
      likeUserIds: (json['likeUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      replyCounts: (json['replyCounts'] as num).toInt(),
      content: json['content'] as String,
      pinInfo: PinInfo.fromJson(json['pinInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoardHomeViewModelToJson(BoardHomeViewModel instance) =>
    <String, dynamic>{
      'boardId': instance.boardId,
      'userId': instance.userId,
      'userName': instance.userName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
      'likeCounts': instance.likeCounts,
      'likeUserIds': instance.likeUserIds?.toList(),
      'replyCounts': instance.replyCounts,
      'content': instance.content,
      'pinInfo': instance.pinInfo,
    };

PinInfo _$PinInfoFromJson(Map<String, dynamic> json) => PinInfo(
      isAlertPinned: json['isAlertPinned'] as bool? ?? false,
      alertPinnedAt: json['alertPinnedAt'] as String?,
      isPinned: json['isPinned'] as bool? ?? false,
      pinnedAt: json['pinnedAt'] as String?,
      isTopPinned: json['isTopPinned'] as bool? ?? false,
      topPinnedAt: json['topPinnedAt'] as String?,
    );

Map<String, dynamic> _$PinInfoToJson(PinInfo instance) => <String, dynamic>{
      'isAlertPinned': instance.isAlertPinned,
      'alertPinnedAt': instance.alertPinnedAt,
      'isPinned': instance.isPinned,
      'pinnedAt': instance.pinnedAt,
      'isTopPinned': instance.isTopPinned,
      'topPinnedAt': instance.topPinnedAt,
    };
