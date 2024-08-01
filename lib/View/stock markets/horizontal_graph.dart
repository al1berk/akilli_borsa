import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullScreenGraph extends StatefulWidget {
  final String urlApi;
  const FullScreenGraph({super.key, required this.urlApi});

  @override
  _FullScreenGraphState createState() => _FullScreenGraphState();
}

class _FullScreenGraphState extends State<FullScreenGraph> {
  @override
  void initState() {
    super.initState();
    // Sayfa yatay modda görüntülenmesi için SystemChrome kullanma
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    // Yönlendirmeyi eski haline getirmek için dispose metodu
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CizgiGrafik2(urlApi: widget.urlApi),
    );
  }
}

class CizgiGrafik2 extends StatelessWidget {
  final String urlApi;
  const CizgiGrafik2({super.key, required this.urlApi});

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

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
