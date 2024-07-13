import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Stock.dart';

class Stockcontroller {
  String apiUrl = "http://aliberk.pythonanywhere.com/";

  Future<Stock> fetchStock(String symbol) async {

    final  response = (await http.get(Uri.parse("$apiUrl$symbol")));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Stock(
        symbol: data["Symbol"],
        time: data["Datetime"],
        open: data["Open"],
        high: data["High"],
        low: data["Low"],
        close: data["Close"],
        volume: data["Volume"],
        dividends: data["Dividends"],
        stockSplits: data["Stock Splits"],
      );
    } else {
      throw Exception("Failed to load stock");
    }

  }
}