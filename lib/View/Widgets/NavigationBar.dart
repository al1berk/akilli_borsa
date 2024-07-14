import 'package:akilli_borsa/View/stock%20markets/Markets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final RxInt selectedIndex = 1.obs; // Reactive variable for selected index

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: selectedIndex.value,
      onTap: (index) {
        selectedIndex.value = index;

        switch (index) {
          case 0:
            Get.to('/home');
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
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    ));
  }
}