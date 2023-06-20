import 'package:flutter/material.dart';
import 'package:tdlist/main.dart';
import 'package:tdlist/network_manager.dart';
import 'package:tdlist/network_methods.dart';

import '../theme/app_color.dart';
import '../tile_data.dart';
import 'home_page.dart';
import '../my_list.dart';
import '../navigate/navigation.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.index});

  final int? index;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  bool? light = false;
  DateTime? date;
  int? editRelevance = 0;
  bool? isSave = false;
  TextEditingController? _controller = TextEditingController(
    text: '',
  );
  String? note;
  bool? delEnable;
  int? index;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    index = widget.index;
    note = _controller!.text;
    if (index == tasks.length) {
      delEnable = false;
    } else {
      delEnable = true;
      if (note != null) _controller = TextEditingController(text: note = tasks[index!].note);
      editRelevance = tasks[index!].relevance;
      if (tasks[index!].date != null) {
        date = tasks[index!].date;
        light = true;
      } else {
        date = DateTime.now();
      }
    }
    if (note != '') {
      isSave = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> relevance = ['Нет', 'Низкий', '‼ Высокий'];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 88,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
              icon: const Icon(Icons.close),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                logger.i('Pressed close button in AddPage');
                NavigationManager.instance.pop();
              },
            ),
            actions: [
              TextButton(
                onPressed: isSave!
                    ? () {
                        logger.i('Pressed text button СОХРАНИТЬ in AddPage');
                        if (delEnable!) {
                          tasks[index!].changedAt = DateTime.now();
                          tasks[index!].note = note;

                          tasks[index!].relevance = editRelevance;
                          if (light!) {
                            tasks[index!].date = date;
                          } else {
                            tasks[index!].date = null;
                          }
                          changeTileNetwork(tasks[index!]);
                        } else {
                          tasks.add(TileData(
                            note: note,
                            relevance: editRelevance,
                            date: date,
                            isDone: false,
                            id: nextID(),
                            changedAt: DateTime.now(),
                            createdAt: DateTime.now(),
                            color: "#FFFFFF",
                            lastUpdatedBy: "1",
                          ));
                          addNewTileNetwork(tasks[index!]);
                        }
                        NavigationManager.instance.pop();
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: Text(
                    'СОХРАНИТЬ',
                    style: isSave! ? Theme.of(context).textTheme.displayMedium : Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 16,
                    right: 16,
                    bottom: 12,
                  ),
                  child: PhysicalModel(
                    elevation: 4.0,
                    color: Colors.transparent,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            note = _controller!.text;
                            if (note != '') {
                              isSave = true;
                            } else {
                              isSave = false;
                            }
                          });
                        },
                        minLines: 5,
                        maxLines: null,
                        controller: _controller,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            border: InputBorder.none,
                            hintText: 'Что надо сделать...',
                            hintStyle: Theme.of(context).textTheme.labelSmall,
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          'Важность',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        subtitle: SizedBox(
                          height: 30,
                          child: DropdownButton<int>(
                            value: editRelevance,
                            iconSize: 0,
                            onChanged: (int? newValue) {
                              logger.i('User changed relevance in tile with index $index');
                              setState(() {
                                editRelevance = newValue!;
                              });
                            },
                            items: [
                              DropdownMenuItem<int>(
                                value: 0,
                                child: Text(
                                  relevance[0],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 1,
                                child: Text(
                                  relevance[1],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              DropdownMenuItem<int>(
                                value: 2,
                                child: Text(
                                  relevance[2],
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              )
                            ],
                            selectedItemBuilder: (BuildContext context) {
                              return relevance.map<Widget>((String value) {
                                return Text(value, style: Theme.of(context).textTheme.labelMedium);
                              }).toList();
                            },
                            underline: Container(),
                            icon: null,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 16,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 24,
                        ),
                        child: SwitchListTile(
                          activeColor: AppColor.clBlue,
                          inactiveThumbColor: AppColor.clBlue,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Сделать до',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: light! ? Text(
                              '${date!.year}/${date!.month}/${date!.day}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ) : const SizedBox.shrink(),

                          value: light!,
                          onChanged: (bool? value) async {
                            logger.i('Pressed switch in AddPage for tile with index $index');
                            light = value;
                            if (value == true) {
                              DateTime? newDate = await showDatePicker(
                                initialEntryMode: DatePickerEntryMode.calendarOnly,
                                context: context,
                                initialDate: date ?? DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData(),
                                    child: child!,
                                  );
                                },
                              );
                              if (newDate == null) return;
                              setState(() {
                                date = newDate;
                              });
                            }
                            else
                              {
                                date = null;
                              }
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 16,
                    right: 16,
                    bottom: 50,
                  ),
                  child: ListTile(
                    onTap: delEnable!
                        ? () {
                            logger.i('Pressed tile Удалить in AddPage');
                            delTileNetwork(tasks[index!].id);
                            tasks.removeAt(index!);
                            NavigationManager.instance.pop();
                          }
                        : null,
                    contentPadding: const EdgeInsets.all(0),
                    leading: Icon(
                      Icons.delete,
                      color: delEnable! ? AppColor.clRed : AppColor.labelDisable,
                    ),
                    title: Text(
                      'Удалить',
                      style: delEnable! ? Theme.of(context).textTheme.headlineMedium : Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
