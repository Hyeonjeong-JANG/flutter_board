import 'package:board/feature/board/domain/entities/pin_info_entity.dart';
import 'package:board/feature/board/domain/entities/reply_entity.dart';

class ReplyModel {
  final String replyId;
  final String userId;
  final String userName;
  final String shortName;
  final String iconColor;
  final String content;
  final String createdAt;
  final int likeCounts;
  final Set<String>? likeUserIds;
  ReplyModel({
    required this.replyId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.createdAt,
    required this.likeCounts,
    this.likeUserIds,
  });
  factory ReplyModel.fromJson(Map<String, dynamic> json) {
    return ReplyModel(
      replyId: json['replyId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      likeCounts: json['likeCounts'] as int,
      likeUserIds: (json['likeUserIds'] as List<dynamic>?)
        ?.map((e) => e.toString())
        .toSet() ?? {},
    );
  } 

  Reply toEntity() {
    return Reply(
      id: replyId,
      userId: userId,
      userName: userName,
      shortName: shortName,
      iconColor: iconColor,
      content: content,
      createdAt: createdAt,
      likeCounts: likeCounts,
      likeUserIds: likeUserIds,
    );
  }
}
