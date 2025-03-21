// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_detail_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardDetailViewModel _$BoardDetailViewModelFromJson(
        Map<String, dynamic> json) =>
    BoardDetailViewModel(
      boardId: json['boardId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
      replyCounts: (json['replyCounts'] as num).toInt(),
      pinInfo: PinInfo.fromJson(json['pinInfo'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BoardDetailViewModelToJson(
        BoardDetailViewModel instance) =>
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
      'replyCounts': instance.replyCounts,
      'content': instance.content,
      'pinInfo': instance.pinInfo,
      'replies': instance.replies,
    };

PinInfo _$PinInfoFromJson(Map<String, dynamic> json) => PinInfo(
      isAlertPinned: json['isAlertPinned'] as bool,
      isPinned: json['isPinned'] as bool,
      isTopPinned: json['isTopPinned'] as bool,
    );

Map<String, dynamic> _$PinInfoToJson(PinInfo instance) => <String, dynamic>{
      'isAlertPinned': instance.isAlertPinned,
      'isPinned': instance.isPinned,
      'isTopPinned': instance.isTopPinned,
    };

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      replyId: json['replyId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      createdAt: json['createdAt'] as String,
      content: json['content'] as String,
      likeCounts: (json['likeCounts'] as num).toInt(),
      likeUserIds: (json['likeUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'replyId': instance.replyId,
      'userId': instance.userId,
      'userName': instance.userName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'createdAt': instance.createdAt,
      'content': instance.content,
      'likeCounts': instance.likeCounts,
      'likeUserIds': instance.likeUserIds,
    };
