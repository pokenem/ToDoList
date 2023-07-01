import 'package:flutter/material.dart';

import '../../../localization/s.dart';
import '../../../navigate/navigation.dart';
import '../home_page.dart';
import '../todo_app.dart';

class NewTile extends StatelessWidget {
  final int index;
  final bool isVis;

  const NewTile({
    super.key,
    required this.index,
    required this.isVis,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: Theme.of(context).textTheme.labelSmall,
      shape: _whatTheFirst(context) == TodoApp.of(context).tasks.length
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8),
              ),
            ),
      tileColor: Theme.of(context).colorScheme.onPrimary,
      onTap: () {
        _onTapNewTile();
      },
      title: Padding(
        padding: const EdgeInsets.only(
          left: 36,
        ),
        child: Text(
          S.of(context).get('new'),
        ),
      ),
    );
  }

  void _onTapNewTile() {
    logger.i('Pressed tile New in MyHomePage');
    NavigationManager.instance.openAdd(index);
  }

  int _whatTheFirst(BuildContext context) {
    int k = 0;
    if (!isVis) {
      while (k < TodoApp.of(context).tasks.length && TodoApp.of(context).tasks[k].isDone!) {
        k++;
      }
    }
    return k;
  }
}
