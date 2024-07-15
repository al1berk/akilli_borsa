

import '../database_provider.dart';
import 'stock_model.dart';

class StockDao {
  final dbProvider = DatabaseProvider.db;

  Future<int> addStock(StockModel stock) async {
    final db = await dbProvider.database;
    return await db.insert('stocks', stock.toMap());
  }

  Future<StockModel?> getStockBySymbol(String symbol) async {
    final db = await dbProvider.database;
    final result = await db.query(
      'stocks',
      where: 'symbol = ?',
      whereArgs: [symbol],
    );

    if (result.isNotEmpty) {
      return StockModel.fromMap(result.first);
    }
    return null;
  }
}
