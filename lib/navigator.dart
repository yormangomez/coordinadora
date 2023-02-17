import 'dart:io' show File, Platform;

import 'package:coordinadora_test/features/home/presentation/pages/home_pages.dart';
import 'package:coordinadora_test/features/home/presentation/widget/infor_tracking.dart';
import 'package:coordinadora_test/features/onbording/presentation/pages/onbording_page.dart';
import 'package:coordinadora_test/features/starting/presentation/pages/starting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names
enum Routes {
  HOME,
  INFORTRACKING,
}

class _Paths {
  static const String init = '/';
  static const String home = '/home';
  static const String info = '/inforTracking';

  static const Map<Routes, String> _pathMap = {
    Routes.HOME: _Paths.home,
    Routes.INFORTRACKING: _Paths.info,
  };

  static String? of(Routes route) => _pathMap[route];
}

String? _currentRoute;

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static String? getCurrentRoute() {
    return _currentRoute;
  }

  static String? getNameByRoute(Routes route) {
    return _Paths.of(route);
  }

  static Route onGenerateRoute(RouteSettings settings) {
    Route pageRoute({Widget page = const Starting()}) {
      return Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page);
    }

    _currentRoute = settings.name;

    switch (settings.name) {
      case _Paths.init:
        return pageRoute(page: const OnbordingPage());
      case _Paths.home:
        return pageRoute(page: const HomePages());
      case _Paths.info:
        return pageRoute(page: const InforTracking());
      default:
        return pageRoute(page: const Starting());
    }
  }

  static Future push<T>(Routes route, [T? arguments]) =>
      state.pushNamed(_Paths.of(route)!, arguments: arguments);

  static Future pushNamedAndRemoveUntil<T>(Routes route, [T? arguments]) =>
      state.pushNamedAndRemoveUntil(
        _Paths.of(route)!,
        (Route routes) => false,
        arguments: arguments,
      );

  static Future replaceWith<T>(Routes route, [T? arguments]) =>
      state.pushReplacementNamed(_Paths.of(route)!, arguments: arguments);

  static void pop() => state.pop();

  static void popWithResult<T>(T res) => state.pop(res);

  static NavigatorState get state => navigatorKey.currentState!;
}
