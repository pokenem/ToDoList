import 'package:tdlist/tile_data.dart';
import 'package:uuid/uuid.dart';

String nextID()
{
  return Uuid().v4();
}

List<TileData> tasks = [];