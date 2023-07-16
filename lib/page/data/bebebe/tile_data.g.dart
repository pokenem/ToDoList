// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TileData _$$_TileDataFromJson(Map<String, dynamic> json) => _$_TileData(
      note: json['note'] as String,
      relevance: json['relevance'] as int,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isDone: json['isDone'] as bool? ?? false,
      id: json['id'] as String,
      changedAt: DateTime.parse(json['changedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastUpdatedBy: json['lastUpdatedBy'] as String,
      color: json['color'] as String? ?? "#FFFFFFFF",
    );

Map<String, dynamic> _$$_TileDataToJson(_$_TileData instance) =>
    <String, dynamic>{
      'note': instance.note,
      'relevance': instance.relevance,
      'date': instance.date?.toIso8601String(),
      'isDone': instance.isDone,
      'id': instance.id,
      'changedAt': instance.changedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUpdatedBy': instance.lastUpdatedBy,
      'color': instance.color,
    };
