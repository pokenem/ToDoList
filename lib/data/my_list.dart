import 'package:tdlist/data/tile_data.dart';
import 'package:uuid/uuid.dart';

String nextID() {
  return const Uuid().v4();
}

List<TileData> tasks = [];
