import 'package:akilli_borsa/Controller/UserController.dart';
import 'package:akilli_borsa/Model/UserModel.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:akilli_borsa/View/Widgets/clickable_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class PortfoyPage extends StatefulWidget {
  const PortfoyPage({super.key});

  @override
  State<PortfoyPage> createState() => _PortfoyPageState();
}

class _PortfoyPageState extends State<PortfoyPage> {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portföy', style: TextStyle(color: Colors.white)),
        actions: [
          IconButtonOne(icon: Icon(Icons.add), onPressed: (){})
        ],

      ),
      body: StockListWidget(
        market: userController.userStocks,
        onItemClick: (item) {
          print(item);
        },
      ),
    );
  }
}

