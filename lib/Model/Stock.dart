
class Stock {
  final String symbol;
  final String time;
  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;
  final String dividends;
  final String stockSplits;
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
  Future<int> getPercentage () async {
    double open = double.parse(this.open);
    double close = double.parse(this.close);
    double percentage = ((close - open) / open) * 100;
    return percentage.toInt();
  }
  Future<bool> isUp() async {
    double open = double.parse(this.open);
    double close = double.parse(this.close);
    return close > open;
  }

}