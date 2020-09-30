import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Webview_flutter_plus extends StatelessWidget {
  const Webview_flutter_plus({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebViewPlus(
          initialUrl: url,
          // onWebViewCreated: (controller) {
          //   this._controller = controller;
          // },
        ));
  }
}
