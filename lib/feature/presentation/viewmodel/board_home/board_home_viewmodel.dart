import 'package:board/feature/domain/entities/board_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_home_viewmodel.g.dart';

@JsonSerializable()
class BoardHomeViewModel {
  final BoardEntity boardEntity;

  BoardHomeViewModel({
    required this.boardEntity,
  });

  factory BoardHomeViewModel.fromJson(Map<String, dynamic> json) =>
      _$BoardHomeViewModelFromJson(json);
}
