import 'package:akilli_borsa/Controller/analysis_info_controller.dart';
import 'package:akilli_borsa/Controller/api_url_controller.dart';
import 'package:akilli_borsa/Controller/firestore_controller.dart';
import 'package:akilli_borsa/Controller/selectable_drop_down_controller.dart';
import 'package:akilli_borsa/Controller/user_controller.dart';
import 'package:akilli_borsa/Model/product.dart';
import 'package:akilli_borsa/Model/stock.dart';
import 'package:akilli_borsa/View/Widgets/buying_selling_data_list.dart';
import 'package:akilli_borsa/View/Widgets/drop_down.dart';
import 'package:akilli_borsa/View/Widgets/text_fields.dart';
import 'package:akilli_borsa/View/grafik.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akilli_borsa/View/stock markets/stock_detail.dart';
import '../../Controller/stock_controller.dart';
import '../Widgets/buttons.dart';
import '../Widgets/navigation_bar.dart';
import 'horizontal_graph.dart';

class AnalysisPage extends StatefulWidget {
  final String symbol ;
   AnalysisPage({super.key , required this.symbol});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}
class _AnalysisPageState extends State<AnalysisPage> {

  StockController stockController = Get.find();
  ApiUrlController apiUrlController = Get.find();
  List<String> items = ['1 Dakika', '2 Dakika', '5 Dakika', '15 Dakika', '30 Dakika', '1 Saat', '1 Gün'];
  SelectableDropDownController selectableDropDownController = Get.put(SelectableDropDownController());
  TextEditingController RSIBuyValueController = TextEditingController();
  var selectedRobot = [].obs;
  var endDate = "1".obs;
  var startDate = "1".obs;
  var values = "0".obs;
  var robotStarted = false.obs;
  AnalysisInfoController analysisInfoController = Get.put(AnalysisInfoController());
  Products products = Products();
  FirestoreController firestoreController = Get.put(FirestoreController());
  UserController userController = Get.find();
  DateTimeRange? selectedDateRange;
  TextEditingController targetPriceController = TextEditingController();
  TextEditingController stopLossController = TextEditingController();



  @override
  void initState() {
    String symbol = widget.symbol;
    super.initState();
    Future.delayed(Duration.zero, () {
      apiUrlController.setApiUrl("${apiUrlController.page.value}/$symbol/0");
    });
    firestoreController.getUserTools(userController.user.value!.userID);



  }


  @override
  Widget build(BuildContext context) {
    String symbol = widget.symbol;
    return Scaffold(

       bottomNavigationBar: const BottomNavigationBarWidget(),
      body:  Center(
       child: SingleChildScrollView(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   DropDown(items: items, onItemClick: (value){
                     values.value = value;
                     apiUrlController.setApiUrl("${apiUrlController.page.value}/$symbol/$value");
                   }),
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
                         endDate.value = picked.end.toIso8601String().split('T').first;
                         startDate.value = picked.start.toIso8601String().split('T').first;
                         apiUrlController.setApiUrl("${apiUrlController.page.value}/$symbol/${values.value}/${picked.start.toIso8601String().split('T').first}/${picked.end.toIso8601String().split('T').first}");

                       }
                     }
                   }),

                 ],

               ),
               Obx((){
                 return CizgiGrafik(urlApi: apiUrlController.apiUrl.value);
               }),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [

                   MultiSelectableDropDown(items: firestoreController.userToolsName, onItemsSelected: (selectedItems){
                     selectedRobot.value = selectedItems;
                   },)
                   ,
                   IconButtonOne(icon: const Icon(Icons.fullscreen), onPressed: (){
                     Get.to(FullScreenGraph(urlApi: apiUrlController.apiUrl.value));
                   }),
                 ],
               ),
               SizedBox(height: 20),

               Obx((){
                 print(selectableDropDownController.selectedItems);
                 return Column(
                   children: [
                     const Align(
                       alignment: Alignment.centerLeft,
                       child: Text("Kar Zarar Satış Oranları ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                     ),
                     Row(
                       children: [
                          TextFieldOne(labelText: "Hedef Oran", hintText: "Örn: 1.5", controller: targetPriceController, onChanged: (value){print("Hedef Fiyat");} , width: 0.45),
                          TextFieldOne(labelText: "Stop Loss", hintText: "Örn: 0.75", controller: stopLossController, onChanged: (value){print("Stop Loss");}, width: 0.45),
                       ],
                     ),
                     if (selectableDropDownController.selectedItems.contains("RSI Robotu"))
                       RSIWidget(RSIBuyValueController: RSIBuyValueController),

                     ButtonOne(text: "Çalıştır", onPressed: (){

                       apiUrlController.setApiUrl("rsi/$symbol.IS/${values.value}/${startDate.value}/${endDate.value}/${targetPriceController.text}/${stopLossController.text}/${RSIBuyValueController.text}");
                       analysisInfoController.fetchAnalysisInfo("https://aliberk.pythonanywhere.com/rsi/data/$symbol.IS/${values.value}/${startDate.value}/${endDate.value}/${targetPriceController.text}/${stopLossController.text}/${RSIBuyValueController.text}");
                       print("deneme"+analysisInfoController.data["butce"].toString());

                       robotStarted.value = true;

                       print(apiUrlController.apiUrl.value);

                     }),
                     SizedBox(height: 20),

                     if (robotStarted.value)
                       Column(
                         children: [
                           const Align(
                             alignment: Alignment.centerLeft,
                             child: Text("Robot Sonuçları", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                           ),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start, // Aligns content to the left
                             children: [
                               CustomText(
                                 label: "Toplam Kar: ${analysisInfoController.calculateProfit()}",
                                 color: Colors.green,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                               ),
                               CustomText(
                                 label: "Bütçe: ${analysisInfoController.data["butce"].toStringAsFixed(2)}",
                                 color: Colors.blueGrey,
                               ),
                               CustomText(
                                 label: "Kârla Satış: ${analysisInfoController.win}",
                                 color: Colors.green,
                               ),
                               CustomText(
                                 label: "Zararla Satış: ${analysisInfoController.loss}",
                                 color: Colors.red,
                               ),
                               const SizedBox(height: 20), // Adds spacing before the list
                               BuyingSellingDataList(buyingSellingData: analysisInfoController.data["islemler"]),
                             ],
                           )

                         ],
                       )

                   ],
                 );

               })

             ]
         ),
       )
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

class RSIWidget extends StatelessWidget {
  final TextEditingController RSIBuyValueController;
  RSIWidget({super.key, required this.RSIBuyValueController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Opsiyonel: Padding ekleyebilirsiniz
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Sol kenara hizalama
        children: [
          const Text(
            "RSI Robotu Ayarları",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text("RSI değeri bu değerin altına düştüğünde alım yapılacaktır."),


          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFieldOne(
                labelText: "RSI Alım Değeri",
                hintText: "Örn: 30",
                controller: RSIBuyValueController,
                onChanged: (value) {
                  print("RSI alış değeri");
                },
              ),


            ],
          ),


        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Color> gradientColors; // Gradient background colors
  final IconData? icon; // Optional icon to display before the text
  final double borderRadius;

  const CustomText({
    super.key,
    required this.label,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.gradientColors = const [Colors.white, Colors.white],
    this.icon,
    this.borderRadius = 12.0, // Increased border radius for smoother look
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 8), // More vertical spacing for separation
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Larger padding for content spacing
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: color, size: fontSize + 4), // Add icon if provided
            const SizedBox(width: 10), // Spacing between icon and text
          ],
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight,
                fontFamily: 'Roboto', // Still customizable font
              ),
            ),
          ),
        ],
      ),
    );
  }
}



