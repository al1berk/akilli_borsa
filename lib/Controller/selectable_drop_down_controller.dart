import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectableDropDownController extends GetxController {
  var selectedItems = [].obs;

  void selectItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }
}