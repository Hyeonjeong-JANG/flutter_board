import 'package:json_annotation/json_annotation.dart';

part 'board_home_viewmodel.g.dart';

@JsonSerializable()
class BoardHomeViewModel {
  final String fullName;
  final String shortName;
  final String iconColor;
  final String content;
  final String date;
  final bool isManager;
  final bool isPinned;
  final int likeCount;
  final int commentCount;

  BoardHomeViewModel({
    required this.fullName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.date,
    required this.isManager,
    required this.isPinned,
    required this.likeCount,
    required this.commentCount,
  });

  factory BoardHomeViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardHomeViewModelFromJson(json);
}
