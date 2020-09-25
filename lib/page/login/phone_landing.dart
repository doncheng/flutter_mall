import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/api/api.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/widgets/webview.dart';

class PhoneLanding extends StatelessWidget {
  const PhoneLanding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        // title: Text(
        //   '绑定手机号',
        //   style: TextStyle(color: Colors.black, fontSize: 18),
        // ),
        // centerTitle: true,
      ),
      body: Landingbody(),
    );
  }
}

class Landingbody extends StatefulWidget {
  Landingbody({Key key}) : super(key: key);

  @override
  _LandingbodyState createState() => _LandingbodyState();
}

class _LandingbodyState extends State<Landingbody> {
  Timer _timer;
  int _countdownTime = 0;
  HttpClient _httpClient = HttpClient();

  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);

    var callback = (timer) => {
          setState(() {
            if (_countdownTime < 1) {
              _timer.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  int check1 = 0;
  String phoneNumber = '';
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 15),
          constraints: BoxConstraints(
              maxHeight: double.infinity, maxWidth: double.infinity),
          child: Text(
            '手机号登录',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffb0b0b0), width: 0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(20),
          height: 40,
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 0),
          child: TextField(
            inputFormatters: [
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter(RegExp("[0-9.]")), //只允许输入小数
            ],
            onChanged: (number) {
              phoneNumber = number;
            },
            style: TextStyle(fontSize: 14, color: Colors.grey),
            decoration:
                InputDecoration(border: InputBorder.none, hintText: '输入手机号'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffbbbbbb), width: 0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                    height: 20,
                    width: 150,
                    child: TextField(
                      onChanged: (value) {
                        code = value;
                      },
                      style: TextStyle(fontSize: 14, color: Color(0xffbfbfbf)),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '请输入验证码'),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 20, bottom: 10),
                      height: 20,
                      width: 100,
                      child: Center(
                        child: Text(
                          _countdownTime > 0 ? '$_countdownTime后重新获取' : '获取验证码',
                          style: TextStyle(
                              fontSize: 14,
                              color: _countdownTime > 0
                                  ? Color.fromARGB(255, 183, 184, 195)
                                  : Colors.blue),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_countdownTime == 0) {
                        //Http请求发送验证码
                        //...
                        Fluttertoast.showToast(
                            msg: "发送成功",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            textColor: Colors.white,
                            backgroundColor: Colors.grey);
                        setState(() {
                          _countdownTime = 60;
                        });
                        //开始倒计时
                        startCountdownTimer();
                      }
                    },
                  )
                ],
              )),
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 35),
          child: RaisedButton(
            color: check1 == 0 ? Colors.grey : Color(0xffcf1322),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text(
              '立即登录',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              _login();
              // if (check1 == 1) {
              //   if (phoneNumber != "" && phoneNumber.length != 11) {
              //     Fluttertoast.showToast(
              //         msg: "请输入正确的手机号",
              //         toastLength: Toast.LENGTH_SHORT,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIos: 1,
              //         textColor: Colors.white,
              //         backgroundColor: Colors.grey);
              //   } else if (phoneNumber == "") {
              //     Fluttertoast.showToast(
              //         msg: "手机号不能为空",
              //         toastLength: Toast.LENGTH_SHORT,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIos: 1,
              //         textColor: Colors.white,
              //         backgroundColor: Colors.grey);
              //   } else if (code == "") {
              //     Fluttertoast.showToast(
              //         msg: "请输入验证码",
              //         toastLength: Toast.LENGTH_SHORT,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIos: 1,
              //         textColor: Colors.white,
              //         backgroundColor: Colors.grey);
              //   } else if (code != "网上获取的验证码") {
              //     Fluttertoast.showToast(
              //         msg: "验证码不正确",
              //         toastLength: Toast.LENGTH_SHORT,
              //         gravity: ToastGravity.BOTTOM,
              //         timeInSecForIos: 1,
              //         textColor: Colors.white,
              //         backgroundColor: Colors.grey);
              //   } else {
              //     // Fluttertoast.showToast(
              //     //     msg: "网络连接错误",
              //     //     toastLength: Toast.LENGTH_SHORT,
              //     //     gravity: ToastGravity.BOTTOM,
              //     //     timeInSecForIos: 1,
              //     //     textColor: Colors.white,
              //     //     backgroundColor: Colors.grey);
              //     // _login();
              //   }
              // }
            },
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (check1 == 1) {
                    check1 = 0;
                  } else {
                    check1 = 1;
                  }
                });
              },
              child: Icon(
                Icons.check_circle,
                color: check1 == 1 ? Colors.blue : Colors.grey,
              ),
            ),
            Container(
              child: Text('我已阅读并同意'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WebViewPage('https://www.baidu.com/', "用户协议")));
              },
              child: Text(
                '用户协议',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        )
      ],
    );
  }

  _login() async {
    var url = Api.LOGIN;
    _httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/x-www-form-urlencoded数据类型的传输方式
      request.headers.contentType = ContentType("application", "raw");
      request.write("{\"username\":\"user123\",\"password\":\"user123\"}");
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        // ignore: unnecessary_statements
        response.transform(utf8.decoder).join().then((String string) {
          Map<String, dynamic> map = json.decode(string);
          //传值给mine.dart
          loginEventBus.fire(LoginEvent(
            true,
            // url: map['data']['userInfo']['avatarUrl'],

            url:
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2117319092,2336640022&fm=26&gp=0.jpg',
            nickName: map['data']['userInfo']['nickName'],
          ));
          print(map['data']['userInfo']['avatarUrl']);
          // print(map['data']['userInfo']['nickName']);
        });
      } else {
        print("error");
      }
    });

    Navigator.pop(context);
  }
}
/*
RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <InlineSpan>[
                      
                      
                    ]),
              )
*/