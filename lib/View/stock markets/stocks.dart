import 'package:akilli_borsa/View/stock%20markets/stock_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Get.to(TabBarPage(),arguments: item);

        },
      ),


      bottomNavigationBar: BottomNavigationBarWidget(
    )
    );
  }
}
