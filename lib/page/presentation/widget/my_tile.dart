import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/app_color.dart';
import '../../../theme/app_style.dart';
import '../../data/di.dart';
import '../home_page.dart';
import '../todo_bloc.dart';

class CustomTile extends StatefulWidget {
  final int index;
  final bool isVis;
  final void Function(int index, bool isNew) onItemTap;

  const CustomTile({
    super.key,
    required this.index,
    required this.isVis,
    required this.onItemTap,
  });

  @override
  CustomTileState createState() => CustomTileState();
}

class CustomTileState extends State<CustomTile> {
  double shift = 0;
  int currentIndex = 0;
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  double iconPadding() {
    return shift * (MediaQuery.of(context).size.width - 16) - 40 >= 28
        ? shift * (MediaQuery.of(context).size.width - 16) - 48
        : 20;
  }

  onConfirmDismissTile() {
    final tasks = context.read<TodoBloc>().state;
    tasks[index].isDone = !tasks[index].isDone!;
    context.read<TodoBloc>().add(TodoChangeEvent(
          index,
          tasks[index],
        ));
  }

  onDismissedTile() {
    logger
        .i('Tile swiped left and element with index $index deleted from list');
    context.read<TodoBloc>().add(TodoDeleteEvent(index));
  }

  onUpdateTile(dynamic details) {
    setState(() {
      shift = details.progress;
    });
  }

  onTapListTile() {
    currentIndex = index;
    logger.i('Pressed on tile in MyHomePage');
    widget.onItemTap(currentIndex, false);
    // NavigationManager.instance.openAdd(currentIndex);
  }

  onChangedCheckBox(bool value) {
    final tasks = context.read<TodoBloc>().state;
    tasks[index].isDone = value;
    logger
        .i('Pressed checkbox and element with index $index changed his state');
    context.read<TodoBloc>().add(TodoChangeEvent(
          index,
          tasks[index],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final useImportanceColor = Locator.configRepository.useImportanceColor;
    final tasks = context.read<TodoBloc>().state;
    return ClipRRect(
      child: Dismissible(
        key: Key(tasks[index].id.toString()),
        direction: DismissDirection.horizontal,
        confirmDismiss: (DismissDirection direction) async {
          if (direction == DismissDirection.endToStart) {
            return true;
          } else {
            logger.i(
                'Tile swiped right and element with index $index changed his state');
            Future.delayed(const Duration(milliseconds: 250), () {
              onConfirmDismissTile();
            });
            return false;
          }
        },
        onDismissed: (DismissDirection direction) {
          onDismissedTile();
        },
        onUpdate: (DismissUpdateDetails details) {
          onUpdateTile(details);
        },
        background: Container(
          decoration: BoxDecoration(
            color: tasks[index].isDone! ? AppColor.clRed : AppColor.clGreen,
            borderRadius: index == whatTheFirst()
                ? const BorderRadius.vertical(
                    top: Radius.circular(8),
                  )
                : null,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: iconPadding()),
          child: tasks[index].isDone!
              ? const Icon(Icons.close, color: AppColor.clWhite)
              : const Icon(Icons.check, color: AppColor.clWhite),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
            color: AppColor.clRed,
            borderRadius: index == whatTheFirst()
                ? const BorderRadius.vertical(
                    top: Radius.circular(8),
                  )
                : null,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: iconPadding()),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: ListTile(
          onTap: () {
            onTapListTile();
          },
          shape: index == whatTheFirst()
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                )
              : null,
          tileColor: Theme.of(context).colorScheme.onPrimary,
          title: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 3,
                    top: 14,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 2,
                  top: 16,
                ),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: Checkbox(
                    value: tasks[index].isDone!,
                    checkColor: AppColor.clWhite,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColor.clGreen;
                        } else {
                          return tasks[index].relevance == 2
                              ? useImportanceColor
                                  ? AppColor.clRedRemoteConfig
                                  : AppColor.clRed
                              : Theme.of(context).colorScheme.tertiary;
                        }
                      },
                    ),
                    onChanged: (bool? value) {
                      onChangedCheckBox(value!);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 36,
                  top: 14,
                  bottom: 14,
                  right: 52,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        TextSpan(
                          children: <InlineSpan>[
                            if (tasks[index].relevance == 2 &&
                                !tasks[index].isDone!)
                              TextSpan(
                                text: '!! ',
                                style: useImportanceColor
                                    ? AppStyle.headlineLargeRemote
                                    : Theme.of(context).textTheme.headlineLarge,
                              ),
                            if (tasks[index].relevance == 1 &&
                                !tasks[index].isDone!)
                              const WidgetSpan(
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: AppColor.clGrey,
                                  size: 18,
                                ),
                              ),
                            TextSpan(
                              text: tasks[index].note!,
                              style: tasks[index].isDone!
                                  ? Theme.of(context).textTheme.bodySmall
                                  : Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                      if (tasks[index].date != null)
                        Text(
                          '${tasks[index].date?.year}/${tasks[index].date?.month}/${tasks[index].date?.day}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          style: ListTileStyle.list,
        ),
      ),
    );
  }

  int whatTheFirst() {
    int k = 0;
    if (!widget.isVis) {
      while (k < context.read<TodoBloc>().state.length &&
          context.read<TodoBloc>().state[k].isDone!) {
        k++;
      }
    }
    return k;
  }
}
