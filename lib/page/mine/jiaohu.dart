import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JiaohuPAge extends StatefulWidget {
  JiaohuPAge({Key key}) : super(key: key);

  @override
  _JiaohuPAgeState createState() => _JiaohuPAgeState();
}

class _JiaohuPAgeState extends State<JiaohuPAge> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static const String CHINAL_NAME = "example.mall/call_native"; //同步路径
  static const platform = const MethodChannel(CHINAL_NAME);
  String _result = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter和native通信"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("调用native 接口"),
            onPressed: () async {
              String result = await platform.invokeMethod("call_native_method");
              setState(() {
                _result = result;
                print("_result ---->" + _result);
              });
            },
          ),
          Text("result is:      " + _result),
          RaisedButton(
              child: Text('dianji'),
              onPressed: () async {
                String result = await platform.invokeMethod("call_native");
                setState(() {
                  _result = result;
                  print("_result ---->" + _result);
                });
              })
        ],
      ),
    );
  }
}
