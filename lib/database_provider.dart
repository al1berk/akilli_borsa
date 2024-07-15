import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database? _database;

  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }
  void clearDB() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    await deleteDatabase(path);
  }
  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userID TEXT NOT NULL,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
 
        
      )
    ''');

    await db.execute('''
      CREATE TABLE user_stocks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id TEXT NOT NULL,
        stock_symbol TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user (id)
      )
    ''');
  }
}
