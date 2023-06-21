import 'package:tdlist/main.dart';
import 'package:tdlist/tile_data.dart';

import 'my_list.dart';

// delTilePersistence(String? id) {
//   persistenceManager.deleteData(id!);
//}
// changeTilePersistence(TileData tile) {
//   persistenceManager
//       .putData(
//       TileData(
//         note: tile.note,
//         relevance: tile.relevance,
//         date: tile.date,
//         isDone: tile.isDone,
//         id: tile.id,
//         changedAt: DateTime.now(),
//         createdAt: tile.createdAt,
//         color: "#FFFFFF",
//         lastUpdatedBy: "1",
//       ).toJson(),
//       tile.id!)
//       .then((value) {
//     print(value);
//   });
// }

changePersistence() {
  persistenceManager
      .patchDataPersistence(tasks);
}