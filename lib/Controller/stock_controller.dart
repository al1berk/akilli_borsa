import 'package:get/get.dart';
import '../Model/stock_service.dart';
import '../model/stock.dart';

class StockController extends GetxController {
  var stockItems = <String,Stock>{}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchStocks("AKBNK");
    super.onInit();
  }

  Future<void> fetchStocks(String symbol) async {
    try {
      isLoading(true);
      var stockList = await StockService().fetchStock(symbol);
      stockItems[symbol] = stockList[0];
    } finally {
      isLoading(false);
    }
  }
}

