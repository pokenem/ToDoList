import 'package:tdlist/main.dart';

import '../data/my_list.dart';
import '../data/tile_data.dart';

changePersistence() {
  persistenceManager.patchDataPersistence(tasks);
}

addNewTilePersistence(TileData tile) {
  persistenceManager.postDataPersistence(tile.toMapPersistence());
}

changeTilePersistence(TileData tile) {
  persistenceManager.putDataPersistence(tile.toMapPersistence());
}

deleteTilePersistence(TileData tile) {
  persistenceManager.deleteDataPersistence(tile.toMapPersistence());
}
