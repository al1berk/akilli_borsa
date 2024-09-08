import 'package:flutter/material.dart';

import '../../Model/product.dart';
import '../Widgets/navigation_bar.dart';
import '../Widgets/product_card.dart';

class ToolsView extends StatefulWidget {
  const ToolsView({super.key});

  @override
  State<ToolsView> createState() => _ToolsViewState();
}

class _ToolsViewState extends State<ToolsView> {
  Products products = Products();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Araçlar', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: ProductGrid(
    products: [

  {
    'productID': products.rsiRobot.productID,
    'imageUrl': 'https://media-cdn.t24.com.tr/media/library/2023/08/1693230867007-yeni-proje-3.jpg',
    'productName': products.rsiRobot.productName,
    'price': products.rsiRobot.price,
    'rating': products.rsiRobot.rating,
    'isLiveSignal': false,
  },
   {
     'productID': products.macdRobot.productID,
    'imageUrl': 'https://borsaegitimi.com.tr/wp-content/uploads/2023/04/ucretsiz-borsa-egitimi.jpg',
    'productName': products.macdRobot.productName,
    'price': products.macdRobot.price,
    'rating': products.macdRobot.rating,
    'isLiveSignal': false,
  },
   {
      'productID': products.bollingerRobot.productID,
    'imageUrl': 'https://cdnuploads.aa.com.tr/uploads/Contents/2023/06/09/thumbs_b_c_9d887eb17e154f9e7d454468197d52e2.jpg',
    'productName': products.bollingerRobot.productName,
    'price': products.bollingerRobot.price,
    'rating': products.bollingerRobot.rating,
    'isLiveSignal': false,
  },
       {
        'productID': products.movingAverageRobot.productID,
        'imageUrl': 'https://media-cdn.t24.com.tr/media/library/2023/08/1693230867007-yeni-proje-3.jpg',
        'productName': products.movingAverageRobot.productName,
        'price': products.movingAverageRobot.price,
        'rating': products.movingAverageRobot.rating,
        'isLiveSignal': false,
      },
       {
        'productID': products.stochasticRobot.productID,
        'imageUrl': 'https://borsaegitimi.com.tr/wp-content/uploads/2023/04/ucretsiz-borsa-egitimi.jpg',
        'productName': products.stochasticRobot.productName,
        'price': products.stochasticRobot.price,
        'rating': products.stochasticRobot.rating,
        'isLiveSignal': false,
      },
       {
        'productID': products.fibonacciRobot.productID,
        'imageUrl': 'https://cdnuploads.aa.com.tr/uploads/Contents/2023/06/09/thumbs_b_c_9d887eb17e154f9e7d454468197d52e2.jpg',
        'productName': products.fibonacciRobot.productName,
        'price': products.fibonacciRobot.price,
        'rating': products.fibonacciRobot.rating,
        'isLiveSignal': false,
      }
  ]
    ),

    );
  }
}

