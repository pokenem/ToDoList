import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:tdlist/page/data/di.dart';
import 'package:tdlist/page/presentation/home_page.dart';
import 'package:tdlist/page/presentation/todo_bloc.dart';
import '../localization/s.dart';
import 'navigate/route_information_parser.dart';
import 'navigate/router_delegate.dart';
import 'theme/app_theme.dart';
import 'theme/app_color.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locator.init();
  final routerDelegate = MyRouterDelegate();
  final routeInformationParser = MyRouteInformationParser();
  if (const bool.fromEnvironment('DEV')) {
    logger.i('DEV flavor');
    FlavorConfig(
      name: 'DEV',
      color: AppColor.clRed,
      location: BannerLocation.topEnd,
    );
  }
  runApp(
    BlocProvider<TodoBloc>(
      create: (context) => TodoBloc()..add(TodoLoadEvent()),
      child: FlavorBanner(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerDelegate: routerDelegate,
          routeInformationParser: routeInformationParser,
        ),
      ),
    ),
  );
}
