// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_write_viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardWriteViewModel _$BoardWriteViewModelFromJson(Map<String, dynamic> json) =>
    BoardWriteViewModel(
      content: json['content'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
    );

Map<String, dynamic> _$BoardWriteViewModelToJson(
        BoardWriteViewModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'images': instance.images,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isOwner': instance.isOwner,
      'isManager': instance.isManager,
    };
