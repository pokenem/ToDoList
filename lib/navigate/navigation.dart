import 'package:flutter/material.dart';

import 'routes.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  Future<dynamic> openAdd(int? index) {
    return _navigator.pushNamed(RouteNames.add, arguments: index);
  }

  void pop() {
    _navigator.pop();
  }
}
