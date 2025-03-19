import 'package:board/feature/presentation/pages/board_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:board/feature/presentation/pages/board_home_page.dart';
import 'package:board/feature/presentation/pages/board_write_page.dart';
import '../providers/loading_provider.dart';
import 'navigator_key.dart';

final routerProvider = Provider.family<GoRouter, String>((ref, userId) {
  // ProviderContainer를 RouterObserver에 전달
  final container = ProviderContainer();

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/boards',
    observers: [RouterObserver(container)],
    routes: [
      // 게시판 페이지
      GoRoute(
        path: '/boards',
        builder: (context, state) => const BoardHomePage(),
        routes: [
          // 게시글 작성 페이지
          GoRoute(
            path: 'write',
            builder: (context, state) => const BoardWritePage(),
          ),
          // 게시글 상세 페이지
          GoRoute(
            path: 'board/:id',
            builder: (context, state) => const BoardDetailPage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );
});

class RouterObserver extends NavigatorObserver {
  final ProviderContainer container;

  RouterObserver(this.container);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    if (previousRoute == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      container.read(loadingProvider.notifier).state = true;

      Future.delayed(const Duration(milliseconds: 300), () {
        container.read(loadingProvider.notifier).state = false;
      });
    });
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      container.read(loadingProvider.notifier).state = true;

      Future.delayed(const Duration(milliseconds: 300), () {
        container.read(loadingProvider.notifier).state = false;
      });
    });
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      container.read(loadingProvider.notifier).state = true;

      Future.delayed(const Duration(milliseconds: 300), () {
        container.read(loadingProvider.notifier).state = false;
      });
    });
  }
}

// 라우터 사용법
// NavigationService.instance.navigateTo('/detail/123'); 경로로 이동
//context.push('/path') → NavigationService.instance.navigateTo('/path')
// context.go('/path') → NavigationService.instance.pushAndRemoveUntil('/path')
// context.pushNamed('routeName') → NavigationService.instance.navigateToNamed('routeName')
// context.pop() → NavigationService.instance.goBack()
// context.replace('/path') → NavigationService.instance.replaceTo('/path')
// context.replaceNamed('routeName') → NavigationService.instance.replaceToNamed('routeName')
