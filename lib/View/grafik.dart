import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // SystemChrome için gerekli kütüphane
import 'package:webview_flutter/webview_flutter.dart';

class cizgi_grafik extends StatelessWidget {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {

        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;

        },
      ),
    )
    ..loadRequest(Uri.parse('https://aliberk.pythonanywhere.com/grafik2'));

  @override
  Widget build(BuildContext context) {
    // Yatay görüntülemeyi etkinleştir
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('Çizgi Grafik'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
