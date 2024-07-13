import 'package:sqflite/sqflite.dart';

import '../DatabaseProvider.dart';
import 'UserModel.dart';

class UserDao {
  final dbProvider = DatabaseProvider.db;

  Future<int> createUser(UserModel user) async {
    final db = await dbProvider.database;
    await db.delete('users');

    var result = await db.insert('users', user.toMap());
    return result;
  }

  Future<UserModel?> getUserById(int id) async {
    final db = await dbProvider.database;
    var res = await db.query('users', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? UserModel.fromMap(res.first) : null;
  }
  Future<UserModel?> getLastUser() async {
    final db = await dbProvider.database;
    var res = await db.query('users', orderBy: 'id DESC', limit: 1);
    return res.isNotEmpty ? UserModel.fromMap(res.first) : null;
  }
}
