import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RandomChart extends StatefulWidget {
  @override
  _RandomChartState createState() => _RandomChartState();
}

class _RandomChartState extends State<RandomChart> {
  List<ChartData> data = [];

  @override
  void initState() {
    super.initState();
    data = generateRandomData();
  }

  List<ChartData> generateRandomData() {
    Random random = Random();
    return List.generate(100, (index) {
      return ChartData(
        x: DateTime.now().subtract(Duration(days: 100 - index)),
        y: random.nextInt(20) + random.nextDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Rastgele Veri Grafiği'),
      primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.days,
        dateFormat: DateFormat.MMMd(),
      ),
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      series: <ChartSeries>[
        LineSeries<ChartData, DateTime>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          markerSettings: MarkerSettings(isVisible: false),
          dataLabelSettings: DataLabelSettings(isVisible: false),
          onPointTap: (ChartPointDetails details) {
            final ChartData pointData = data[details.pointIndex!];
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Tıklanan Nokta'),
                  content: Text(
                      'Tarih: ${DateFormat.yMMMd().format(pointData.x)}, Değer: ${pointData.y.toStringAsFixed(2)}'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Tamam'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
      ),
    );
  }
}

class ChartData {
  ChartData({required this.x, required this.y});
  final DateTime x;
  final double y;
}