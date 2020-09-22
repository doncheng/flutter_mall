import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

/* ******
 * 
 * 扫码
 * 
 * ******/
class SaveLocalDataPage extends StatefulWidget {
  SaveLocalDataPage({Key key}) : super(key: key);

  _SaveLocalDataPageState createState() => _SaveLocalDataPageState();
}

class _SaveLocalDataPageState extends State<SaveLocalDataPage> {
  String _scanResultStr = "";

  //扫码
  Future _scan() async {
    //利用try-catch来进行异常处理
    try {
      //调起摄像头开始扫码
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this._scanResultStr = barcode;
      });
    } on PlatformException catch (e) {
      //如果没有调用摄像头的权限，则提醒
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this._scanResultStr =
              'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this._scanResultStr = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() => this._scanResultStr =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this._scanResultStr = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("本地数据存储")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _scan();
            },
            child: Text("扫码"),
          ),
          Text(_scanResultStr),
        ],
      ),
    );
  }
}
