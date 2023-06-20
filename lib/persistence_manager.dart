import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tdlist/tile_data.dart';


class PersistenceManager {
  Future<File> get _file async{
    final appDir = await getApplicationDocumentsDirectory();
    final file = File("${appDir.path}/list.txt");
    if(!await file.exists())
      {
        await file.create();
      }
    return file;
  }

  Future<List<TileData>> getDataPersistence() async {
    final file = await _file;
    final lines = await file.readAsLines();
    return [];
  }

  Future<void> saveTilePersistence({required TileData tile}) async {

  }
}