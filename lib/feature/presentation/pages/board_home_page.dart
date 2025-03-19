import 'package:board/core/constants/size.dart';
import 'package:board/core/widgets/app_bar_with_back_button.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_provider.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:board/feature/presentation/widgets/board_home/pinnedContentsDropdownList.dart';
import 'package:board/feature/presentation/widgets/board_home/board_list.dart';
import 'package:board/feature/presentation/widgets/floating_gradient_button_.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// // 더미 데이터 로드
// Future<List<BoardHomeViewModel>> loadBoardContents() async {
//   String jsonString =
//       await rootBundle.loadString('assets/data/board_contents.json');
//   final jsonData = json.decode(jsonString);
//   return List<BoardHomeViewModel>.from(
//       jsonData['boardContents'].map((x) => BoardHomeViewModel.fromJson(x)));
// }

class BoardHomePage extends HookConsumerWidget {
  const BoardHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardNotifier = ref.read(boardHomeProvider.notifier);
    final boardContents = ref.watch(boardHomeProvider);

    useEffect(() {
      boardNotifier.loadBoardContents();

      return null;
    }, []);
    return Scaffold(
      appBar: AppBarWithBackButton(title: '점포 공지'),
        body: Stack(
          children: [
            boardContents.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.gapL),
                    child: Column(
                      children: [
                        if (boardContents.isNotEmpty)
                          PinnedContentsDropdownList(),
                        if (boardContents.isNotEmpty)
                          SizedBox(height: AppSizes.spacingL),
                        if (boardContents.isNotEmpty) BoardList(),
                      ],
                    ),
                    // FutureBuilder<List<BoardHomeViewModel>>(
                    //   future: boardNotifier.loadBoardContents(),
                    //   builder: (context, snapshot) {
                    //     if (!snapshot.hasData) {
                    //       print('snapshot.hasData: ${snapshot.hasData}');
                    //       return Center(child: CircularProgressIndicator());
                    //     }
                    //     return Column(
                    //       children: [
                    //         PinnedContentsDropdownList(),
                    //         SizedBox(height: AppSizes.spacingL),
                    //         BoardList(),
                    //       ],
                    //     );
                    //   },
                    // ),
                  ),
            FloatingGradientButton(
              title: '게시글 작성하기',
          ),
        ],
      ),
    );
  }
}
