import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          height: 500,
          width: double.infinity,
          color: Colors.red,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
