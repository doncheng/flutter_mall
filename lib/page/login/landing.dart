import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/user_entity.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/page/login/phone_landing.dart';
import 'package:mall/service/user_service.dart';
import 'package:mall/utils/http_util.dart';

class landingPage extends StatefulWidget {
  landingPage({Key key}) : super(key: key);

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  double textfontsize = 12.0;
  double iconsize = 30;
  String systemVersion;
  HttpClient _httpClient = HttpClient();
  static const String CHINAL_NAME = "example.mall/call_native"; //同步路径
  static const platform = const MethodChannel(CHINAL_NAME);
  String _result = "";

  @override
  void initState() {
    super.initState();
    getSystemVersion();
  }

  void getSystemVersion() async {
    String result = await platform.invokeMethod("SystemVersion");
    setState(() {
      this.systemVersion = result;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账号登录'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 52),
            height: 100,
            width: 100,
            child: ClipOval(
              child: Image.asset(
                'images/icon.png',
                fit: BoxFit.cover,
              ),
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
                '手机登录',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        //导航打开新视图
                        builder: (context) => PhoneLanding()));

                // String result =
                //     await platform.invokeMethod("call_native_method");
                // setState(() {
                //   _result = result;
                //   print("_result ---->" + _result);
                // });
              },
            ),
          ),
          SizedBox(height: 82),
          Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 109,
                  height: 1,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Container(
                    width: 95,
                    height: 20,
                    child: Center(
                      child: Text(
                        '其他方式登录',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff6c6c6c)),
                      ),
                    )),
                Container(
                  width: 109,
                  height: 1,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 58),
          Platform.isIOS && double.parse(this.systemVersion) >= 13.0
              ? Container(
                  margin: EdgeInsets.only(left: 35, right: 35),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Alipaylanding(),
                      // WeChatlanding(),
                      Applelanding(),
                      // NoValidationlanding(),
                    ],
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(left: 35, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Alipaylanding(),
                      // WeChatlanding(),
                      // NoValidationlanding(),
                    ],
                  ))
        ],
      ),
    );
  }

  Alipaylanding() {
    return Column(
      children: <Widget>[
        Container(
            height: 44,
            width: 44,
            child: InkWell(
              child: Image.network(
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1816752600,129898364&fm=26&gp=0.jpg',
              ),
              onTap: () async {
                String result = await platform.invokeMethod("Alipaylanding");
                print(result);
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
    );
  }

  WeChatlanding() {
    return Column(
      children: <Widget>[
        Container(
            height: 44,
            width: 44,
            child: InkWell(
                child: Image.network(
                  'https://kf.qq.com/img/wechat.png',
                ),
                onTap: () async {
                  String result = await platform.invokeMethod("WeChatlanding");
                  print(result);
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
    );
  }

  Applelanding() {
    return Column(
      children: <Widget>[
        Container(
            height: 44,
            width: 44,
            child: InkWell(
                child: Image.network(
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1342457926,2446972823&fm=26&gp=0.jpg',
                ),
                onTap: () async {
                  String result = await platform.invokeMethod("Applelanding");
                  var url = Api.Apple_Verify;
                  _httpClient
                      .postUrl(Uri.parse(url))
                      .then((HttpClientRequest request) {
                    //这里添加POST请求Body的ContentType和内容
                    //这个是application/x-www-form-urlencoded数据类型的传输方式
                    request.headers.contentType =
                        ContentType("application", "x-www-form-urlencoded");
                    request.write("aud=com.JiaoYiBei&$result");
                    return request.close();
                  }).then((HttpClientResponse response) {
                    // Process the response.
                    // print(response.transform(utf8.decoder).join());
                    if (response.statusCode == 200) {
                      // ignore: unnecessary_statements
                      response
                          .transform(utf8.decoder)
                          .join()
                          .then((String string) async {
                        Map<String, dynamic> map = json.decode(string);
                        //登录成功回调
                        print(map['msg']);
                        if (map['msg'] == 'success') {
                          print('ssssss');
                          loginEventBus.fire(LoginEvent(
                            true,
                            url:
                                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2117319092,2336640022&fm=26&gp=0.jpg',
                            nickName: '苹果登录成功',
                            mytradingnum1: '1',
                            mytradingnum2: '2',
                            mytradingnum3: '3',
                            mytradingnum4: '4',
                            shoppingcartfootprintnum1: '1',
                            shoppingcartfootprintnum2: '2',
                            shoppingcartfootprintnum3: '3',
                            shoppingcartfootprintnum4: '4',
                          ));
                          Navigator.pop(context);
                        }
                      });
                    } else {
                      print("error");
                    }
                  });
                })),
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
    );
  }

  NoValidationlanding() {
    return Column(
      children: <Widget>[
        Container(
            height: 44,
            width: 44,
            child: InkWell(
              child: Image.network(
                  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1841811842,2320861044&fm=26&gp=0.jpg'),
              onTap: () async {
                String result =
                    await platform.invokeMethod("NoValidationlanding");
                print(result);
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
    );
  }
}
