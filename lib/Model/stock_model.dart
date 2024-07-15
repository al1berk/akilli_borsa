class StockModel {
  final int? id;
  final String symbol;

  StockModel({
    this.id,
    required this.symbol,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symbol': symbol,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      id: map['id'],
      symbol: map['symbol'],
    );
  }
}
