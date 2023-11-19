import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'adaptive_webview.dart'
    if (dart.library.io) 'adaptive_webview.dart'
    if (dart.library.html) 'widgets/platform_webview.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _webViewController;
  final TextEditingController _urlController =
      TextEditingController(text: 'https://flutter.dev');

  bool get _isMobile => kIsWeb ? false : Platform.isAndroid || Platform.isIOS;

  @override
  void initState() {
    super.initState();

    _loadingPage();
  }

  @override
  void dispose() {
    _urlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: _isMobile
                    ? WebViewWidget(controller: _webViewController)
                    : webView(_urlController.text)),
            Row(
              children: [
                const SizedBox(width: 24),
                Expanded(
                    child: TextField(
                  controller: _urlController,
                )),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_isMobile) {
                        _loadingPage();
                      }
                    });
                  },
                  child: const Text('Load'),
                ),
                const SizedBox(width: 24),
              ],
            ),
            Text(kIsWeb ? 'WEB' : Platform.operatingSystem),
            SizedBox(height: MediaQuery.of(context).padding.bottom)
          ],
        ));
  }

  void _loadingPage() {
    if (_isMobile) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse(_urlController.text));
    }
  }
}
