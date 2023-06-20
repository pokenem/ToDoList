import 'package:flutter/material.dart';
import 'package:tdlist/navigate/routes.dart';
import 'package:tdlist/tile_data.dart';

import 'my_list.dart';
import 'network_manager.dart';
import 'theme/app_theme.dart';
import 'navigate/navigation.dart';

var networkManager = NetworkManager();

void main() {
  var data = networkManager.getData().then((list)
  {
    for(var item in list)
      {
          tasks.add(TileData.fromJson(item));
      }

    runApp(
      MaterialApp(
        theme: AppTheme.lightTheme,
        routes: RoutesBuilder.routes,
        navigatorKey: NavigationManager.instance.key,
        initialRoute: RouteNames.home,
      ),
    );
  });
}
