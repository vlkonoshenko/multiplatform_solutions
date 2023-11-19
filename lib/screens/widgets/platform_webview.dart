import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {
  final String link;
  const WebPlatformWebView({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        link, (int viewId) => html.IFrameElement()..src = link);
    return HtmlElementView(viewType: link);
  }
}
