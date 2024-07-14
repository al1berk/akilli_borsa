import 'package:sqflite/sqflite.dart';
import '../DatabaseProvider.dart';
import 'UserModel.dart';
import 'StockModel.dart';

class UserDao {
  final dbProvider = DatabaseProvider.db;

  Future<int> createUser(UserModel user) async {
    final db = await dbProvider.database;
    return await db.insert('user', user.toMap());
  }

  Future<UserModel?> getUserById(int id) async {
    final db = await dbProvider.database;
    final result = await db.query(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }

  Future<UserModel?> getLastUser() async {
    final db = await dbProvider.database;
    final result = await db.query(
      'user',
      orderBy: 'id DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }

  Future<int> addStockToUser(int userId, String stockSymbol) async {
    final db = await dbProvider.database;
    return await db.insert('user_stocks', {
      'user_id': userId,
      'stock_symbol': stockSymbol,
    });
  }

  Future<List<String>> getUserStocks(int userId) async {
    final db = await dbProvider.database;
    final result = await db.query(
      'user_stocks',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return result.map((stock) => stock['stock_symbol'] as String).toList();
    }
    return [];
  }

  Future<UserModel?> getUserByUserID(String userID) async {
    final db = await dbProvider.database;
    final result = await db.query(
      'user',
      where: 'userID = ?',
      whereArgs: [userID],
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }
}
