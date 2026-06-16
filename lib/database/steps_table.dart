import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'steps_table.g.dart';

class StepsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get steps => integer()();

  DateTimeColumn get date => dateTime()();
}

@DriftDatabase(
  tables: [StepsTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File(
      p.join(dir.path, 'steps.sqlite'),
    );

    return NativeDatabase(file);
  });
}