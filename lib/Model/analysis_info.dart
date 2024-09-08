class AnalysisInfo {
  Map<String, dynamic> data;


  AnalysisInfo({required this.data});

  factory AnalysisInfo.fromJson(Map<String, dynamic> json) {
    return AnalysisInfo(

      data: json['data'] as Map<String, dynamic>, // Ensure the type matches
    );
  }
}
