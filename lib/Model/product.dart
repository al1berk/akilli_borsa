import 'dart:convert';
import 'package:akilli_borsa/Controller/firestore_controller.dart';
import 'package:crypto/crypto.dart';

class Product {
  final String productID;
  final String productName;
  final double price;
  final double rating;
  final List<String> images;
  final String description;

  Product({
    required this.productID,
    required this.productName,
    required this.price,
    required this.rating,
    required this.images,
    required this.description,
  });
}

class Products {
  late Product rsiRobot;
  late Product macdRobot;
  late Product bollingerRobot;
  late Product movingAverageRobot;
  late Product stochasticRobot;
  late Product fibonacciRobot;
  late Map<String, Product> productMap;


  Products() {
    // RSI Robotu
    rsiRobot = Product(
      productID: nameToHash("RSI Robotu"),
      productName: "RSI Robotu",
      price: 1000,
      rating: 4.5,
      images: [
        "assets/images/rsi_robot_1.jpg",
        "assets/images/rsi_robot_2.jpg",
        "assets/images/rsi_robot_3.jpg",
      ],
      description: "RSI Robotu, belirlediğiniz tarih aralığındaki hisselerin RSI (Relative Strength Index) değerlerini otomatik olarak hesaplar. Bu robot, geçmiş verilere dayanarak alım-satım işlemlerini simüle eder ve belirlediğiniz RSI kriterlerine göre potansiyel kazanç veya kaybınızı hesaplar. Yatırım stratejilerinizi optimize etmek için ideal bir araçtır.",
    );

    // MACD Robotu
    macdRobot = Product(
      productID: nameToHash("MACD Robotu"),
      productName: "MACD Robotu",
      price: 1200,
      rating: 4.6,
      images: [
        "assets/images/macd_robot_1.jpg",
        "assets/images/macd_robot_2.jpg",
        "assets/images/macd_robot_3.jpg",
      ],
      description: "Bu robot, MACD göstergesine göre hisse senetlerinin momentumunu analiz eder. Hareketli ortalamalar arasındaki yakınsama ve ıraksama ile alım-satım sinyalleri oluşturur. MACD stratejinize göre potansiyel kazanç veya kayıplarınızı hesaplayarak kararlarınızı optimize etmenize yardımcı olur."
    );

    // Bollinger Bantları Robotu
    bollingerRobot = Product(
      productID: nameToHash("Bollinger Bantları Robotu"),
      productName: "Bollinger Bantları Robotu",
      price: 1100,
      rating: 4.7,
      images: [
        "assets/images/bollinger_robot_1.jpg",
        "assets/images/bollinger_robot_2.jpg",
        "assets/images/bollinger_robot_3.jpg",
      ],
      description: "Bollinger Bantlarını kullanarak, hisse senedi fiyatlarının dalgalanmalarını analiz eden bu robot, üst ve alt bantlara göre fiyat hareketlerini değerlendirir. Fiyatın bu bantların dışına çıkma olasılığına göre potansiyel alım-satım fırsatlarını belirler. Bollinger Bantlarına göre belirlenen sinyallere göre alım-satım işlemlerini simüle eder ve potansiyel kazanç veya kayıplarınızı hesaplar."
    );

    // Hareketli Ortalama Kesişimi Robotu
    movingAverageRobot = Product(
      productID: nameToHash("Hareketli Ortalama Kesişimi Robotu"),
      productName: "Hareketli Ortalama Kesişimi Robotu",
      price: 900,
      rating: 4.4,
      images: [
        "assets/images/moving_average_robot_1.jpg",
        "assets/images/moving_average_robot_2.jpg",
        "assets/images/moving_average_robot_3.jpg",
      ],
      description: "Hareketli Ortalama Kesişimi Robotu, belirlediğiniz periyotlardaki hareketli ortalamaların kesişimlerine dayalı alım-satım sinyalleri üretir. Hareketli ortalamaların kesişimlerine göre alım-satım işlemlerini simüle eder ve potansiyel kazançlarınızı hesaplar."

    );

    // Stokastik Osilatör Robotu
    stochasticRobot = Product(
      productID: nameToHash("Stokastik Osilatör Robotu"),
      productName: "Stokastik Osilatör Robotu",
      price: 950,
      rating: 4.5,
      images: [
        "assets/images/stochastic_robot_1.jpg",
        "assets/images/stochastic_robot_2.jpg",
        "assets/images/stochastic_robot_3.jpg",
      ],
      description: "Hisselerin aşırı alım ve aşırı satım seviyelerini analiz eden bu robot, stokastik osilatör göstergesine göre alım-satım sinyalleri üretir. Yatırım stratejinizi geçmiş verilere dayalı olarak test ederek kazanç potansiyelinizi hesaplar."
    );

    // Fibonacci Geri Çekilme Robotu
    fibonacciRobot = Product(
      productID: nameToHash("Fibonacci Geri Çekilme Robotu"),
      productName: "Fibonacci Geri Çekilme Robotu",
      price: 1050,
      rating: 4.6,
      images: [
        "assets/images/fibonacci_robot_1.jpg",
        "assets/images/fibonacci_robot_2.jpg",
        "assets/images/fibonacci_robot_3.jpg",
      ],
      description:   "Bu robot, Fibonacci geri çekilme seviyelerine göre potansiyel destek ve direnç noktalarını belirleyerek alım-satım stratejilerinizi optimize eder. Belirlenen seviyelere dayalı olarak simüle edilen alım-satım işlemlerinin sonuçlarını hesaplar."
    );

    productMap = {
      rsiRobot.productID: rsiRobot,
      macdRobot.productID: macdRobot,
      bollingerRobot.productID: bollingerRobot,
      movingAverageRobot.productID: movingAverageRobot,
      stochasticRobot.productID: stochasticRobot,
      fibonacciRobot.productID: fibonacciRobot,
    };
  }



  String nameToHash(String productName) {
    var bytes = utf8.encode(productName);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  List<String> productNames(List<String> productIDs) {
    List<String> productNames = [];
    for (String productID in productIDs) {
      productNames.add(productMap[productID]!.productName);
    }

    print("Product Names " + productNames.toString());
    print("Product IDs " + productIDs.toString());
    return productNames;
  }
}