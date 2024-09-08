import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class GraphWidget extends StatefulWidget {
  final String graphHtml;

  const GraphWidget({Key? key, required this.graphHtml}) : super(key: key);

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      _controller = WebViewController.fromPlatformCreationParams(
        WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        ),
      );
    } else {
      _controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams(),
      );
    }

    // Configure the controller
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar if needed.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.dataFromString(
        widget.graphHtml,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Graph')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
