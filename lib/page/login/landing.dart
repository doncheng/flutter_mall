import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class landingPage extends StatefulWidget {
  landingPage({Key key}) : super(key: key);

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  double textfontsize = 12.0;
  double iconsize = 30;

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
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 44,
                      width: 44,
                      child: InkWell(
                        child: Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599050553370&di=b5c3ba4c2f35e3504675df2ff7865622&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F01%2F49%2F66%2F2257447a7b5d1df.jpg',
                        ),
                        onTap: () async {
                          String result = await platform
                              .invokeMethod("NoValidationlanding");
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
