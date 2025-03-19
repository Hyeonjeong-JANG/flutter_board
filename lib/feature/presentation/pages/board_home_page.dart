import 'package:board/feature/presentation/viewmodel/board_home/board_home_viewmodel.dart';
import 'package:board/feature/presentation/widgets/board_home/alert_over_view.dart';
import 'package:board/feature/presentation/widgets/board_home/board_list.dart';
import 'package:board/feature/presentation/widgets/floating_gradient_button_.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// 더미 데이터 로드
Future<List<BoardHomeViewModel>> loadBoardContents() async {
  String jsonString =
      await rootBundle.loadString('assets/data/board_contents.json');
  final jsonData = json.decode(jsonString);
  return List<BoardHomeViewModel>.from(
      jsonData['boardContents'].map((x) => BoardHomeViewModel.fromJson(x)));
}

class BoardHomePage extends StatefulWidget {
  const BoardHomePage({super.key});

  @override
  State<BoardHomePage> createState() => _BoardHomePageState();
}

class _BoardHomePageState extends State<BoardHomePage> {
  late Future<List<BoardHomeViewModel>> boardContents;

  @override
  void initState() {
    super.initState();
    boardContents = loadBoardContents();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text('점포 공지', textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FutureBuilder<List<BoardHomeViewModel>>(
                future: boardContents,
                builder: (context,
                    AsyncSnapshot<List<BoardHomeViewModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      // 알림 요약
                      AlertOverView(),

                      SizedBox(height: 20.0),
                      // 게시물
                      BoardList(contents: snapshot.data!),
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
