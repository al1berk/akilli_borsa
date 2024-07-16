import 'package:get/get.dart';

class ApiUrlController {
  var apiUrl = "".obs;

  void setApiUrl(String url) {
    apiUrl.value = url;
  }
}