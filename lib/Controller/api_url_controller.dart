import 'package:get/get.dart';

class ApiUrlController {
  var grafikType = "grafik2".obs;
  var apiUrl = "".obs;


  void setApiUrl(String url) {
    apiUrl.value = url;
  }
  void setGrafikType(String type) {
    grafikType.value = type;
  }
}