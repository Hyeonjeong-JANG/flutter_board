import 'package:board/core/constants/size.dart';
import 'package:board/core/layouts/default_layout.dart';
import 'package:board/core/widgets/custom_app_bar.dart';
import 'package:board/feature/presentation/viewmodel/board_home/board_home_provider.dart';
import 'package:board/feature/presentation/widgets/board_home/alert_contents_dropdown_list.dart';
import 'package:board/feature/presentation/widgets/board_home/board_list.dart';
import 'package:board/feature/presentation/widgets/floating_gradient_button_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    return DefaultLayout(
      title: '점포 공지',
      showBackButton: false,
      child: Stack(
        children: [
          boardContents.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    AlertContentsDropdownList(),
                    SizedBox(height: AppSizes.spacingL),
                    BoardList(),
                  ],
                ),
          FloatingGradientButton(
            title: '공지 작성하기',
            onTap: () {
              context.go('/boards/write', extra: {'isEditing': false});
            },
          ),
        ],
      ),
    );
  }
}
