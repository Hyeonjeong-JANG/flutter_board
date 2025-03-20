// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardEntity _$BoardEntityFromJson(Map<String, dynamic> json) => BoardEntity(
      id: json['id'] as String,
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
      pinInfo: json['pinInfo'] == null
          ? null
          : PinInfo.fromJson(json['pinInfo'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BoardEntityToJson(BoardEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'replies': instance.replies,
    };

PinInfo _$PinInfoFromJson(Map<String, dynamic> json) => PinInfo(
      isAlertPinned: json['isAlertPinned'] as bool,
      alertPinnedAt: json['alertPinnedAt'] as String?,
      isPinned: json['isPinned'] as bool,
      pinnedAt: json['pinnedAt'] as String?,
      isTopPinned: json['isTopPinned'] as bool,
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

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      createdAt: json['createdAt'] as String,
      content: json['content'] as String,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
      likeUserIds: (json['likeUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'createdAt': instance.createdAt,
      'content': instance.content,
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
      'likeCounts': instance.likeCounts,
      'likeUserIds': instance.likeUserIds?.toList(),
    };
