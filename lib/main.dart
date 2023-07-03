import 'package:flutter/material.dart';
import 'package:tdlist/navigate/routes.dart';

import 'package:tdlist/page/presentation/todo_bloc.dart';
import '../localization/s.dart';
import 'theme/app_theme.dart';
import 'navigate/navigation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider<TodoBloc>(
      create: (context) => TodoBloc()..add(TodoLoadEvent()),
      child:  MaterialApp(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          theme: AppTheme.lightTheme,
          routes: RoutesBuilder.routes,
          navigatorKey: NavigationManager.instance.key,
          initialRoute: RouteNames.home,
        ),
      ),
    );
}
