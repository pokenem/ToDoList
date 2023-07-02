import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdlist/page/presentation/todo_app.dart';
import 'package:tdlist/page/presentation/todo_bloc.dart';

import '../../theme/app_color.dart';
import '../data/repository.dart';
import '../data/tile_data.dart';
import 'widget/my_sliverBar.dart';
import 'widget/my_tile.dart';
import '../data/my_list.dart';
import '../../navigate/navigation.dart';
import 'package:logger/logger.dart';

import 'widget/new_tile.dart';

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

  onPressedFloatingActionButton() {
    logger.i('Pressed FloatingActionButton in MyHomePage');
    NavigationManager.instance.openAdd(context.read<TodoBloc>().state.length).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, List<TileData>>(builder: (context, tasks) {

      return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColor.clBlue,
          child: const Icon(
            Icons.add,
            color: AppColor.clWhite,
          ),
          onPressed: () {
            onPressedFloatingActionButton();
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: CustomScrollView(
          slivers: [
            MySliverAppBar(isVis: isVis, updateParent: (bool newValue) => updateIsVis(newValue)),
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
                        return NewTile(
                          index: index,
                          isVis: isVis,
                        );
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
                      return NewTile(
                        index: index,
                        isVis: isVis,
                      );
                    }
                  },
                  childCount: tasks.length + 1, //isVis ? tasks.length + 1 : tasks.length - kol + 1,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
