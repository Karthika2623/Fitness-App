import 'package:drift/drift.dart';

import '../database/steps_table.dart';
class StepRepository {
  final AppDatabase db;

  StepRepository(this.db);

  Future saveSteps(int count) async {
    await db.into(db.stepsTable).insert(
      StepsTableCompanion.insert(
        steps: count,
        date: DateTime.now(),
      ),
    );
  }

  Stream<List<StepsTableData>> watchSteps() {
    return db.select(db.stepsTable).watch();
  }
  Future<List<StepsTableData>>
  getLast7Days() async {

    final sevenDaysAgo =
    DateTime.now().subtract(
      const Duration(days: 7),
    );

    return await (
        db.select(
          db.stepsTable,
        )
          ..where(
                (tbl) =>
                tbl.date.isBiggerThanValue(
                  sevenDaysAgo,
                ),
          )
    ).get();
  }
}