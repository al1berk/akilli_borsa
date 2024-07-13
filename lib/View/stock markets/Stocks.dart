import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/StockLists.dart';
import '../Widgets/ClickableList.dart';
import '../Widgets/NavigationBar.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  List<StockItem> stockItems = [
    StockItem(symbol: 'XU030', time: '16:42:22', value: '98.869,84', percentage: '0,96 %', isUp: false),
    StockItem(symbol: 'XU100', time: '16:42:22', value: '81.023,29', percentage: '0,74 %', isUp: false),
    StockItem(symbol: 'PETKM', time: '16:42:15', value: '3,77', percentage: '1,62 %', isUp: true),
    StockItem(symbol: 'SAHOL', time: '16:42:15', value: '9,80', percentage: '1,14 %', isUp: true),
    StockItem(symbol: 'F_XU0300615S0', time: '16:42:21', value: '99,400', percentage: '0,43 %', isUp: true),
    StockItem(symbol: 'F_TRYUSD0615S0', time: '16:42:23', value: '2,7045', percentage: '0,00', isUp: false),
    StockItem(symbol: 'EUR/USD', time: '16:42:22', value: '1,1121', percentage: '1,77 %', isUp: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks', style: TextStyle(color: Colors.white)),
      ),
      body: StockListWidget(
        stockItems: stockItems,
        onItemClick: (item) {
          print(item);
        },
      ),


      bottomNavigationBar: BottomNavigationBarWidget(
    )
    );
  }
}
