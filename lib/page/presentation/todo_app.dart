import 'package:flutter/material.dart';
import 'package:tdlist/page/presentation/todo_bloc.dart';
import '../data/repository.dart';
import '../data/tile_data.dart';

class _InheritedTodoApp extends InheritedWidget {
  const _InheritedTodoApp({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final TodoAppState data;

  @override
  bool updateShouldNotify(_InheritedTodoApp oldWidget) => true;
}

class TodoApp extends StatefulWidget {
  const TodoApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  TodoAppState createState() => TodoAppState();

  static TodoAppState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedTodoApp>())!.data;
  }
}

class TodoAppState extends State<TodoApp> {
  List<TileData> tasks = [];
  final repository = Repository();

  void addItem(TileData tile) {
     repository.addNewTile(tile);
     setState(() {
     tasks.add(tile);
    });
  }
  void deleteItem(int index){
    repository.deleteTile(tasks[index]);
    setState(() {
      tasks.removeAt(index);
    });
  }
  void changeItem(int index, TileData tile)
  {
    setState(() {
        tasks[index].changedAt = DateTime.now();
    });
    repository.changeTile(tasks[index]);

  }

  @override
  void initState() {
    super.initState();
    repository.getData().then((list) {
      setState(() {
        for (var item in list) {
          tasks.add(TileData.fromJson(item));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTodoApp(
      data: this,
      child: widget.child,
    );
  }
}
