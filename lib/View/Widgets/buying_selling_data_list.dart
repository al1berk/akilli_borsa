import 'package:flutter/material.dart';

class BuyingSellingDataList extends StatelessWidget {
  final List<dynamic> buyingSellingData;

  BuyingSellingDataList({super.key, required this.buyingSellingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buyingSellingData.map((e) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: Text(
                e["Alis"] == 1
                    ? "Alım Fiyatı: ${e["Alis Fiyati"].toStringAsFixed(2)}"
                    : "Satış Fiyatı: ${e["Satis Fiyati"].toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  // Conditional color for selling price based on profit or loss
                  color: e["Alis"] == 1
                      ? Colors.black // Regular color for buying
                      : e["Kar"] >= 0
                      ? Colors.green // Green for profit
                      : Colors.red,  // Red for loss
                ),
              ),
              subtitle: Text(
                e["Alis"] == 1
                    ? "Alınan Hisse: ${e["Lot"].toStringAsFixed(2)}\nBütçe: ${e["Butce"].toStringAsFixed(2)}\nTarih: ${e["Datetime"]}"
                    : "Satılan Hisse: ${e["Lot"].toStringAsFixed(2)}\n${e["Kar"] >= 0 ? "Kar: ${e["Kar"].toStringAsFixed(2)}" : "Zarar: ${e["Kar"].toStringAsFixed(2)}"}\nBütçe: ${e["Butce"].toStringAsFixed(2)}\nTarih: ${e["Datetime"]}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
