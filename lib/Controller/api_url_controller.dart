import 'package:get/get.dart';

class ApiUrlController {
  var page = "grafik2".obs;
  var apiUrl = "".obs;


  void setApiUrl(String url) {
    apiUrl.value = url;
  }
  void setGrafikType(String type) {
    page.value = type;
  }
}