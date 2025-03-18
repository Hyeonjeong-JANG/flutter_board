import 'package:json_annotation/json_annotation.dart';

part 'render_board_home_viewmodel.g.dart';

@JsonSerializable()
class RenderBoardHomeViewModel {
  final String fullName;
  final String shortName;
  final String iconColor;
  final String content;
  final String date;
  final bool isManager;
  final bool isPinned;
  final int likeCount;
  final int commentCount;

  RenderBoardHomeViewModel({
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

  factory RenderBoardHomeViewModel.fromJson(Map<String, dynamic> json) =>
      _$RenderBoardHomeViewModelFromJson(json);
}
