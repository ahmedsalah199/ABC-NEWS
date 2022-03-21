import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebNews extends StatelessWidget {
  final String url;
  const WebNews( this.url ,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABC News"),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
      )
    );
  }
}
