import 'package:board/feature/presentation/pages/board_home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
void main() {
  runApp(
    ProviderScope(
      child: BoardHomePage(),
    ),
  );
}
