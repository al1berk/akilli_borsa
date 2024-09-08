import 'package:akilli_borsa/Controller/analysis_info_controller.dart';
import 'package:akilli_borsa/Controller/api_url_controller.dart';
import 'package:akilli_borsa/Controller/stock_controller.dart';
import 'package:akilli_borsa/View/Widgets/buttons.dart';
import 'package:akilli_borsa/View/Widgets/drop_down.dart';
import 'package:akilli_borsa/View/Widgets/profil_info_item.dart';
import 'package:akilli_borsa/View/Widgets/stock_info_item.dart';
import 'package:akilli_borsa/View/stock%20markets/deneme.dart';
import 'package:akilli_borsa/View/stock%20markets/horizontal_graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/navigation_bar.dart';
import '../Widgets/time_period_selector.dart';
import '../grafik.dart';
import 'analysis_page.dart';


class TabBarPage extends StatefulWidget {

  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {

  String symbol = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Tab sayısını buraya giriyorsunuz.
      child: Scaffold(
        appBar: AppBar(
          title: Text(symbol, style: const TextStyle(color: Colors.white)),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Grafik',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Analiz Sayfası',
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),

        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(), // Disable swipe
          children: [
            StockDetail(),
            AnalysisPage(symbol: symbol),
          ],
        ),
      ),

    );

  }
}


class StockDetail extends StatefulWidget {
  const StockDetail({super.key});

  @override
  State<StockDetail> createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  StockController stockController = Get.find();
  String symbol = Get.arguments;

  ApiUrlController apiUrlController = Get.put(ApiUrlController());
  var values = "0".obs;
  DateTimeRange? selectedDateRange;
  var grafikText = "Mum Grafik".obs;
  List<String> intervals = ['1 Dakika','2 Dakika','5 Dakika','15 Dakika','30 Dakika','1 Saat','1 Gün',];

  @override
  void initState() {
    super.initState();

    apiUrlController.setApiUrl("${apiUrlController.page.value}/$symbol/0");
    stockController.fetchStocks(symbol);
  }

  @override
  Widget build(BuildContext context) {
    final stockItem = stockController.stockItems[symbol];
    var degisim = (stockItem?.close ?? 0) - (stockItem?.open ?? 0);
    return Scaffold(

      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10,),
                Text(
                  stockItem != null ? '${stockItem.close.toStringAsFixed(2)} TL' : 'Loading...',
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),


              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                Text(
                    stockItem != null ? "%${stockItem.getPercentage()}" : 'Loading...',
                    style: TextStyle(
                      color: stockItem != null ? stockItem.isUp() ? Colors.green : Colors.red : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(width: 10,),
                Text(stockItem?.time ?? 'Loading...'),
              ],
            ),


            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropDown(items: intervals, onItemClick: (value){
                  values.value = value;
                  print("value $value");
                  apiUrlController.setApiUrl("${apiUrlController.page.value}/$symbol/$value");
                  print(apiUrlController.apiUrl.value);
                },),
                datePicker(context , (picked){
                  if (picked != null) {
                    if (values.value == "0" && picked.duration.inDays > 2) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('1 dakikalık aralıkta en fazla 3 günlük veri seçebilirsiniz.')),
                      );
                    } else {
                      setState(() {
                        selectedDateRange = picked;
                      });
                      apiUrlController.setApiUrl("${apiUrlController.page.value}/$symbol/${values.value}/${picked.start.toIso8601String().split('T').first}/${picked.end.toIso8601String().split('T').first}");

                    }
                  }
                }),
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

                        if (apiUrlController.page.value == "mum_grafik") {
                          apiUrlController.setGrafikType("grafik2");
                          grafikText.value = "Mum Grafik";
                        } else {
                          apiUrlController.setGrafikType("mum_grafik");
                          grafikText.value = "Çizgi Grafik";
                        }



                      });
                    }
                ),



                IconButtonOne(icon: const Icon(Icons.fullscreen), onPressed: (){
                  Get.to(FullScreenGraph(urlApi: apiUrlController.apiUrl.value));
                }),

              ],
            ),

            const SizedBox(height: 20),
            StockInfoItem(label: "Açılış Değeri", value: "${stockItem?.open.toStringAsFixed(2)} TL" ?? "Loading..."),
            const SizedBox(height: 10),
            StockInfoItem(label: "Kapanış ", value: "${stockItem?.close.toStringAsFixed(2)} TL" ?? "Loading..."),
            const SizedBox(height: 10),
            StockInfoItem(label: "Değişim", value: "${degisim.toStringAsFixed(2)} TL"),
            const SizedBox(height: 10),
            StockInfoItem(label: "En Yüksek Değer", value: "${stockItem?.high.toStringAsFixed(2)} TL" ?? "Loading..."),
            const SizedBox(height: 10),
            StockInfoItem(label: "En Düşük Değer", value: "${stockItem?.low.toStringAsFixed(2)} TL" ?? "Loading..."),
            const SizedBox(height: 10),
            StockInfoItem(label: "Hacim", value: "${stockItem?.volume.toStringAsFixed(2)}" ?? "Loading..."),
            const SizedBox(height: 10),









          ],
        )),
      ),
    );
  }



  ElevatedButton datePicker(BuildContext context , Function(DateTimeRange? ) onPressed) {
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

                  onPressed(picked);
                },
                child: const Text('Tarih Aralığı Seç'),
              );
  }
}



