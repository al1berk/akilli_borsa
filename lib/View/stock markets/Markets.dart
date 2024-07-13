import 'package:akilli_borsa/Model/StockLists.dart';
import 'package:akilli_borsa/View/Widgets/ClickableList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/NavigationBar.dart';
import 'Stocks.dart';

class Markets extends StatelessWidget {
  const Markets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks', style: TextStyle(color: Colors.white)),
      ),
      body:  ClickableListWidget(items: markets, onItemClick:(item) {
        Get.to(Stocks());
      } ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
