import 'dart:convert';

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

  factory TileData.fromJson(Map<String, dynamic> jsonData) {
    int relevance;
    if (jsonData['importance'] == 'basic') {
      relevance = 0;
    } else if (jsonData['importance'] == 'low') {
      relevance = 1;
    } else {
      relevance = 2;
    }
    return TileData(
      note: jsonData['text'],
      date: jsonData['deadline'] == null ? null : DateTime.fromMillisecondsSinceEpoch(jsonData['deadline']),
      id: jsonData['id'],
      isDone: jsonData['done'],
      changedAt: DateTime.fromMillisecondsSinceEpoch(jsonData['changed_at']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(jsonData['created_at']),
      color: jsonData['color'],
      lastUpdatedBy: jsonData['last_updated_by'],
      relevance: relevance,
    );
  }

  String toJson() {
    String importance;
    if (relevance == 0) {
      importance = 'basic';
    } else if (relevance == 1) {
      importance = 'low';
    } else {
      importance = 'important';
    }

    return jsonEncode({
      'element': {
        'text': note,
        if (date != null) 'deadline': date!.toUtc().millisecondsSinceEpoch,
        'id': id,
        'done': isDone,
        'changed_at': changedAt!.toUtc().millisecondsSinceEpoch,
        'created_at': createdAt!.toUtc().millisecondsSinceEpoch,
        'color': color,
        'last_updated_by': lastUpdatedBy,
        'importance': importance,
      }
    });
  }

  Map<String, dynamic> toMapPersistence() {
    String importance;
    if (relevance == 0) {
      importance = 'basic';
    } else if (relevance == 1) {
      importance = 'low';
    } else {
      importance = 'important';
    }

    final noteMap = {
      'text': note,
      if (date != null) 'deadline': date?.toUtc().millisecondsSinceEpoch,
      'id': id,
      'done': isDone,
      'changed_at': changedAt!.toUtc().millisecondsSinceEpoch,
      'created_at': createdAt!.toUtc().millisecondsSinceEpoch,
      'color': color,
      'last_updated_by': lastUpdatedBy,
      'importance': importance,
    };
    return noteMap;
  }
}
