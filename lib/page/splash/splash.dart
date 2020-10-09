import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String deviceID;
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
    String result = await platform.invokeMethod("DeviceID");
    setState(() {
      this.deviceID = result;
    });
  }

  void detectUpdates() {
    HttpClient _httpClient = HttpClient();
//检测软件更新
    var url = '';
    _httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/x-www-form-urlencoded数据类型的传输方式
      request.headers.contentType =
          ContentType("application", "x-www-form-urlencoded");
      // request.write("phone=$phoneNumber&code=$code");
      request
          .write("packageVersion=$packageVersion&packageBuild=$packageBuild");
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
            // String token = map['data']['token'];
            // print('Token:$token');
            // loginEventBus.fire(LoginEvent(
            //   true,
            //   url:
            //       'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2117319092,2336640022&fm=26&gp=0.jpg',
            //   nickName: '手机登录成功',
            //   token: token,
            // ));
            // Navigator.pop(context);
          } else {
            Toast.show("参数错误", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          }
        });
      } else {
        Toast.show("服务器无响应", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
        print("error");
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getSystemVersion();
    getPackageVersion();
    getDeviceInfo();
    getPackageBuild();
    Future.delayed(Duration(seconds: 1), () {
      print(Platform.isIOS ? 'IOS' : 'Android');
      print(systemVersion);
      print(packageVersion);
      print(deviceID);
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
          : detectUpdates();
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
