import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tdlist/page/data/network_manager.dart';
import 'package:tdlist/page/data/persistence_manager.dart';

import 'my_list.dart';
import 'tile_data.dart';
import '../presentation/home_page.dart';

class Repository extends ChangeNotifier{
  final networkManager = NetworkManager();
  final persistenceManager = PersistenceManager();

  Future<List<Map<String, dynamic>>> getData() async {
    try {
      await networkManager.getData();
    } catch (e) {
      logger.w('Failed to fetch data from network: $e');
    }
    List<Map<String, dynamic>> dataPersistence;
    dataPersistence = await persistenceManager.getDataPersistence();
    try {
      await changeListNetwork(dataPersistence);
    } catch (e) {
      logger.w('Failed to patch data in network: $e');
    }
    return dataPersistence;
  }

  addNewTile(TileData tile) {
    persistenceManager.postDataPersistence(tile.toMapPersistence());
    networkManager.postData(TileData(
      note: tile.note,
      relevance: tile.relevance,
      date: tile.date,
      isDone: false,
      id: tile.id,
      changedAt: DateTime.now(),
      createdAt: DateTime.now(),
      color: "#FFFFFF",
      lastUpdatedBy: "1",
    ).toJson());
  }

  changeTile(TileData tile) {
    persistenceManager.putDataPersistence(tile.toMapPersistence());
    networkManager.putData(
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
        tile.id!);
  }

  deleteTile(TileData tile) {
    persistenceManager.deleteDataPersistence(tile.toMapPersistence());
    networkManager.deleteData(tile.id!);
  }

  changeListNetwork(List<dynamic> list) {
    networkManager.patchData(jsonEncode({'list': list}));
  }
}
