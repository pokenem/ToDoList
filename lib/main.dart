import 'package:flutter/material.dart';
import 'package:tdlist/navigate/routes.dart';
import 'package:tdlist/persistence/persistence_manager.dart';
import '../localization/s.dart';
import 'package:tdlist/data/tile_data.dart';

import 'data/my_list.dart';
import 'theme/app_theme.dart';
import 'navigate/navigation.dart';

var persistenceManager = PersistenceManager();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var list = await persistenceManager.getDataPersistence();
  for (var item in list) {
    tasks.add(TileData.fromJson(item));
  }

  runApp(
    MaterialApp(
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      theme: AppTheme.lightTheme,
      routes: RoutesBuilder.routes,
      navigatorKey: NavigationManager.instance.key,
      initialRoute: RouteNames.home,
    ),
  );
}
