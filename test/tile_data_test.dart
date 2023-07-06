import 'package:flutter_test/flutter_test.dart';
import 'package:tdlist/page/data/tile_data.dart';

void main() {
  group('TileData', () {
    test('getDataPersistence should return a list of data', () async {
      TileData data = TileData(
        note: "I Want Pizza",
        date: DateTime.now(),
        relevance: 2,
        isDone: true,
        id: "21332314",
        changedAt: DateTime.now(),
        color: "#FFFFFFFF",
        createdAt: DateTime.now(),
        lastUpdatedBy: "chili",
      );
      TileData data2 = data;
      Map<String, dynamic> dt = data2.toMapPersistence();
      TileData data3 = TileData.fromJson(dt);
      expect(data.relevance, data3.relevance);
      expect(data.isDone, data3.isDone);
      expect(data.id, data3.id);
      expect(data.lastUpdatedBy, data3.lastUpdatedBy);
      expect(data.color, data3.color);
      expect(data.note, data3.note);
    });
  });
}
