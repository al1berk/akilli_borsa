import 'package:flutter/material.dart';

import '../../Model/StockLists.dart';

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
  final List<StockItem> stockItems;

  final Function(String) onItemClick;

  const StockListWidget({
    Key? key,
    required this.stockItems,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stockItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onItemClick(stockItems[index].symbol);
          },
          child: Container(
            padding: EdgeInsets.symmetric( vertical: 16),
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
                        child: Text(stockItems[index].symbol, style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, ),

                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(stockItems[index].time, style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, ),
                      )

                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    stockItems[index].value,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        stockItems[index].isUp ? Icons.arrow_upward : Icons.arrow_downward,
                        color: stockItems[index].isUp ? Colors.green : Colors.red,
                      ),


                      Text(stockItems[index].percentage,
                                              style: TextStyle(
                      color: stockItems[index].isUp ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                                              ),),
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
}