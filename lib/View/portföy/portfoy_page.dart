import 'package:akilli_borsa/Model/StockLists.dart';
import 'package:akilli_borsa/View/Widgets/clickable_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akilli_borsa/Controller/UserController.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:akilli_borsa/View/Widgets/textFields.dart';

import '../Widgets/navigation_bar.dart';

class PortfoyPage extends StatefulWidget {
  const PortfoyPage({super.key});

  @override
  State<PortfoyPage> createState() => _PortfoyPageState();
}

class _PortfoyPageState extends State<PortfoyPage> {
  final UserController userController = Get.find<UserController>();
  RxList<String> filteredStocks = <String>[

  ].obs; // RxList for reactive updates
  TextEditingController searchController = TextEditingController();
  List<String> stocks = [

  ];
  Set<String> combinedSet = {...bist30Stocks, ...bist100Stocks, ...yildizPazar, ...anaPazar};

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(combinedSet.toList()..sort());
    stocks = combinedSet.toList()..sort();
    filteredStocks.addAll(stocks);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portföy', style: TextStyle(color: Colors.white)),
        actions: [
          IconButtonOne(
            icon: Icon(Icons.add),
            onPressed: () {
              stocksShowDialog(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
    ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (userController.userStocks.isEmpty) {
                return Center(child: Text('Hisse Ekleyin'));
              }
              return StockListWidget(onItemClick: (value){} ,);
            }),
          ),
        ],
      ),
    );
  }

  void filterStocks(String query) {
    filteredStocks.clear();
    if (query.isNotEmpty) {
      stocks.forEach((stock) {
        if (stock.toLowerCase().contains(query.toLowerCase())) {
          filteredStocks.add(stock);
        }
      });
    } else {
      filteredStocks.addAll(stocks);
    }
  }

  Future<dynamic> stocksShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: double.maxFinite, // Ensure full width
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldOne(
                labelText: "Hisse",
                hintText: "Hisse Ara",
                controller: searchController,
                onChanged: filterStocks,
              ),
              SizedBox(height: 12),
              // Wrap in Expanded to allow the ListView to take available space
              Expanded(
                child: Obx(
                      () => SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filteredStocks.length,
                          itemBuilder: (context, index) {
                            String stock = filteredStocks[index];
                            bool isSelected = userController.userStocks.contains(stock);

                            return ListTile(
                              title: Text(stock),
                              trailing: isSelected
                                  ? IconButton(
                                icon: const Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  userController.removeStockFromUser(userController.user.value!.userID, stock);
                                  Navigator.of(context).pop();
                                },
                              )
                                  : null,
                              onTap: () {
                                if (userController.user.value != null) {
                                  if (!isSelected) {
                                    userController.addStockToUser(userController.user.value!.userID, stock);
                                  } else {
                                    userController.removeStockFromUser(userController.user.value!.userID, stock);
                                  }
                                  print("USER ID : ${userController.user.value!.userID}");
                                } else {
                                  print("User not loaded");
                                }
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
