import 'package:tdlist/main.dart';

import '../data/my_list.dart';
import '../data/tile_data.dart';

changePersistence() {
  persistenceManager.patchDataPersistence(tasks);
}

addNewTilePersistence(TileData tile) {
  persistenceManager.postDataPersistence(tile.toMapPersistence());
}

changeTilePersistence(TileData tile, int index) {
  persistenceManager.putDataPersistence(tile.toMapPersistence(), index);
}

deleteTilePersistence(TileData tile) {
  persistenceManager.deleteDataPersistence(tile.toMapPersistence());
}
