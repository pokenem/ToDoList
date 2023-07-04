import 'package:flutter/material.dart';

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

        state = NavigationState.root();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    notifyListeners();
  }

  void _showItemDetails(int index) {
    state = NavigationState.item(index);
    notifyListeners();
  }

  void _backToHome(){
    state = NavigationState.root();
    notifyListeners();
  }

}