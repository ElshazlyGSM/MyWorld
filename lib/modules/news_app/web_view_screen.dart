import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {

  late final String url;
  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}


// WebView(
// initialUrl: url,
// )