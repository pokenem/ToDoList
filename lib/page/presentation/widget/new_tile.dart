import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../localization/s.dart';
import '../home_page.dart';
import '../todo_bloc.dart';

class NewTile extends StatelessWidget {
  final int index;
  final bool isVis;
  final void Function(int index, bool isNew) onItemTap;

  const NewTile({
    super.key,
    required this.index,
    required this.isVis,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: Theme.of(context).textTheme.labelSmall,
      shape: _whatTheFirst(context) == context.read<TodoBloc>().state.length
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
    onItemTap(index, true);
    //NavigationManager.instance.openAdd(index);
  }

  int _whatTheFirst(BuildContext context) {
    int k = 0;
    if (!isVis) {
      while (k < context.read<TodoBloc>().state.length && context.read<TodoBloc>().state[k].isDone!) {
        k++;
      }
    }
    return k;
  }
}
