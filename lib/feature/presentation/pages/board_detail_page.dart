import 'package:board/core/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailPage extends HookConsumerWidget {
  const BoardDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '게시글 상세',
      child: Column(
        children: [
          Text('게시글 상세'),
        ],
      ),
    );
  }
}
