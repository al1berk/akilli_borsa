import 'package:akilli_borsa/Controller/api_url_controller.dart';
import 'package:akilli_borsa/Controller/stock_controller.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:akilli_borsa/View/Widgets/spinner.dart';
import 'package:akilli_borsa/View/stock%20markets/horizontal_graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/navigation_bar.dart';
import '../Widgets/time_period_selector.dart';
import '../grafik.dart';


class StockDetail extends StatefulWidget {
  const StockDetail({super.key});

  @override
  State<StockDetail> createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  StockController stockController = Get.find();
  String symbol = Get.arguments;
  var date = "".obs;
  ApiUrlController apiUrlController = Get.put(ApiUrlController());
  var values = "0".obs;
  DateTimeRange? selectedDateRange;
  var grafikText = "Mum Grafik".obs;
  List<String> intervals = ['1 Dakika','2 Dakika','5 Dakika','15 Dakika','30 Dakika','1 Saat','1 Gün',];

  @override
  void initState() {
    super.initState();
    apiUrlController.setApiUrl("${apiUrlController.grafikType.value}/$symbol/0");
    stockController.fetchStocks(symbol);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symbol, style: const TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: Center(
        child: SingleChildScrollView( child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Obx(() {
              final stockItem = stockController.stockItems[symbol];
              return Text(
                stockItem != null ? '${stockItem.close.toStringAsFixed(2)} TL' : 'Loading...',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SpinnerExample(items: intervals, onItemClick: (value){
                  values.value = value;
                  print("value $value");
                  apiUrlController.setApiUrl("${apiUrlController.grafikType.value}/$symbol/$value${date.value}");
                  print(apiUrlController.apiUrl.value);
                },),
                datePicker(context),

              ],
            )
            ,


            Obx((){
              return CizgiGrafik(urlApi: apiUrlController.apiUrl.value);
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                    (){
                      return  ButtonOne(text: grafikText.value, onPressed: (){

                        if (apiUrlController.grafikType.value == "mum_grafik") {
                          apiUrlController.setGrafikType("grafik2");
                          grafikText.value = "Mum Grafik";
                        } else {
                          apiUrlController.setGrafikType("mum_grafik");
                          grafikText.value = "Çizgi Grafik";
                        }



                      });
                    }
                ),
                ButtonOne(text: "Analiz Sayfası", onPressed: (){

                }),


                IconButtonOne(icon: const Icon(Icons.fullscreen), onPressed: (){
                  Get.to(FullScreenGraph(urlApi: apiUrlController.apiUrl.value));
                }),

              ],
            ),

            const SizedBox(height: 20),




            if (selectedDateRange != null)
              Text(
                'Seçilen Tarih Aralığı: ${selectedDateRange!.start.toLocal().toIso8601String().split('T').first} - ${selectedDateRange!.end.toLocal().toIso8601String().split('T').first}',

                style: const TextStyle(fontSize: 16),
              ),


          ],
        )),
      ),
    );
  }

  ElevatedButton datePicker(BuildContext context) {
    return ElevatedButton(
                onPressed: () async {
                  DateTime firstDate;
                  DateTime lastDate;
                  if (values.value == "0") {
                    lastDate = DateTime.now();
                    firstDate = lastDate.subtract(const Duration(days: 7));
                  } else {
                    firstDate = DateTime(2000);
                    lastDate = DateTime.now();
                  }

                  final DateTimeRange? picked = await showDateRangePicker(
                    context: context,
                    firstDate: firstDate,
                    lastDate: lastDate,
                  );

                  if (picked != null) {
                    if (values.value == "0" && picked.duration.inDays > 2) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('1 dakikalık aralıkta en fazla 3 günlük veri seçebilirsiniz.')),
                      );
                    } else {
                      setState(() {
                        selectedDateRange = picked;
                      });
                      date.value = "/${picked.start.toIso8601String().split('T').first}/${picked.end.toIso8601String().split('T').first}";
                      apiUrlController.setApiUrl("${apiUrlController.grafikType.value}/$symbol/${values.value}/${picked.start.toIso8601String().split('T').first}/${picked.end.toIso8601String().split('T').first}");
                      print(apiUrlController.apiUrl.value);

                    }
                  }
                },
                child: const Text('Tarih Aralığı Seç'),
              );
  }
}
