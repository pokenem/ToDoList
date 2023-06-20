import 'dart:convert';
import 'dart:ui';

class TileData {
  String? note;
  int? relevance;
  DateTime? date;
  bool? isDone;
  String? id;
  DateTime? changedAt;
  DateTime? createdAt;
  String? lastUpdatedBy;
  String? color;

  TileData({
    this.note,
    this.relevance,
    this.date,
    this.isDone,
    this.id,
    this.changedAt,
    this.color,
    this.createdAt,
    this.lastUpdatedBy,
  });

  factory TileData.fromJson(Map<String, dynamic> json) {
    int relevance;
    if (json["importance"] == "basic") {
      relevance = 0;
    } else if (json["importance"] == "low") {
      relevance = 1;
    } else {
      relevance = 2;
    }
    return TileData(
      note: json["text"],
      date: json["deadline"] == null ? null : DateTime.fromMillisecondsSinceEpoch(json["deadline"]),
      id: json["id"],
      isDone: json["done"],
      changedAt: DateTime.fromMillisecondsSinceEpoch(json["changed_at"]),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json["created_at"]),
      color: json["color"],
      lastUpdatedBy: json["last_updated_by"],
      relevance: relevance,
    );
  }

  String toJson() {
    String importance;
    if(relevance == 0) {
      importance = "basic";
    } else
      if(relevance == 1) {
        importance = "low";
      } else {
        importance = "important";
      }

    return jsonEncode({
      "element":{
      "text": note,
      if(date != null) "deadline": date!.toUtc().millisecondsSinceEpoch,
      "id": id,
      "done": isDone,
      "changed_at": changedAt!.toUtc().millisecondsSinceEpoch,
      "created_at": createdAt!.toUtc().millisecondsSinceEpoch,
      "color": color,
      "last_updated_by": lastUpdatedBy,
      "importance" : importance,}
    });
  }
}
