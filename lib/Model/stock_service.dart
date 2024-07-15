import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/stock.dart';
class StockService {
  String apiUrl = "http://aliberk.pythonanywhere.com/stock/";

  Future<List<Stock>> fetchStock(String symbol) async {
    final response = await http.get(Uri.parse("$apiUrl$symbol"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data is List) {
        return data.map((json) {
          json["Symbol"] = symbol; // Add the "Symbol" field to each stock object
          return Stock.fromJson(json);
        }).toList();
      } else if (data is Map<String, dynamic>) {
        // If the response is a single stock object
        data["Symbol"] = symbol; // Add the "Symbol" field to the stock object
        return [Stock.fromJson(data)];
      } else {
        throw Exception("Unexpected response format");
      }
    } else {
      throw Exception("Failed to load stock");
    }
  }
}