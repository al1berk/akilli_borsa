import 'package:akilli_borsa/Controller/StockController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Stock.dart';
import '../../Model/StockLists.dart';
import '../Widgets/ClickableList.dart';
import '../Widgets/NavigationBar.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks', style: TextStyle(color: Colors.white)),
      ),
      body:
      StockListWidget(
        onItemClick: (item) {
          print(item);
        },
      ),


      bottomNavigationBar: BottomNavigationBarWidget(
    )
    );
  }
}
