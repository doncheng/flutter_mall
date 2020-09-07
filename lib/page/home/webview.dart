import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

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
        // appBar: AppBar(
        //   title: Text('ss'),
        //   centerTitle: true,
        // ),
        body: WebviewScaffold(
          url: 'http://103.44.23.34:8040',
          withZoom: false,
          withLocalStorage: true,
          withJavascript: true,
        ),
      ),
    );
  }
}
