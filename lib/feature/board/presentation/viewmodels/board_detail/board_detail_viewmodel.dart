import 'package:board/feature/board/data/models/reply_model.dart';
import 'package:board/feature/board/domain/entities/pin_info_entity.dart';
import 'package:board/feature/board/domain/entities/reply_entity.dart';
import 'package:board/feature/board/presentation/viewmodels/board_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailViewModel {
  final String boardId;
  final String userId;
  final String userName;
  final String shortName;
  final String iconColor;
  final String createdAt;
  final String? updatedAt;
  final bool isOwner;
  final bool isManager;
  final int likeCounts;
  final int replyCounts;
  final String content;
  final List<String> images;
  final PinInfo pinInfo;
  final List<Reply>? replies;

  BoardDetailViewModel({
    required this.boardId,
    required this.userId,
    required this.userName,
    required this.shortName,
    required this.iconColor,
    required this.content,
    required this.images,
    required this.createdAt,
    this.updatedAt,
    required this.isOwner,
    required this.isManager,
    required this.likeCounts,
    required this.replyCounts,
    required this.pinInfo,
    this.replies,
  });

  factory BoardDetailViewModel.init() {
    return BoardDetailViewModel(
      boardId: '',
      userId: '',
      userName: '',
      shortName: '',
      iconColor: '',
      content: '',
      images: [],
      createdAt: '',
      isOwner: false,
      isManager: false,
      likeCounts: 0,
      replyCounts: 0,
      pinInfo: PinInfo(
        isAlertPinned: false,
        alertPinnedAt: null,
        isPinned: false,
        pinnedAt: null,
        isTopPinned: false,
        topPinnedAt: null,
      ),
      replies: [],
    );
  }
  factory BoardDetailViewModel.fromJson(Map<String, dynamic> json) {
    return BoardDetailViewModel(
      boardId: json['boardId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      shortName: json['shortName'] as String,
      iconColor: json['iconColor'] as String,
      content: json['content'] as String,
      images: List<String>.from(json['images'] ?? []),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      isOwner: json['isOwner'] as bool,
      isManager: json['isManager'] as bool,
      likeCounts: json['likeCounts'] as int,
      replyCounts: json['replyCounts'] as int,
      pinInfo: PinInfo(
        isAlertPinned: json['pinInfo']['isAlertPinned'] as bool,
        alertPinnedAt: json['pinInfo']['alertPinnedAt'] as String?,
        isPinned: json['pinInfo']['isPinned'] as bool,
        pinnedAt: json['pinInfo']['pinnedAt'] as String?,
        isTopPinned: json['pinInfo']['isTopPinned'] as bool,
        topPinnedAt: json['pinInfo']['topPinnedAt'] as String?,
      ),
      replies: json['replies'] != null
          ? List<Reply>.from(
              json['replies'].map((x) => ReplyModel.fromJson(x).toEntity()))
          : null,
    );
  }

  BoardDetailViewModel copyWith({
    String? boardId,
    String? userId,
    String? userName,
    String? shortName,
    String? iconColor,
    String? content,
    String? createdAt,
    String? updatedAt,
    bool? isOwner,
    bool? isManager,
    int? likeCounts,
    int? replyCounts,
    PinInfo? pinInfo,
    List<Reply>? replies,
  }) {
    return BoardDetailViewModel(
      boardId: boardId ?? this.boardId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      shortName: shortName ?? this.shortName,
      iconColor: iconColor ?? this.iconColor,
      content: content ?? this.content,
      images: images ?? images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isOwner: isOwner ?? this.isOwner,
      isManager: isManager ?? this.isManager,
      likeCounts: likeCounts ?? this.likeCounts,
      replyCounts: replyCounts ?? this.replyCounts,
      pinInfo: pinInfo ?? this.pinInfo,
      replies: replies ?? this.replies,
    );
  }
}
