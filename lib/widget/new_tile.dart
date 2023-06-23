import 'package:flutter/material.dart';

import '../data/my_list.dart';
import '../localization/s.dart';
import '../navigate/navigation.dart';
import '../page/home_page.dart';

class NewTile extends StatefulWidget {
  final int index;
  final bool isVis;
  final Function() updateParent;

  const NewTile({
    super.key,
    required this.index,
    required this.isVis,
    required this.updateParent,
  });

  @override
  NewTileState createState() => NewTileState();
}

class NewTileState extends State<NewTile> {
  dynamic currentIndex;

  onTapNewTile() {
    logger.i('Pressed tile ${S.of(context).get('new')} in MyHomePage');
    currentIndex = widget.index;
    NavigationManager.instance.openAdd(currentIndex).then((_) {
      widget.updateParent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: Theme.of(context).textTheme.labelSmall,
      shape: whatTheFirst() == tasks.length
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
        onTapNewTile();
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

  int whatTheFirst() {
    int k = 0;
    if (!widget.isVis) {
      while (k < tasks.length && tasks[k].isDone!) {
        k++;
      }
    }
    return k;
  }
}
