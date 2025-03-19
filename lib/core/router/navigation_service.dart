import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/loading_provider.dart';
import 'navigator_key.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  final service = NavigationService._instance;
  service._initializeWithRef(ref);
  return service;
});

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  static NavigationService get instance => _instance;

  NavigationService._internal();

  Ref? _ref;
  final List<String> _navigationHistory = [];
  WidgetRef? _widgetRef;

  bool _isNavigating = false;
  bool _isInitialized = false;

  /// Riverpod Ref로 서비스 초기화
  void _initializeWithRef(Ref ref) {
    if (!_isInitialized) {
      _ref = ref;
      _isInitialized = true;
    }
  }

  /// 위젯에서 서비스 초기화
  void initialize(WidgetRef ref) {
    if (!_isInitialized) {
      _isInitialized = true;
      _widgetRef = ref;
    }
  }

  /// 서비스 초기화 여부 확인
  bool get isInitialized =>
      _isInitialized && (_ref != null || _widgetRef != null);

  /// 화면 전환 시 로딩 상태 업데이트
  void _updateLoadingState(bool state) {
    if (!isInitialized) return;

    try {
      if (_ref != null) {
        _ref!.read(loadingProvider.notifier).state = state;
      } else if (_widgetRef != null) {
        _widgetRef!.read(loadingProvider.notifier).state = state;
      }
    } catch (e) {
      // 로딩 상태 업데이트 오류
    }
  }

  /// 새 화면으로 이동 (스택에 추가, 뒤로가기 가능)
  Future<void> navigateTo(String path,
      {Map<String, String> pathParameters = const {},
      Map<String, dynamic> extra = const {}}) async {
    if (_isNavigating) return;

    _isNavigating = true;

    if (pathParameters.isNotEmpty) {
      String pathWithParams = path;
      pathParameters.forEach((key, value) {
        pathWithParams = pathWithParams.replaceAll(':$key', value);
      });
      path = pathWithParams;
    }

    try {
      if (isInitialized) {
        _updateLoadingState(true);
      }

      final context = navigatorKey.currentContext;
      if (context != null) {
        try {
          final currentLocation = GoRouterState.of(context).uri.toString();
          if (!_navigationHistory.contains(currentLocation)) {
            _navigationHistory.add(currentLocation);
          }
        } catch (e) {
          // 현재 위치 가져오기 실패
        }

        context.push(path, extra: extra);
      }
    } catch (e) {
      // 네비게이션 오류
    } finally {
      _isNavigating = false;

      if (isInitialized) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _updateLoadingState(false);
        });
      }
    }
  }

  /// 이름으로 정의된 경로로 이동 (동적 매개변수가 있는 경로에 유용)
  Future<void> navigateToNamed(String name,
      {Map<String, String> pathParameters = const {},
      Map<String, dynamic> extra = const {}}) async {
    if (_isNavigating) return;

    _isNavigating = true;

    try {
      if (isInitialized) {
        _updateLoadingState(true);
      }

      final context = navigatorKey.currentContext;
      if (context != null) {
        try {
          final currentLocation = GoRouterState.of(context).uri.toString();
          if (!_navigationHistory.contains(currentLocation)) {
            _navigationHistory.add(currentLocation);
          }
          context.pushNamed(name, pathParameters: pathParameters, extra: extra);
        } catch (e) {
          // 네비게이션 오류
        }
      }
    } catch (e) {
      // 네비게이션 오류
    } finally {
      _isNavigating = false;

      if (isInitialized) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _updateLoadingState(false);
        });
      }
    }
  }

  /// 현재 화면을 새 화면으로 교체 (뒤로가기 시 이전 화면으로 돌아갈 수 없음)
  Future<void> replaceTo(String path,
      {Map<String, String> pathParameters = const {},
      Map<String, dynamic> extra = const {}}) async {
    if (_isNavigating) return;

    _isNavigating = true;

    if (pathParameters.isNotEmpty) {
      String pathWithParams = path;
      pathParameters.forEach((key, value) {
        pathWithParams = pathWithParams.replaceAll(':$key', value);
      });
      path = pathWithParams;
    }

    try {
      if (isInitialized) {
        _updateLoadingState(true);
      }

      final context = navigatorKey.currentContext;
      if (context != null) {
        context.replace(path, extra: extra);
      }
    } catch (e) {
      // 리플레이스 오류
    } finally {
      _isNavigating = false;

      if (isInitialized) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _updateLoadingState(false);
        });
      }
    }
  }

  /// 이름으로 정의된 경로로 현재 화면 교체 (동적 매개변수가 있는 경로에 유용)
  Future<void> replaceToNamed(String name,
      {Map<String, String> pathParameters = const {},
      Map<String, dynamic> extra = const {}}) async {
    if (_isNavigating) return;

    _isNavigating = true;

    try {
      if (isInitialized) {
        _updateLoadingState(true);
      }

      final context = navigatorKey.currentContext;
      if (context != null) {
        context.replaceNamed(name,
            pathParameters: pathParameters, extra: extra);
      }
    } catch (e) {
      // 리플레이스 오류
    } finally {
      _isNavigating = false;

      if (isInitialized) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _updateLoadingState(false);
        });
      }
    }
  }

  /// 안드로이드 기기의 뒤로가기 버튼 처리 (WillPopScope의 onWillPop에서 사용)
  Future<bool> handleBackButton() async {
    final context = navigatorKey.currentContext;
    if (context == null) return true;

    try {
      final canPopInRouter = GoRouter.of(context).canPop();

      if (canPopInRouter) {
        goBack();
        return false;
      } else {
        if (_navigationHistory.isNotEmpty) {
          final lastPath = _navigationHistory.removeLast();
          await pushAndRemoveUntil(lastPath);
          return false;
        }
      }
      return true;
    } catch (e) {
      return true;
    }
  }

  /// 이전 화면으로 돌아가기 (뒤로가기 버튼이나 취소 버튼에서 사용)
  void goBack() {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    try {
      bool canPopRouter = false;
      try {
        canPopRouter = GoRouter.of(context).canPop();
      } catch (e) {
        // GoRouter.canPop() 호출 오류
      }

      bool canPopNavigator = false;
      try {
        canPopNavigator = Navigator.of(context).canPop();
      } catch (e) {
        // Navigator.canPop() 호출 오류
      }

      if (canPopRouter) {
        try {
          context.pop();
        } catch (e) {
          if (canPopNavigator) {
            Navigator.of(context).pop();
          }
        }
      } else if (canPopNavigator) {
        Navigator.of(context).pop();
      } else if (_navigationHistory.isNotEmpty) {
        final lastPath = _navigationHistory.removeLast();
        pushAndRemoveUntil(lastPath);
      } else {
        pushAndRemoveUntil('/home');
      }
    } catch (e) {
      // goBack 실행 오류
    }
  }

  /// 모든 화면 제거하고 새 화면으로 이동 (로그아웃, 프로세스 완료 등에서 사용)
  Future<void> pushAndRemoveUntil(String path,
      {Map<String, dynamic> extra = const {}}) async {
    if (_isNavigating) return;

    _isNavigating = true;

    try {
      if (isInitialized) {
        _updateLoadingState(true);
      }

      final context = navigatorKey.currentContext;
      if (context != null) {
        if (path == '/home') {
          await Future.delayed(const Duration(milliseconds: 50));
        }

        _navigationHistory.clear();
        context.go(path, extra: extra);
      }
    } catch (e) {
      // pushAndRemoveUntil 오류
    } finally {
      _isNavigating = false;

      if (isInitialized) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _updateLoadingState(false);
        });
      }
    }
  }

  /// 특정 경로까지 돌아간 후 새 화면으로 이동 (복잡한 네비게이션 흐름에서 사용)
  Future<void> popUntilAndPush(String untilPath, String pushPath,
      {Map<String, dynamic> extra = const {}}) async {
    if (_isNavigating) return;

    _isNavigating = true;

    try {
      if (isInitialized) {
        _updateLoadingState(true);
      }

      final context = navigatorKey.currentContext;
      if (context != null) {
        _navigationHistory.clear();

        try {
          final currentLocation = GoRouterState.of(context).uri.toString();
          if (currentLocation != untilPath) {
            context.go(untilPath);
          }
        } catch (e) {
          context.go(untilPath);
        }

        await Future.delayed(const Duration(milliseconds: 100));

        _navigationHistory.add(untilPath);
        context.push(pushPath, extra: extra);
      }
    } catch (e) {
      // popUntilAndPush 오류
    } finally {
      _isNavigating = false;

      if (isInitialized) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _updateLoadingState(false);
        });
      }
    }
  }
}
