import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/stock_controller.dart';
import '../../Controller/user_controller.dart';

class ClickableListWidget extends StatelessWidget {
  final List<String> items;
  final Function(String) onItemClick;

  const ClickableListWidget({
    Key? key,
    required this.items,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onItemClick(items[index]);
          },
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      items[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class StockListWidget extends StatelessWidget {
  final userController = Get.find<UserController>();
  final StockController stockController = Get.find();
  final Function(String) onItemClick;
  StockListWidget({
    Key? key,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



      return Obx(() {
        return ListView.builder(
        itemCount:  userController.userStocks.length,
        itemBuilder: (context, index) {
          String key = userController.userStocks[index];
          stockController.fetchStocks(key);
          return Obx(() {
          if (stockController.stockItems[key] == null) {
            return const Center(child: CircularProgressIndicator(),);
          }
          return GestureDetector(
            onTap: () {
              onItemClick(stockController.stockItems[key]?.symbol ?? "" );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            stockController.stockItems[key]?.symbol ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            stockController.stockItems[key]?.time ?? "",
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      stockController.stockItems[key]?.open.toStringAsFixed(2) ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          stockController.stockItems[key]?.isUp() ?? false ? Icons.arrow_upward : Icons.arrow_downward,
                          color: stockController.stockItems[key]?.isUp() ?? false ? Colors.green : Colors.red,
                        ),
                        Text(
                          stockController.stockItems[key]?.getPercentage() ?? "",
                          style: TextStyle(
                            color: stockController.stockItems[key]?.isUp() ?? false ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
  );
  }
}

class StockListWidgetTwo extends StatelessWidget {
  final userController = Get.find<UserController>();
  final StockController stockController = Get.find();
  final Function(String) onItemClick;
  final List<String> market ;
  StockListWidgetTwo({
    Key? key,
    required this.market,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



      return ListView.builder(
          itemCount: market.length,
          itemBuilder: (context, index) {
            String key =  market[index];
            stockController.fetchStocks(key);
            return Obx(() {
              if (stockController.stockItems[key] == null) {
                return const Center(child: CircularProgressIndicator(),);
              }
              return GestureDetector(
                onTap: () {
                  onItemClick(stockController.stockItems[key]?.symbol ?? "" );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                stockController.stockItems[key]?.symbol ?? "",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                stockController.stockItems[key]?.time ?? "",
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          stockController.stockItems[key]?.open.toStringAsFixed(2) ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Icon(
                              stockController.stockItems[key]?.isUp() ?? false ? Icons.arrow_upward : Icons.arrow_downward,
                              color: stockController.stockItems[key]?.isUp() ?? false ? Colors.green : Colors.red,
                            ),
                            Text(
                              stockController.stockItems[key]?.getPercentage() ?? "",
                              style: TextStyle(
                                color: stockController.stockItems[key]?.isUp() ?? false ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

          );
    }
    );
  }
}