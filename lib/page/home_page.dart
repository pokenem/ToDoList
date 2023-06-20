import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../widget/my_sliverBar.dart';
import '../widget/my_tile.dart';
import '../my_list.dart';
import '../navigate/navigation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVis = false;
  double shift = 0;
  int currentIndex = 0;
  double pixels = 0;

  updateIsVis(bool newValue) {
    setState(() {
      isVis = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColor.clBlue,
        child: const Icon(
          Icons.add,
          color: AppColor.clWhite,
        ),
        onPressed: () {
          logger.i('Pressed FloatingActionButton in MyHomePage');
          NavigationManager.instance.openAdd(tasks.length).then((_) {
            setState(() {});
          });
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          MySliverAppBar( isVis: isVis, updateParent: (bool newValue) => updateIsVis(newValue)),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 0,
              bottom: 32,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (!isVis) {
                    if (index != tasks.length) {
                      if (tasks[index].isDone!) {
                        return const SizedBox.shrink();
                      } else {
                        return CustomTile(
                          index: index,
                          isVis: isVis,
                          updateParent: () {
                            setState(() {});
                          },
                        );
                      }
                    } else {
                      return newTile(index);
                    }
                  } else if (index != tasks.length) {
                    return CustomTile(
                      index: index,
                      isVis: isVis,
                      updateParent: () {
                        setState(() {});
                      },
                    );
                  } else {
                    return newTile(index);
                  }
                },
                childCount: tasks.length + 1, //isVis ? tasks.length + 1 : tasks.length - kol + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int whatTheFirst() {
    int k = 0;
    if (!isVis) {
      while (k < tasks.length && tasks[k].isDone!) {
        k++;
      }
    }
    return k;
  }

  Widget newTile(index) {
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
        logger.i('Pressed tile Новое in MyHomePage');
        currentIndex = index;
        NavigationManager.instance.openAdd(currentIndex).then((_) {
          setState(() {});
        });
      },
      title: const Padding(
        padding: EdgeInsets.only(
          left: 36,
        ),
        child: Text(
          'Новое',
        ),
      ),
    );
  }
}
