// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_table.dart';

// ignore_for_file: type=lint
class $StepsTableTable extends StepsTable
    with TableInfo<$StepsTableTable, StepsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, steps, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'steps_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StepsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    } else if (isInserting) {
      context.missing(_stepsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StepsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StepsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $StepsTableTable createAlias(String alias) {
    return $StepsTableTable(attachedDatabase, alias);
  }
}

class StepsTableData extends DataClass implements Insertable<StepsTableData> {
  final int id;
  final int steps;
  final DateTime date;
  const StepsTableData({
    required this.id,
    required this.steps,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['steps'] = Variable<int>(steps);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  StepsTableCompanion toCompanion(bool nullToAbsent) {
    return StepsTableCompanion(
      id: Value(id),
      steps: Value(steps),
      date: Value(date),
    );
  }

  factory StepsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StepsTableData(
      id: serializer.fromJson<int>(json['id']),
      steps: serializer.fromJson<int>(json['steps']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'steps': serializer.toJson<int>(steps),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  StepsTableData copyWith({int? id, int? steps, DateTime? date}) =>
      StepsTableData(
        id: id ?? this.id,
        steps: steps ?? this.steps,
        date: date ?? this.date,
      );
  StepsTableData copyWithCompanion(StepsTableCompanion data) {
    return StepsTableData(
      id: data.id.present ? data.id.value : this.id,
      steps: data.steps.present ? data.steps.value : this.steps,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StepsTableData(')
          ..write('id: $id, ')
          ..write('steps: $steps, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, steps, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StepsTableData &&
          other.id == this.id &&
          other.steps == this.steps &&
          other.date == this.date);
}

class StepsTableCompanion extends UpdateCompanion<StepsTableData> {
  final Value<int> id;
  final Value<int> steps;
  final Value<DateTime> date;
  const StepsTableCompanion({
    this.id = const Value.absent(),
    this.steps = const Value.absent(),
    this.date = const Value.absent(),
  });
  StepsTableCompanion.insert({
    this.id = const Value.absent(),
    required int steps,
    required DateTime date,
  }) : steps = Value(steps),
       date = Value(date);
  static Insertable<StepsTableData> custom({
    Expression<int>? id,
    Expression<int>? steps,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (steps != null) 'steps': steps,
      if (date != null) 'date': date,
    });
  }

  StepsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? steps,
    Value<DateTime>? date,
  }) {
    return StepsTableCompanion(
      id: id ?? this.id,
      steps: steps ?? this.steps,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsTableCompanion(')
          ..write('id: $id, ')
          ..write('steps: $steps, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StepsTableTable stepsTable = $StepsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stepsTable];
}

typedef $$StepsTableTableCreateCompanionBuilder =
    StepsTableCompanion Function({
      Value<int> id,
      required int steps,
      required DateTime date,
    });
typedef $$StepsTableTableUpdateCompanionBuilder =
    StepsTableCompanion Function({
      Value<int> id,
      Value<int> steps,
      Value<DateTime> date,
    });

class $$StepsTableTableFilterComposer
    extends Composer<_$AppDatabase, $StepsTableTable> {
  $$StepsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StepsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StepsTableTable> {
  $$StepsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StepsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StepsTableTable> {
  $$StepsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$StepsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StepsTableTable,
          StepsTableData,
          $$StepsTableTableFilterComposer,
          $$StepsTableTableOrderingComposer,
          $$StepsTableTableAnnotationComposer,
          $$StepsTableTableCreateCompanionBuilder,
          $$StepsTableTableUpdateCompanionBuilder,
          (
            StepsTableData,
            BaseReferences<_$AppDatabase, $StepsTableTable, StepsTableData>,
          ),
          StepsTableData,
          PrefetchHooks Function()
        > {
  $$StepsTableTableTableManager(_$AppDatabase db, $StepsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StepsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StepsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StepsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> steps = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => StepsTableCompanion(id: id, steps: steps, date: date),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int steps,
                required DateTime date,
              }) =>
                  StepsTableCompanion.insert(id: id, steps: steps, date: date),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StepsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StepsTableTable,
      StepsTableData,
      $$StepsTableTableFilterComposer,
      $$StepsTableTableOrderingComposer,
      $$StepsTableTableAnnotationComposer,
      $$StepsTableTableCreateCompanionBuilder,
      $$StepsTableTableUpdateCompanionBuilder,
      (
        StepsTableData,
        BaseReferences<_$AppDatabase, $StepsTableTable, StepsTableData>,
      ),
      StepsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StepsTableTableTableManager get stepsTable =>
      $$StepsTableTableTableManager(_db, _db.stepsTable);
}
