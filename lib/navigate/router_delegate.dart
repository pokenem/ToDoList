import 'package:flutter/material.dart';

import '../page/data/di.dart';
import '../page/presentation/add_page.dart';
import '../page/presentation/home_page.dart';
import '../page/presentation/unknown_screen.dart';
import 'navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  NavigationState? state;

  @override
  NavigationState get currentConfiguration {
    return state ?? NavigationState.root();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: MyHomePage(
            onItemTap: _showItemDetails,
          ),
        ),
        if (state?.isAddPage == true)
          MaterialPage(
            child: AddPage(
              backToHome: _backToHome,
              index: state?.selectedItemIndex,
              isNew: state!.isNew!,
            ),
          ),
        if (state?.isUnknown == true)
          const MaterialPage(
            child: UnknownScreen(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        Locator.analytics.logEvent(
          name: 'pop_page_event',
        );
        state = NavigationState.root();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    Locator.analytics.logEvent(name: 'new_route_path_event', parameters: {
      'home': state!.isRoot.toString(),
      'add_page': state!.isAddPage.toString(),
    });
    notifyListeners();
  }

  void _showItemDetails(int index, bool isNew) {
    state = NavigationState.item(index, isNew);
    notifyListeners();
  }

  void _backToHome() {
    state = NavigationState.root();
    notifyListeners();
  }
}
