import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdlist/page/data/repository.dart';

import '../data/tile_data.dart';

class TodoBloc extends Bloc<TodoEvent, List<TileData>> {
  TodoBloc() : super([]) {
    on<TodoAddEvent>(_onAdd);
    on<TodoChangeEvent>(_onChange);
    on<TodoLoadEvent>(_onLoad);
    on<TodoDeleteEvent>(_onDelete);
  }

  final repository = Repository();

  _onAdd(TodoAddEvent event, Emitter<List<TileData>> emit) {
    final state = List<TileData>.from(this.state);
    state.add(event.tile);
    repository.addNewTile(event.tile);
    emit(state);
  }

  _onChange(TodoChangeEvent event, Emitter<List<TileData>> emit) {
    final state = List<TileData>.from(this.state);
    state[event.index] = event.tile;
    state[event.index].changedAt = DateTime.now();
    repository.changeTile(event.tile);
    print(state);
    print(this.state);
    emit(state);
  }

   _onLoad(TodoLoadEvent event, Emitter<List<TileData>> emit) async {
     final state = List<TileData>.from(this.state);
     await repository.getData().then((list) {
      for (var item in list) {
        state.add(TileData.fromJson(item));
      }
    });

    emit(state);
  }

  _onDelete(TodoDeleteEvent event, Emitter<List<TileData>> emit) {
    final state = List<TileData>.from(this.state);
    state.removeAt(event.index);
    repository.deleteTile(state[event.index]);
    emit(state);
  }
}

abstract class TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final TileData tile;
  TodoAddEvent(this.tile);
}

class TodoChangeEvent extends TodoEvent {
  final int index;
  final TileData tile;

  TodoChangeEvent(this.index, this.tile);
}
class TodoLoadEvent extends TodoEvent {

}
class TodoDeleteEvent extends TodoEvent{
  final int index;

  TodoDeleteEvent(this.index);
}
