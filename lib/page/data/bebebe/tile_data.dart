import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile_data.freezed.dart';
part 'tile_data.g.dart';

@freezed
class TileData with _$TileData{
  const factory TileData({
    required String note,
    required int relevance,
    required DateTime date,
    @Default(false) bool isDone,
    required String id,
    required DateTime changedAt,
    required DateTime createdAt,
    required String lastUpdatedBy,
    @Default("#FFFFFFFF") String color,
  }) = _TileData;

    factory TileData.fromJson(Map<String, dynamic> json) => _$TileDataFromJson(json);
}