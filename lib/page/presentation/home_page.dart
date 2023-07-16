import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdlist/page/presentation/todo_bloc.dart';

import '../../theme/app_color.dart';
import '../data/tile_data.dart';
import 'widget/my_sliverbar.dart';
import 'widget/my_tile.dart';
import 'package:logger/logger.dart';

import 'widget/new_tile.dart';

var logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.onItemTap});
  final void Function(int index, bool isNew) onItemTap;

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
    widget.onItemTap(context.read<TodoBloc>().state.length, true);
    // NavigationManager.instance.openAdd(context.read<TodoBloc>().state.length);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, List<TileData>>(
      builder: (context, tasks) {
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
          body: context.read<TodoBloc>().loading
              ? CustomScrollView(
                  slivers: [
                    MySliverAppBar(
                        isVis: isVis,
                        updateParent: (bool newValue) => updateIsVis(newValue)),
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
                                    onItemTap: widget.onItemTap,
                                  );
                                }
                              } else {
                                return NewTile(
                                  index: index,
                                  isVis: isVis,
                                  onItemTap: widget.onItemTap,
                                );
                              }
                            } else if (index != tasks.length) {
                              return CustomTile(
                                index: index,
                                isVis: isVis,
                                onItemTap: widget.onItemTap,
                              );
                            } else {
                              return NewTile(
                                index: index,
                                isVis: isVis,
                                onItemTap: widget.onItemTap,
                              );
                            }
                          },
                          childCount: tasks.length +
                              1, //isVis ? tasks.length + 1 : tasks.length - kol + 1,
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.clGrey,
                  ),
                ),
        );
      },
    );
  }
}
