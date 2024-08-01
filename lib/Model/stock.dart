

class Stock {
  final String symbol;
  final String time;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;
  final double dividends;
  final double stockSplits;

  Stock({
    required this.symbol,
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.dividends,
    required this.stockSplits,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {

    return Stock(
      symbol: json["Symbol"],
      time: json["Date"],
      open: json["Open"],
      high: json["High"],
      low: json["Low"],
      close: json["Close"],
      volume: json["Volume"],
      dividends: json["Dividends"],
      stockSplits: json["Stock Splits"],
    );
  }

  String getPercentage() {

    double percentage = ((close - open) / open) * 100;
    return percentage.toStringAsFixed(2);
  }

  bool isUp() {

    return close >= open;
  }
}
