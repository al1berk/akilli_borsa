

import 'package:get/get.dart';

import '../Model/analysis_service.dart';
class AnalysisInfoController extends GetxController {
  var data = {}.obs; // Update to handle map data
  var win = 0.obs;
  var loss = 0.obs;


  Future<void> fetchAnalysisInfo(String apiUrl) async {
    try {
      var service = AnalysisService(apiUrl: apiUrl);
      var analysisData = await service.fetchAnalysis();
      data.value = analysisData.data;
      print("Analiz başarıyla çekildi");
      print(data);
    } catch (e) {
      print("Hata oluştu");
      print(e);
    }
  }

  String calculateProfit() {
    var toplam_karlar = data["toplam_karlar"];
    double toplam_kar = 0;
    for (var i in toplam_karlar) {
      toplam_kar += i;
      if (i > 0) {
        win.value++;
      } else {
        loss.value++;
      }

    }

    return toplam_kar.toStringAsFixed(2);
  }

}
