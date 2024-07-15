import 'package:akilli_borsa/Controller/stock_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/stock.dart';
import '../../Model/stock_lists.dart';
import '../Widgets/clickable_list.dart';
import '../Widgets/navigation_bar.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {


  List<String> stocksList = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hisse Senetleri', style: TextStyle(color: Colors.white)),
      ),
      body:
      StockListWidgetTwo(
        market: stocksList,
        onItemClick: (item) {
          print(item);
        },
      ),


      bottomNavigationBar: BottomNavigationBarWidget(
    )
    );
  }
}
