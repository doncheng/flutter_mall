import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// ignore: camel_case_types
class webviewPage extends StatefulWidget {
  webviewPage({Key key}) : super(key: key);

  @override
  _webviewPageState createState() => _webviewPageState();
}

// ignore: camel_case_types
class _webviewPageState extends State<webviewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ss'),
          centerTitle: true,
        ),
        body: WebviewScaffold(
          url: 'http://baidu.com',
          withZoom: false,
          withLocalStorage: true,
          withJavascript: true,
        ),
      ),
    );
  }
}
