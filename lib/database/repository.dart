import 'package:medicare/database/pills_database.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  final PillsDatabase _pillsDatabase = PillsDatabase();
  static Database? _database;

  //init database
  Future<Database?> get database async {
    _database = await _pillsDatabase.setDatabase();
    return _database;
  }

  //insert something to database
  Future<int?> insertData(String table, Map<String, dynamic> data) async {
    Database? db = await database;
    try {
      return await db?.insert(table, data);
    } catch (e) {
      return null;
    }
  }

  //get all data from database
  Future<List<Map<String, dynamic>>?> getAllData(table) async {
    Database? db = await database;
    try {
      return db!.query(table);
    } catch (e) {
      return null;
    }
  }

  //delete data
  Future<int?> deleteData(String table, int id) async {
    Database? db = await database;
    try {
      return await db!.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      return null;
    }
  }
}
