import 'package:flutter/material.dart';
import 'package:tdlist/navigate/routes.dart';

import 'theme/app_theme.dart';
import 'navigate/navigation.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.lightTheme,
      routes: RoutesBuilder.routes,
      navigatorKey: NavigationManager.instance.key,
      initialRoute: RouteNames.home,
    ),
  );
}
