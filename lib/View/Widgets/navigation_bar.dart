import 'package:akilli_borsa/View/portf%C3%B6y/portfoy_page.dart';
import 'package:akilli_borsa/View/stock%20markets/Markets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final RxInt selectedIndex = 1.obs;

   BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: selectedIndex.value,
      onTap: (index) {
        selectedIndex.value = index;

        switch (index) {
          case 0:
            Get.to(const PortfoyPage());
            break;
          case 1:
            if (selectedIndex.value != 1) {
                  Get.to(
                       Markets());
                }
                break;
          case 2:
            Get.toNamed('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Portföy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_graph_outlined),
          label: 'Piyasalar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    ));
  }
}