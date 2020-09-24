import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/entity/user_entity.dart';
import 'package:mall/event/login_event.dart';
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
  UserEntity userEntity;

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
                _login();
                String result =
                    await platform.invokeMethod("call_native_method");
                setState(() {
                  _result = result;
                  print("_result ---->" + _result);
                });
              },
            ),
          ),
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
          Platform.isIOS && double.parse(this.systemVersion) >= 13.0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // Alipaylanding(),
                    // WeChatlanding(),
                    Applelanding(),
                    // NoValidationlanding(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Alipaylanding(),
                    // WeChatlanding(),
                    // NoValidationlanding(),
                  ],
                )
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
              print(result);
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

  _login() {
//     if (registerFormKey.currentState.validate()) {
//       registerFormKey.currentState.save();
//       Map<String, dynamic> map = Map();
//       map.putIfAbsent("username", () => _accountTextControl.text.toString());
//       map.putIfAbsent("password", () => _passwordTextControl.text.toString());
//       userService.login(map, (success) {
//         print(success);
//         userEntity = success;
//         _saveUserInfo();
//         _showToast(Strings.LOGIN_SUCESS);
// //        Provider.of<UserInfoModel>(context, listen: true)
// //            .updateInfo(userEntity);
//         loginEventBus.fire(LoginEvent(true,
//             url: userEntity.userInfo.avatarUrl,
//             nickName: userEntity.userInfo.nickName));
//         Navigator.pop(context);
//       }, (onFail) {
//         print(onFail);
//         _showToast(onFail);
//       });
//     } else {
//       setState(() {
//         _autovalidator = true;
//       });
//     }
    print('111111111');
    Future login(Map<String, dynamic> parameters, OnSuccess onSuccess,
        OnFail onFail) async {
      var parameters = {
        "username": 'user123',
        "password": 'user123',
      };
      try {
        var response =
            await HttpUtil.instance.post(Api.LOGIN, parameters: parameters);
        if (response['errno'] == 0) {
          UserEntity userEntity = UserEntity.fromJson(response['data']);
          onSuccess(userEntity);
          print('2222222');
        } else {
          print('333333');
          onFail(response['errmsg']);
        }
      } catch (e) {
        print(e);
        onFail(Strings.SERVER_EXCEPTION);
      }
    }

    Navigator.pop(context);
    // loginEventBus.fire(LoginEvent(
    //   true,
    //   // url: userEntity.userInfo.avatarUrl,
    //   // nickName: userEntity.userInfo.nickName,
    //   url:
    //       'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3172368692,3210698748&fm=26&gp=0.jpg',
    //   nickName: '我已经登录了',
    // ));
  }
}
