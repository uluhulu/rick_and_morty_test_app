import 'package:rick_and_morty_test_app/favorites/favorites.dart';

part 'characters_database.g.dart';

class CharactersDatabase extends Table {
  IntColumn get id => integer()();
  TextColumn get image => text()();
  TextColumn get name => text()();
  TextColumn get status => text()();
}

@DriftDatabase(tables: [CharactersDatabase])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'characters_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
