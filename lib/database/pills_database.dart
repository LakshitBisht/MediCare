import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class PillsDatabase {
  setDatabase() async {
    databaseFactory = databaseFactoryFfi;
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "pills_db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Pills (id INTEGER PRIMARY KEY, name TEXT, amount TEXT, type TEXT, howManyWeeks INTEGER, medicineForm TEXT, time INTEGER, notifyId INTEGER)");
    });
    return database;
  }
}
