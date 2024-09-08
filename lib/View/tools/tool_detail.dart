import 'package:akilli_borsa/Controller/firestore_controller.dart';
import 'package:akilli_borsa/Controller/user_controller.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/product.dart';

class ToolDetail extends StatefulWidget {
  final String productId;

  const ToolDetail({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  _ToolDetailState createState() => _ToolDetailState();
}

class _ToolDetailState extends State<ToolDetail> {
  final currentPage = 0.obs; // Sayfa numarasını yönetmek için GetX observable
  FirestoreController firestoreController = Get.put(FirestoreController());
  UserController userController = Get.find<UserController>();
  Products products = Products();
  @override
  Widget build(BuildContext context) {
    // Geçici verilerle ürünü oluştur
    print('Product ID: ${widget.productId}');
    final Product product = products.productMap[widget.productId]!;

    final PageController pageController = PageController();

    // Sayfa değişimini dinle
    pageController.addListener(() {
      final page = pageController.page;
      if (page != null) {
        final newPage = page.round();
        if (newPage != currentPage.value) {
          currentPage.value = newPage;
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title:  Text(product.productName , style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ürün Resimlerini Carousel ile Gösterme
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: product.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(product.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      '${currentPage.value + 1} / ${product.images.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Color(0xFF071952)),
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward, color: Color(0xFF071952)),
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Ürün Adı ve Fiyat
              Text(
                product.productName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              // Yıldızlı Değerlendirme
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < product.rating.round()
                        ? Icons.star
                        : Icons.star_border,
                    size: 24,
                    color: Colors.orange,
                  );
                }),
              ),
              const SizedBox(height: 16),
              // Ürün Açıklaması
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonOne(text: "Satın Al", onPressed: () {
                    firestoreController.addToolWithUserId(userController.user.value!.userID, product.productID);
                    // Satın alma işlemi
                  }),
                ],
              )

            ],
          ),
        );
      }),
    );
  }
}


