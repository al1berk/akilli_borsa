import 'package:akilli_borsa/View/portf%C3%B6y/portfoy_page.dart';
import 'package:akilli_borsa/View/profile/profile_page.dart';
import 'package:akilli_borsa/View/stock%20markets/markets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final RxInt selectedIndex = 1.obs;

class BottomNavigationBarWidget extends StatelessWidget {

  const BottomNavigationBarWidget({super.key});

  void onItemTapped(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
      switch (index) {
        case 0:
          Get.offAll(() => const PortfoyPage() ,transition: Transition.fadeIn);
          break;
        case 1:
          Get.offAll(() => Markets() ,transition: Transition.fadeIn);
          break;
        case 2:
          Get.offAll(() => const ProfilePage() , transition: Transition.fadeIn);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: selectedIndex.value,
      onTap: onItemTapped,
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
