import 'dart:convert';

import 'package:tdlist/persistence_manager.dart';
import 'package:tdlist/tile_data.dart';


delTileNetwork(String? id) {
  networkManager.deleteData(id!);
}

changeTileNetwork(TileData tile) {
  networkManager
      .putData(
          TileData(
            note: tile.note,
            relevance: tile.relevance,
            date: tile.date,
            isDone: tile.isDone,
            id: tile.id,
            changedAt: DateTime.now(),
            createdAt: tile.createdAt,
            color: "#FFFFFF",
            lastUpdatedBy: "1",
          ).toJson(),
          tile.id!)
      .then((value) {
    print(value);
  });
}

addNewTileNetwork(TileData tile) {
  networkManager
      .postData(TileData(
    note: tile.note,
    relevance: tile.relevance,
    date: tile.date,
    isDone: false,
    id: tile.id,
    changedAt: DateTime.now(),
    createdAt: DateTime.now(),
    color: "#FFFFFF",
    lastUpdatedBy: "1",
  ).toJson())
      .then((value) {
    print(value);
  });
}
changeListNetwork(List<dynamic> list)
{
    networkManager.patchData(jsonEncode({'list': list}));
}
