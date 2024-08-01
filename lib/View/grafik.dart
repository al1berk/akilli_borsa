import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CizgiGrafik extends StatelessWidget {
  final String urlApi;
  const CizgiGrafik({super.key, required this.urlApi});



  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
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
      );

    controller.loadRequest(Uri.parse('https://aliberk.pythonanywhere.com/$urlApi'));
    print('https://aliberk.pythonanywhere.com/$urlApi');
    return Container(
      width: MediaQuery.of(context).size.width *9.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: WebViewWidget(controller: controller),
    );
  }
}