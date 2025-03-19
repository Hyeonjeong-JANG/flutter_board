import 'package:board/core/widgets/app_bar_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BoardDetailPage extends HookConsumerWidget {
  const BoardDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWithBackButton(title: '게시글 상세'),
      body: Column(
        children: [
          Text('게시글 상세'),
        ],
      ),
    );
  }
}
