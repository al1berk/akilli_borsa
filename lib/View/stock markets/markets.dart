import 'package:akilli_borsa/Model/stock_lists.dart';
import 'package:akilli_borsa/View/Widgets/clickable_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/stock_controller.dart';
import '../Widgets/navigation_bar.dart';
import 'stocks.dart';

class Markets extends StatelessWidget {

   Markets({super.key});
  final StockController stockController = Get.put(StockController());
   late List<String> stocksList ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piyasalar', style: TextStyle(color: Colors.white)),
      ),
      body:  ClickableListWidget(items: markets, onItemClick:(item) {
        if (item == markets[0]) {
          stocksList = bist30Stocks;
        }
        else if (item == markets[1]){
          stocksList = bist100Stocks;
        }
        else if (item == markets[2]){
          stocksList = yildizPazar;
        }
        else {
          stocksList = anaPazar;
        }


        Get.to(Stocks() , arguments: stocksList);
      } ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
