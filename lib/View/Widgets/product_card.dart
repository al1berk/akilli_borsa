import 'package:akilli_borsa/View/tools/tool_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String productID;
  final String imageUrl;
  final String productName;
  final double price;
  final double rating;
  final bool isLiveSignal;

  const ProductCard({
    Key? key,
    required this.productID,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.rating,
    this.isLiveSignal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Product ID: $productID');
        Get.to(ToolDetail(productId: productID));
        
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  // Product Image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (isLiveSignal)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        child: const Text(
                          'Live Signal',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            // Rating and Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating.round()
                            ? Icons.star
                            : Icons.star_border,
                        size: 16,
                        color: Colors.orange,
                      );
                    }),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Display two cards in each row
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75, // Control the height of the card
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          productID: product['productID'],
          imageUrl: product['imageUrl'],
          productName: product['productName'],
          price: product['price'],
          rating: product['rating'],
          isLiveSignal: product['isLiveSignal'],
        );
      },
    );
  }
}
