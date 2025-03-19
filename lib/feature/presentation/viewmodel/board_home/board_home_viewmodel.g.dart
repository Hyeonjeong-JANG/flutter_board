// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_home_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardHomeViewModel _$BoardHomeViewModelFromJson(Map<String, dynamic> json) =>
    BoardHomeViewModel(
      fullName: json['fullName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      content: json['content'] as String,
      date: json['date'] as String,
      isManager: json['isManager'] as bool,
      isPinned: json['isPinned'] as bool,
      likeCount: (json['likeCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
    );

Map<String, dynamic> _$BoardHomeViewModelToJson(BoardHomeViewModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'shortName': instance.shortName,
      'iconColor': instance.iconColor,
      'content': instance.content,
      'date': instance.date,
      'isManager': instance.isManager,
      'isPinned': instance.isPinned,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
    };
