import 'package:flutter/material.dart';
import 'package:tdlist/page/add_page.dart';

import '../page/home_page.dart';

abstract class RouteNames {
  const RouteNames._();

  static const initialRoute = home;

  static const home = '/';
  static const add = '/add';
}

abstract class RoutesBuilder {
  const RoutesBuilder._();

  static final routes = {
    RouteNames.home: (_) => const MyHomePage(),
    RouteNames.add: (BuildContext context) {
      final arguments = ModalRoute.of(context)?.settings.arguments;

      final index = arguments as int?;
      return AddPage(index: index!);
    },
  };

  onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
          settings: settings,
        );

      case RouteNames.add:
        final arguments = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => AddPage(
            index: arguments as int,
          ),
          settings: settings,
        );
    }
  }
}
