import 'package:flutter/material.dart';

import '../page/domain/models/routes.dart';
import 'navigation_state.dart';

class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final location = routeInformation.location;
    if (location == null) {
      return NavigationState.unknown();
    }

    final uri = Uri.parse(location);

    if (uri.pathSegments.isEmpty) {
      return NavigationState.root();
    }

    if (uri.pathSegments.length == 2) {
      final itemId = uri.pathSegments[1];
      if (itemId == 'addNew') {
        return NavigationState.item(-1, true);
      } else {
        int? index = int.tryParse(itemId);
        if (index == null) {
          return NavigationState.unknown();
        } else {
          return NavigationState.item(index, false);
        }
      }
    }

    if (uri.pathSegments.length == 1) {
      return NavigationState.root();
    }

    return NavigationState.root();
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration.isAddPage) {
      return RouteInformation(
          location: '/${Routes.item}/${configuration.selectedItemIndex}');
    }

    if (configuration.isUnknown) {
      return null;
    }

    return const RouteInformation(location: '/');
  }
}
