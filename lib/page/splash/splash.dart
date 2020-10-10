import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mall/api/api.dart';
import 'package:mall/page/home/webview.dart';
import 'package:mall/utils/navigator_util.dart';
import 'dart:io';

import 'package:package_info/package_info.dart';
import 'package:toast/toast.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String systemVersion;
  String packageVersion;
  String packageBuild;
  String device_id;
  String imei;
  String idfa;
  String model;
  String clipboardData;
  int device_type = Platform.isIOS ? 2 : 1;

  static const String CHINAL_NAME = "example.mall/call_native"; //同步路径
  static const platform = const MethodChannel(CHINAL_NAME);
  String _result = "";

  void getPackageVersion() async {
    String result = await platform.invokeMethod("PackageVersion");
    setState(() {
      this.packageVersion = result;
    });
  }

  void getPackageBuild() async {
    String result = await platform.invokeMethod("PackageBuild");
    setState(() {
      this.packageBuild = result;
    });
  }

  void getSystemVersion() async {
    String result = await platform.invokeMethod("SystemVersion");
    setState(() {
      this.systemVersion = result;
    });
  }

  void getDeviceInfo() async {
    String result = await platform.invokeMethod("device_id");
    setState(() {
      this.device_id = result;
    });
  }

  void getAndroidDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    String imei = androidDeviceInfo.id;
    print(imei);
    setState(() {
      this.imei = imei;
    });
  }

  void getIdfa() async {
    String result = await platform.invokeMethod("idfa");
    setState(() {
      this.idfa = result;
    });
  }

  void getModel() async {
    String result = await platform.invokeMethod("model");
    setState(() {
      this.model = result;
    });
  }

  ///使用异步调用获取返回值
  void getClipboardDatas() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    setState(() {
      this.clipboardData = data.text;
    });
  }

  void detectUpdates() {
    HttpClient _httpClient = HttpClient();
//检测软件更新
    var url = Api.Update;
    _httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/x-www-form-urlencoded数据类型的传输方式
      request.headers.contentType = ContentType("application", "raw");
      // request.write("phone=$phoneNumber&code=$code");
      String clipboardDataUtf8Encoder =
          jsonEncode(Utf8Encoder().convert(this.clipboardData));
      print("这是clipboardData编码$clipboardDataUtf8Encoder");
      request.write(
          "{\"imei\":\"$imei \",\"idfa\":\"$idfa\",\"deviceId\":\"$device_id\",\"userVersion\":\"$packageVersion\",\"deviceType\":\"$device_type\",\"model\":\"$systemVersion\",\"channel\":\"$clipboardDataUtf8Encoder\",\"build\":\"$packageBuild\"}");
      return request.close();
    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
        // ignore: unnecessary_statements
        response.transform(utf8.decoder).join().then((String string) async {
          Map<String, dynamic> map = json.decode(string);
          //登录成功回调
          // print(map);
          if (map['errno'] == 0) {
            NavigatorUtils.goMallMainPage(context);
          } else {
            print(map);
            Toast.show("请更新软件", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        });
      } else {
        Toast.show("服务器无响应", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        print("error");
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      getDeviceInfo();
    } else if (Platform.isAndroid) {
      getAndroidDeviceInfo();
    }
    getIdfa();
    getPackageVersion();
    getSystemVersion();
    getClipboardDatas();
    getPackageBuild();

    // getModel();

    Future.delayed(Duration(seconds: 1), () {
      print(imei);
      print(idfa);
      print(device_id);
      print(packageVersion);
      print(device_type);
      print(systemVersion);
      print(clipboardData);
      print(packageBuild);
      // Platform.isIOS
      //     ? NavigatorUtils.goMallMainPage(context)
      //     : Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             //导航打开新视图
      //             builder: (context) => webviewPage()));

      Platform.isAndroid
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  //导航打开新视图
                  builder: (context) => webviewPage()))
          : NavigatorUtils.goMallMainPage(context);
      // detectUpdates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Scaffold(
            body: Container(
              color: Colors.deepOrangeAccent,
              child: Image.asset(
                "images/splash.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 80, right: 80),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/icon.png",
                      width: 250,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  '交易呗',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
  }
}
