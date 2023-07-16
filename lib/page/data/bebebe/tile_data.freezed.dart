// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TileData _$TileDataFromJson(Map<String, dynamic> json) {
  return _TileData.fromJson(json);
}

/// @nodoc
mixin _$TileData {
  String get note => throw _privateConstructorUsedError;
  int get relevance => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get changedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get lastUpdatedBy => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TileDataCopyWith<TileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TileDataCopyWith<$Res> {
  factory $TileDataCopyWith(TileData value, $Res Function(TileData) then) =
      _$TileDataCopyWithImpl<$Res, TileData>;
  @useResult
  $Res call(
      {String note,
      int relevance,
      DateTime? date,
      bool isDone,
      String id,
      DateTime changedAt,
      DateTime createdAt,
      String lastUpdatedBy,
      String color});
}

/// @nodoc
class _$TileDataCopyWithImpl<$Res, $Val extends TileData>
    implements $TileDataCopyWith<$Res> {
  _$TileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? relevance = null,
    Object? date = freezed,
    Object? isDone = null,
    Object? id = null,
    Object? changedAt = null,
    Object? createdAt = null,
    Object? lastUpdatedBy = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      relevance: null == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TileDataCopyWith<$Res> implements $TileDataCopyWith<$Res> {
  factory _$$_TileDataCopyWith(
          _$_TileData value, $Res Function(_$_TileData) then) =
      __$$_TileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String note,
      int relevance,
      DateTime? date,
      bool isDone,
      String id,
      DateTime changedAt,
      DateTime createdAt,
      String lastUpdatedBy,
      String color});
}

/// @nodoc
class __$$_TileDataCopyWithImpl<$Res>
    extends _$TileDataCopyWithImpl<$Res, _$_TileData>
    implements _$$_TileDataCopyWith<$Res> {
  __$$_TileDataCopyWithImpl(
      _$_TileData _value, $Res Function(_$_TileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? relevance = null,
    Object? date = freezed,
    Object? isDone = null,
    Object? id = null,
    Object? changedAt = null,
    Object? createdAt = null,
    Object? lastUpdatedBy = null,
    Object? color = null,
  }) {
    return _then(_$_TileData(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      relevance: null == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TileData implements _TileData {
  const _$_TileData(
      {required this.note,
      required this.relevance,
      this.date,
      this.isDone = false,
      required this.id,
      required this.changedAt,
      required this.createdAt,
      required this.lastUpdatedBy,
      this.color = "#FFFFFFFF"});

  factory _$_TileData.fromJson(Map<String, dynamic> json) =>
      _$$_TileDataFromJson(json);

  @override
  final String note;
  @override
  final int relevance;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final bool isDone;
  @override
  final String id;
  @override
  final DateTime changedAt;
  @override
  final DateTime createdAt;
  @override
  final String lastUpdatedBy;
  @override
  @JsonKey()
  final String color;

  @override
  String toString() {
    return 'TileData(note: $note, relevance: $relevance, date: $date, isDone: $isDone, id: $id, changedAt: $changedAt, createdAt: $createdAt, lastUpdatedBy: $lastUpdatedBy, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TileData &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.relevance, relevance) ||
                other.relevance == relevance) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, note, relevance, date, isDone,
      id, changedAt, createdAt, lastUpdatedBy, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TileDataCopyWith<_$_TileData> get copyWith =>
      __$$_TileDataCopyWithImpl<_$_TileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TileDataToJson(
      this,
    );
  }
}

abstract class _TileData implements TileData {
  const factory _TileData(
      {required final String note,
      required final int relevance,
      final DateTime? date,
      final bool isDone,
      required final String id,
      required final DateTime changedAt,
      required final DateTime createdAt,
      required final String lastUpdatedBy,
      final String color}) = _$_TileData;

  factory _TileData.fromJson(Map<String, dynamic> json) = _$_TileData.fromJson;

  @override
  String get note;
  @override
  int get relevance;
  @override
  DateTime? get date;
  @override
  bool get isDone;
  @override
  String get id;
  @override
  DateTime get changedAt;
  @override
  DateTime get createdAt;
  @override
  String get lastUpdatedBy;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$_TileDataCopyWith<_$_TileData> get copyWith =>
      throw _privateConstructorUsedError;
}
