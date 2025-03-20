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
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
      replyCounts: (json['replyCounts'] as num).toInt(),
      isAlertPinned: json['isAlertPinned'] as bool,
      isPinned: json['isPinned'] as bool,
      isTopPinned: json['isTopPinned'] as bool,
      replies: Replies.fromJson(json['replies'] as Map<String, dynamic>),
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
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
      'likeCounts': instance.likeCounts,
      'replyCounts': instance.replyCounts,
      'content': instance.content,
      'isAlertPinned': instance.isAlertPinned,
      'isPinned': instance.isPinned,
      'isTopPinned': instance.isTopPinned,
      'replies': instance.replies,
    };

Replies _$RepliesFromJson(Map<String, dynamic> json) => Replies(
      replyId: json['replyId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      createdAt: json['createdAt'] as String,
      content: json['content'] as String,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: (json['likeCounts'] as num).toInt(),
    );

Map<String, dynamic> _$RepliesToJson(Replies instance) => <String, dynamic>{
      'replyId': instance.replyId,
      'userId': instance.userId,
      'userName': instance.userName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'createdAt': instance.createdAt,
      'content': instance.content,
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
      'likeCounts': instance.likeCounts,
    };
