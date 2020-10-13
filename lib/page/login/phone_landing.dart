import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/user_entity.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/model/user_info.dart';
import 'package:mall/service/user_service.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/widgets/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

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
  UserEntity userEntity;
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController _accountTextControl = TextEditingController();
  TextEditingController _passwordTextControl = TextEditingController();
  UserService userService = UserService();
  bool _autovalidator = false;

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
  String verificationcode; //验证码
  var token;
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
          padding: EdgeInsets.only(left: 15, top: 17, bottom: 0),
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
            controller: _accountTextControl,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffb0b0b0), width: 0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 17, right: 10),
                  padding: EdgeInsets.only(left: 5),
                  height: 20,
                  width: 150,
                  child: TextField(
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      WhitelistingTextInputFormatter(
                          RegExp("[0-9.]")), //只允许输入小数
                    ],
                    onChanged: (value) {
                      this.code = value;
                    },
                    style: TextStyle(fontSize: 14, color: Color(0xffbfbfbf)),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '请输入验证码'),
                    controller: _passwordTextControl,
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10, top: 10, right: 7, bottom: 10),
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
                    RegExp exp = RegExp(
                        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
                    bool matched = exp.hasMatch(_accountTextControl.text);
                    if (!matched) {
                      Toast.show("请输入正确的手机号", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                    } else {
                      //获取验证码接口
                      var url = Api.NoteCodePost;
                      _httpClient
                          .postUrl(Uri.parse(url))
                          .then((HttpClientRequest request) {
                        //这里添加POST请求Body的ContentType和内容
                        //这个是application/x-www-form-urlencoded数据类型的传输方式
                        request.headers.contentType =
                            ContentType("application", "x-www-form-urlencoded");

                        request.write("phone=$phoneNumber");
                        return request.close();
                      }).then((HttpClientResponse response) {
                        print(response.statusCode);
                        if (response.statusCode == 200) {
                          // ignore: unnecessary_statements
                          response
                              .transform(utf8.decoder)
                              .join()
                              .then((String string) async {
                            Map<String, dynamic> map = json.decode(string);
                            //登录成功回调
                            // print('ooooooo');
                            // print(map['errno']);
                            if (map['errno'] == 0) {
                              // if (_countdownTime == 0) {
                              //Http请求发送验证码
                              //...
                              Toast.show("发送成功", context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.CENTER);
                              setState(() {
                                _countdownTime = 60;
                              });
                              //开始倒计时
                              startCountdownTimer();
                              // }
                            }
                          });
                        } else {
                          print("服务器回调失败");
                        }
                      });
                    }
                  },
                )
              ],
            )),
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 35),
          child: RaisedButton(
              color: check1 == 0 ? Colors.grey : Color(0xffcf1322),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                '立即登录',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                verificationCode();
                // if (check1 == 1) {
                //   //判断手机号是否正确
                //   RegExp exp = RegExp(
                //       r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
                //   bool matched = exp.hasMatch(_accountTextControl.text);
                //   if (!matched) {
                //     Toast.show("请输入正确的手机号", context,
                //         duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                //   } else if (code == "") {
                //     Toast.show("请输入验证码", context,
                //         duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                //   } else {
                //     verificationCode();
                //   }
                // }
              }),
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

  verificationCode() {
    //验证手机号与验证码接口
    var url = Api.NoteVerity;
    _httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/x-www-form-urlencoded数据类型的传输方式
      request.headers.contentType =
          ContentType("application", "x-www-form-urlencoded");
      // request.write("phone=$phoneNumber&code=$code");
      request.write("phone=13073078664&code=4329");
      return request.close();
    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
        // ignore: unnecessary_statements
        response.transform(utf8.decoder).join().then((String string) async {
          Map<String, dynamic> map = json.decode(string);
          //登录成功回调
          // print(map);
          if (map['errno'] == 0) {
            String token = map['data']['token'];
            setState(() {
              this.token = token;
            });
            print('Token:$token');
            _saveUserInfo();
            loginEventBus.fire(LoginEvent(
              true,
              url:
                  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2117319092,2336640022&fm=26&gp=0.jpg',
              nickName: '手机登录成功',
              token: token,
            ));
            Navigator.pop(context);
          } else {
            Toast.show("验证码或手机号不正确", context,
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

  _saveUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(this.token);
    SharedPreferencesUtils.token = this.token;
    final setTokenResult =
        await sharedPreferences.setString(Strings.TOKEN, this.token);
    if (setTokenResult) {
      debugPrint('保存登录token成功');
    } else {
      debugPrint('error, 保存登录token失败');
    }

    // await sharedPreferences.setString(
    //     Strings.HEAD_URL, userEntity.userInfo.avatarUrl);
    // await sharedPreferences.setString(
    //     Strings.NICK_NAME, userEntity.userInfo.nickName);
  }
}
