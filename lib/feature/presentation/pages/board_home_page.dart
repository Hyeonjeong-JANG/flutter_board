import 'package:board/core/constants/size.dart';
import 'package:board/core/widgets/app_bar_with_back_button.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:board/feature/presentation/widgets/board_home/pinnedContentsDropdownList.dart';
import 'package:board/feature/presentation/widgets/board_home/board_list.dart';
import 'package:board/feature/presentation/widgets/floating_gradient_button_.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 더미 데이터 로드
Future<List<BoardHomeViewModel>> loadBoardContents() async {
  String jsonString =
      await rootBundle.loadString('assets/data/board_contents.json');
  final jsonData = json.decode(jsonString);
  return List<BoardHomeViewModel>.from(
      jsonData['boardContents'].map((x) => BoardHomeViewModel.fromJson(x)));
}

class BoardHomePage extends HookConsumerWidget {
  const BoardHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithBackButton(title: '점포 공지'),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.gapL),
              child: FutureBuilder<List<BoardHomeViewModel>>(
                future: loadBoardContents(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print('snapshot.hasData: ${snapshot.hasData}');
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      PinnedContentsDropdownList(),
                      SizedBox(height: AppSizes.spacingL),
                      BoardList(),
                    ],
                  );
                },
              ),
            ),
            FloatingGradientButton(
              title: '게시글 작성하기',
            ),
          ],
        ),
      ),
    );
  }
}
