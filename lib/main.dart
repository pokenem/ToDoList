import 'package:flutter/material.dart';
import 'package:tdlist/page/presentation/todo_bloc.dart';
import '../localization/s.dart';
import 'navigate/route_information_parser.dart';
import 'navigate/router_delegate.dart';
import 'theme/app_theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _routerDelegate = MyRouterDelegate();
  final _routeInformationParser = MyRouteInformationParser();
  runApp(
    BlocProvider<TodoBloc>(
      create: (context) => TodoBloc()..add(TodoLoadEvent()),
      child:  MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          theme: AppTheme.lightTheme,
          routerDelegate: _routerDelegate,
          routeInformationParser: _routeInformationParser,
        ),
      ),
    );
}


