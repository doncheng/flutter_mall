import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class UserPhonePage extends StatelessWidget {
  const UserPhonePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        title: Text(
          '绑定手机号',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: PhoneBody(),
    );
  }
}

class PhoneBody extends StatefulWidget {
  PhoneBody({Key key}) : super(key: key);

  @override
  _PhoneBodyState createState() => _PhoneBodyState();
}

class _PhoneBodyState extends State<PhoneBody> {
  Timer _timer;
  int _countdownTime = 0;

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

  String phone_number = "";
  String code = '';
  //
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
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
              phone_number = number;
            },
            style: TextStyle(fontSize: 14, color: Color(0xffbfbfbf)),
            decoration:
                InputDecoration(border: InputBorder.none, hintText: '绑定手机号'),
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
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 10),
                  height: 20,
                  width: 100,
                  child: Center(
                    child: Text(
                      _countdownTime > 0 ? '$_countdownTime后重新获取' : '获取验证码',
                      style: TextStyle(
                          fontSize: 12,
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
                        msg: "发送成功，正在获取...",
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
          height: 50,
          width: sizewidth - 40,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 52),
          child: RaisedButton(
            color: Color(0xffcf1322),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Text(
              '立即绑定',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              if (phone_number == "" || phone_number.length < 11) {
                Fluttertoast.showToast(
                    msg: "请输入正确的手机号",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.grey);
              } else if (phone_number == "") {
                Fluttertoast.showToast(
                    msg: "手机号不能为空",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.grey);
              } else if (code == "") {
                Fluttertoast.showToast(
                    msg: "请输入验证码",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.grey);
              } else {
                Fluttertoast.showToast(
                    msg: "网络连接错误",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    textColor: Colors.white,
                    backgroundColor: Colors.grey);
              }
            },
          ),
        ),
      ],
    );
  }
}
