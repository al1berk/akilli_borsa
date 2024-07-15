import 'package:akilli_borsa/Controller/stock_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/navigation_bar.dart';
import '../Widgets/time_period_selector.dart';

class StockDetail extends StatefulWidget {
  const StockDetail({super.key});

  @override
  State<StockDetail> createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  StockController stockController = Get.find();
  String symbol = Get.arguments;

  @override
  void initState() {
    super.initState();
    stockController.fetchStocks(symbol);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symbol, style: const TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final stockItem = stockController.stockItems[symbol];
              return Text(
                stockItem != null ? '${stockItem.close.toStringAsFixed(2)} TL' : 'Loading...',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 20),
            TimePeriodSelector(),
          ],
        ),
      ),
    );
  }
}
