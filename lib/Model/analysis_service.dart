import 'dart:convert';
import 'package:akilli_borsa/Model/analysis_info.dart';
import 'package:http/http.dart' as http;
import '../model/stock.dart';

class AnalysisService {

  String apiUrl ;

  AnalysisService({required this.apiUrl});


  void setApiUrl(String url) {
    apiUrl = url;
  }

  Future<AnalysisInfo> fetchAnalysis() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return AnalysisInfo.fromJson(data);
    } else {
      throw Exception("Failed to load analysis");
    }
  }

}