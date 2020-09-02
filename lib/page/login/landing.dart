import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

// void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));
// Widget _widgetForRoute(String route) {
//   switch (route) {
//     case 'landingPage':
//       return new landingPage();
//     // case 'home':
//     //   return new HomePage();
//     default:
//       return Center(
//         child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
//       );
//   }
// }

class landingPage extends StatefulWidget {
  landingPage({Key key}) : super(key: key);

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  double textfontsize = 12.0;
  double iconsize = 30;

  // static const methodChannel = const MethodChannel('com.pages.your/native_get');
  // _iOSPushToVC() async {
  //   await methodChannel.invokeMethod('iOSFlutter', '参数');
  // }

  // _iOSPushToVC1() async {
  //   Map<String, dynamic> map = {
  //     "code": "200",
  //     "data": [1, 2, 3]
  //   };
  //   await methodChannel.invokeMethod('iOSFlutter1', map);
  // }
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
    return Scaffold(
      appBar: AppBar(
        title: Text('账号登陆'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 52),
            height: 100,
            width: 100,
            child: CircleAvatar(
              child: Icon(Icons.home),
            ),
          ),
          SizedBox(height: 69),
          Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            width: 352,
            height: 45,
            child: RaisedButton(
              color: Colors.red,
              child: Text(
                '手机一键登陆',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () async {
                String result =
                    await platform.invokeMethod("call_native_method");
                setState(() {
                  _result = result;
                  print("_result ---->" + _result);
                });
              },
            ),
          ),
          Text("result is:      " + _result),
          SizedBox(height: 82),
          Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 120,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Text(
                  '其他方式登陆',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Container(
                  width: 120,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 58),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: 44,
                      width: 44,
                      child: InkWell(
                        child: Image.network(
                          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1816752600,129898364&fm=26&gp=0.jpg',
                        ),
                        onTap: () async {
                          String result =
                              await platform.invokeMethod("Alipaylanding");
                        },
                      )),
                  SizedBox(height: 10),
                  Container(
                      height: 20,
                      width: 42,
                      child: Center(
                        child: Text(
                          '支付宝',
                          style: TextStyle(
                            fontSize: this.textfontsize,
                          ),
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 44,
                      width: 44,
                      child: InkWell(
                          child: Image.network(
                            'https://kf.qq.com/img/wechat.png',
                          ),
                          onTap: () async {
                            String result =
                                await platform.invokeMethod("WeChatlanding");
                          })),
                  SizedBox(height: 10),
                  Container(
                      height: 20,
                      width: 42,
                      child: Center(
                        child: Text(
                          '微信',
                          style: TextStyle(
                            fontSize: this.textfontsize,
                          ),
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 44,
                    width: 44,
                    child: InkWell(
                      child: Image.network(
                        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1342457926,2446972823&fm=26&gp=0.jpg',
                      ),
                      onTap: () async {
                        String result =
                            await platform.invokeMethod("Applelanding");
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      height: 20,
                      width: 42,
                      child: Center(
                        child: Text(
                          'Apple',
                          style: TextStyle(
                            fontSize: this.textfontsize,
                          ),
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 44,
                      width: 44,
                      child: InkWell(
                        child: Image.network(
                          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1200407102,3124617923&fm=26&gp=0.jpg',
                        ),
                        onTap: () async {
                          String result = await platform
                              .invokeMethod("NoValidationlanding");
                        },
                      )),
                  SizedBox(height: 10),
                  Container(
                      height: 20,
                      width: 42,
                      child: Center(
                        child: Text(
                          '免验证',
                          style: TextStyle(
                            fontSize: this.textfontsize,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
