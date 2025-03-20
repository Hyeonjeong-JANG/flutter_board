import 'package:json_annotation/json_annotation.dart';

part 'board_write_viewmodel.g.dart';

@JsonSerializable()
class BoardWriteViewModel {
  final String content;
  final List<String> images; 
  final String createdAt;
  final String? updatedAt;
  final bool isOwner;
  final bool isManager;

  BoardWriteViewModel({
    required this.content,
    this.images = const [],
    required this.createdAt,
    this.updatedAt,
    required this.isOwner,
    required this.isManager,
  });

  factory BoardWriteViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardWriteViewModelFromJson(json);
}
