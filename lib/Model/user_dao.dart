import 'package:sqflite/sqflite.dart';
import '../database_provider.dart';
import 'user_model.dart';

class UserDao {
  final dbProvider = DatabaseProvider.db;

  Future<int> createUser(UserModel user) async {
    try {
      final db = await dbProvider.database;
      print(db);
      return await db.insert('user', user.toMap());
    } catch (e) {
      print("Error creating user: $e");
      return -1;
    }

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
  Future<int> removeStockFromUser(String userId, String stockSymbol) async {
    final db = await dbProvider.database;
    return await db.delete(
      'user_stocks',
      where: 'user_id = ? AND stock_symbol = ?',
      whereArgs: [userId, stockSymbol],
    );
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

  Future<int> addStockToUser(String userId, String stockSymbol) async {
    final db = await dbProvider.database;
    print("Adding stock to user $userId: $stockSymbol");
    return await db.insert('user_stocks', {
      'user_id': userId,
      'stock_symbol': stockSymbol,
    });
  }

  Future<List<String>> getUserStocks(String userId) async {
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
    try {
      final db = await dbProvider.database;
      final result = await db.query(
        'user',
        where: 'userID = ?',
        whereArgs: [userID],
      );
      print("user dao kullanıcı çekildi ${result.first}");
      if (result.isNotEmpty) {
        return UserModel.fromMap(result.first);
      }
    }
    catch (e) {
      print("Error getting user by userID: $e");
      return null;
    }




    return null;
  }
}
