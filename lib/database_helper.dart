import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const _databaseName = "storage.db";
  static const _databaseVersion = 1;
  static const table = 'users';
  static const columnId = "ID";
  static const columnName = "NAME";
  static const columnGender = "GENDER";
  static const columnImage = "IMAGE";

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

<<<<<<< HEAD
  static Future<Database> get database async {
=======
  Future<Database> get database async {
>>>>>>> 1ce48d2 (shared pref)
    if (_database != null) {
      return _database!;
    }
    _database = await instance._initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
<<<<<<< HEAD
          CREATE TABLE IF NOT EXISTS $table (
            $columnId INTEGER PRIMARKEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnGender TEXT NOT NULL,
            $columnImage TEXT NOT NULL
          )
    ''');
  }
=======
         CREATE TABLE IF NOT EXISTS $table (
          $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnName TEXT NOT NULL,
          $columnGender TEXT NOT NULL,
          $columnImage TEXT NOT NULL
      );
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> getAllRow() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<void> updateRow(Map<String, dynamic> map) async {
    Database db = await instance.database;
    await db.update(table, map, where: "$columnId =?", whereArgs: map['id']);
  }
>>>>>>> 1ce48d2 (shared pref)
}
