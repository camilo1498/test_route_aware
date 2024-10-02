import 'dart:async';

import 'package:flutter/material.dart';

/// The App Navigator
class AppNavigator {
  ///
  factory AppNavigator() {
    return _instance;
  }
  AppNavigator._internal();

  /// Disable the redirect due to security risk
  bool allowRedirect = true;
  static final AppNavigator _instance = AppNavigator._internal();

  /// The root navigator key or Parent navigator key
  GlobalKey<NavigatorState> appNavigatorStateKey =
      GlobalKey<NavigatorState>(debugLabel: 'Root Navigator Key');

  /// The root navigator key or Parent navigator key
  GlobalKey<NavigatorState> emitterNavigatorStateKey =
      GlobalKey<NavigatorState>(debugLabel: 'emitter Navigator Key');

  /// Has the list of Bottom Navigation Bar Navigator key items
  List<GlobalKey<NavigatorState>> navigatorStateKeys =
      List.generate(3, (index) => GlobalKey<NavigatorState>());

  /// The current navigator key, e.g: if im in home in the bnb this key
  /// represent the pointer to the home navigator key
  GlobalKey<NavigatorState>? currentNavigatorStateKey;

  ///Same as pushNamed
  Future<T?> pushNamed<T extends Object?>(
    BuildContext context, {
    required String page,
    dynamic arguments,
  }) {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(context).pushNamed(page, arguments: arguments);
  }

  ///Same as pushNamedAndRemoveUntil but
  ///removes all route stack and push the named route
  Future<T?> offAllNamed<T extends Object?>(
    BuildContext context, {
    required String newRouteName,
    bool Function(Route<dynamic>)? predicate,
    dynamic arguments,
    Map<String, String>? parameters,
  }) async {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(context).pushNamedAndRemoveUntil(
      newRouteName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  ///Same as pushNamedAndRemoveUntil but demans a predicate or until route
  Future<T?> offNamedUntil<T extends Object?>(
    BuildContext context, {
    required String page,
    required bool Function(Route<dynamic>) predicate,
    dynamic arguments,
  }) {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(context).pushNamedAndRemoveUntil(
      page,
      predicate,
      arguments: arguments,
    );
  }

  ///Same as popUntil but requires a predicate
  void until(
    BuildContext context, {
    required bool Function(Route<dynamic>) predicate,
  }) {
    Navigator.of(context).popUntil(predicate);
  }

  ///same as pushReplacementNamed
  Future<T?> offNamed<T extends Object?>(
    BuildContext context, {
    required String page,
    dynamic arguments,
  }) {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(context).pushReplacementNamed(
      page,
      arguments: arguments,
    );
  }

  ///
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    BuildContext context, {
    required String page,
    TO? result,
    Object? arguments,
  }) {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(context).popAndPushNamed<T, TO>(
      page,
      arguments: arguments,
      result: result,
    );
  }

  ///
  Future<T?> push<T extends Object?>(BuildContext context, Route<T> route) {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(context).push(route);
  }

  Future<T?> pushOver<T extends Object?>(Route<T> route) {
    if (!allowRedirect) return Future(() => null);
    return Navigator.of(emitterNavigatorStateKey.currentState!.context)
        .push(route);
  }

  void backOver() {
    return Navigator.of(emitterNavigatorStateKey.currentState!.context).pop();
  }

  /// Can to block the navigator of Application
  Future<T?> blockAndPush<T extends Object?>(
    BuildContext context,
    Route<T> route, {
    bool allowRedirect = true,
  }) {
    this.allowRedirect = allowRedirect;
    return Navigator.of(context).push(route);
  }

  /// close the last stack page or pages if times > 1

  void close(
    BuildContext context, {
    int times = 1,
  }) {
    final finalTimes = times < 1 ? 1 : times;
    for (var i = 0; i < finalTimes; i++) {
      Navigator.of(context).pop();
    }
  }

  ///same as pop
  void back<T extends Object?>(
    BuildContext context, {
    T? result,
  }) {
    Navigator.of(context).pop(result);
  }

  ///
  bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }

  /// Pops until named page, or root
  void popUntilNamed(
    BuildContext context, {
    String? routeUntil,
    bool Function(Route<dynamic>)? predicate,
  }) {
    if (!Navigator.of(context).canPop()) return;
    Navigator.of(context).popUntil(
      predicate ?? (route) => route.settings.name == (routeUntil ?? '/'),
    );
  }
}

///Singleton of AppNavigator
AppNavigator get appNavigator => AppNavigator._instance;
