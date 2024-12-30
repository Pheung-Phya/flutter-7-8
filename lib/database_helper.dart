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

  static Future<Database> get database async {
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
          CREATE TABLE IF NOT EXISTS $table (
            $columnId INTEGER PRIMARKEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnGender TEXT NOT NULL,
            $columnImage TEXT NOT NULL
          )
    ''');
  }
}
