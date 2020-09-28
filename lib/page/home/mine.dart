import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mall/api/api.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/page/bill/my_assets.dart';
import 'package:mall/page/help/customer_service.dart';
import 'package:mall/page/help/set.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/widgets/webview.dart';
import './placetheorder.dart';
import 'dart:convert';
import 'dart:io';

const APPBAR_SCROLL_OFFSET = 100;

class MineView extends StatefulWidget {
  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  bool isLogin = false;
  var imageHeadUrl;
  var nickName = 'hh';
  String mytradingnum1;
  String mytradingnum2;
  String mytradingnum3;
  String mytradingnum4;
  String shoppingcartfootprintnum1;
  String shoppingcartfootprintnum2;
  String shoppingcartfootprintnum3;
  String shoppingcartfootprintnum4;

  //创建HttpClient
  HttpClient _httpClient = HttpClient();
  var _token;
  var _page = 1;
  var _limit = 10;
  MineService _mineService = MineService();
  @override
  void initState() {
    super.initState();
    // SharedPreferencesUtils.getToken().then((value) {
    //   _token = value;
    //   // _orderData();
    // });
  }

  // _orderData() {
  //   var parameters = {"page": _page, "limit": _limit};
  //   _mineService.queryOrder(parameters, (success) {
  //     setState(() {
  //       _orders = success;
  //     });
  //   }, (error) {
  //     ToastUtil.showToast(error);
  //   });
  // }
  // getUrlHttpClient() async {
  //   var url = Api.MINE_ORDERS;
  //   _httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
  //     return request.close();
  //   }).then((HttpClientResponse response) {
  //     // Process the response.
  //     if (response.statusCode == 200) {
  //       response.transform(utf8.decoder).join().then((String string) {
  //         print(string);
  //       });
  //     } else {
  //       print("error");
  //     }
  //   });
  // }

  //渐变准备
  final PageController _controller = PageController(initialPage: 0);
  double appBarAlpha = 0;
  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    // prrint(appBarAlpha);
  }

  //监听事件，等待登录完传值过来
  _refreshEvent() {
    loginEventBus.on<LoginEvent>().listen((LoginEvent loginEvent) {
      if (loginEvent.isLogin) {
        setState(() {
          isLogin = true;
          imageHeadUrl = loginEvent.url;
          nickName = loginEvent.nickName;
          mytradingnum1 = loginEvent.mytradingnum1;
          mytradingnum2 = loginEvent.mytradingnum2;
          mytradingnum3 = loginEvent.mytradingnum3;
          mytradingnum4 = loginEvent.mytradingnum4;
          shoppingcartfootprintnum1 = loginEvent.shoppingcartfootprintnum1;
          shoppingcartfootprintnum2 = loginEvent.shoppingcartfootprintnum2;
          shoppingcartfootprintnum3 = loginEvent.shoppingcartfootprintnum3;
          shoppingcartfootprintnum4 = loginEvent.shoppingcartfootprintnum4;
        });
      } else {
        setState(() {
          isLogin = false;
        });
      }
    });
  }

  _getUserInfo() {
    SharedPreferencesUtils.getToken().then((token) {
      if (token != null) {
        setState(() {
          isLogin = true;
        });
        SharedPreferencesUtils.getImageHead().then((imageHeadAddress) {
          setState(() {
            imageHeadUrl = imageHeadAddress;
          });
        });
        SharedPreferencesUtils.getUserName().then((name) {
          setState(() {
            nickName = name;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshEvent();
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final size = MediaQuery.of(context).size;
    final screenheight = size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              //移除ListView得padding
              removeTop: true, //移除Top
              context: context,
              child: NotificationListener(
                //实现对列表得监听  --  接收 onNotification 得回调，每次滚动得时候都会回调这个函数
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //1、只监测ListView的滚动（深度设为0），2、监测滚动的时候（ScrollUpdateNotification）
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    alignment: Alignment.bottomRight,
                    height: 70.0,
                    decoration: BoxDecoration(color: Color(0xffFE5155)),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => _toSettings(),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 293,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 191,
                          color: Color(0xffFE5155),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                  onTap: () => isLogin
                                      ? _toPersonalData()
                                      : _toLandingPage(),
                                  child: isLogin
                                      ? Container(
                                          width: 300,
                                          child: ListTile(
                                            leading: Container(
                                              height: 54,
                                              width: 54,
                                              child: ClipOval(
                                                child: Image.network(
                                                  this.imageHeadUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              this.nickName,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            subtitle: Text(
                                              '关注 0 丨 粉丝 0',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 200,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.account_circle,
                                              size: 54,
                                            ),
                                            title: Text(
                                              '点击登录',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )),
                              SizedBox(height: 5),
                              shoppingcartfootprint(),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 14,
                          right: 14,
                          top: 121,
                          child: Container(
                            width: double.infinity,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white12,
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '偷偷告诉你，实名认证后宝贝更易卖出哦~',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              // onPressed: () => _toPlacetheorder(),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //导航打开新视图
                                        builder: (context) =>
                                            PlacetheorderPage()));
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          right: 13,
                          top: 167,
                          child: mytrading(),
                        ),
                      ],
                    ),
                  ),
                  // makemoney(),
                  recommendedtools(),
                  SizedBox(height: 50),
                ]),
              ),
            ),
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                alignment: Alignment.topCenter,
                //按屏幕比例变化
                height: statusBarHeight + 50,
                child: AppBar(
                  // brightness: Brightness.dark,
                  backgroundColor: Color(0xffFE5155),
                  elevation: 0,
                  title: Text(this.nickName),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => _toSettings(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toSettings() {
    NavigatorUtils.goSettings(context);
  }

  _toPlacetheorder() {
    NavigatorUtils.goPlacetheorder(context);
  }

  _toLandingPage() {
    NavigatorUtils.goLandingfPage(context);
  }

  _toPersonalData() {
    NavigatorUtils.goPersonalData(context);
  }

  shoppingcartfootprint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () {
            print('sss');
          },
          child: Column(
            children: <Widget>[
              Text(
                isLogin ? this.shoppingcartfootprintnum1 : '0',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '购物车',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('sss');
          },
          child: Column(
            children: <Widget>[
              Text(
                isLogin ? this.shoppingcartfootprintnum2 : '0',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '足迹',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('sss');
          },
          child: Column(
            children: <Widget>[
              Text(
                isLogin ? this.shoppingcartfootprintnum3 : '0',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '红包',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    //导航打开新视图
                    builder: (context) => AssetsPage()));
          },
          child: Column(
            children: <Widget>[
              Text(
                isLogin ? this.shoppingcartfootprintnum4 : '0',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '钱包',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }

  mytrading() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      height: 120,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 14, top: 13),
            child: Row(
              children: <Widget>[
                Text(
                  '我的订单',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('sss');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 19,
                      height: 35,
                      child: Text(
                        isLogin ? this.mytradingnum1 : '0',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '我发布的',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('sss');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 19,
                      height: 35,
                      child: Text(
                        isLogin ? this.mytradingnum2 : '0',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '我卖出的',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('sss');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 19,
                      height: 35,
                      child: Text(
                        isLogin ? this.mytradingnum3 : '0',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '我买到的',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print('sss');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 19,
                      height: 35,
                      child: Text(
                        isLogin ? this.mytradingnum4 : '0',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '我收藏的',
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class shoppingcartfootprint extends StatefulWidget {
//   shoppingcartfootprint({Key key}) : super(key: key);

//   @override
//   _shoppingcartfootprintState createState() => _shoppingcartfootprintState();
// }

// class _shoppingcartfootprintState extends State<shoppingcartfootprint> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class mytrading extends StatefulWidget {
//   mytrading({Key key}) : super(key: key);

//   @override
//   _mytradingState createState() => _mytradingState();
// }

// class _mytradingState extends State<mytrading> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class makemoney extends StatefulWidget {
  makemoney({Key key}) : super(key: key);

  @override
  _makemoneyState createState() => _makemoneyState();
}

class _makemoneyState extends State<makemoney> {
  @override
  Widget build(BuildContext context) {
    final screenwith = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      height: 119,
      width: double.infinity,
      margin: EdgeInsets.only(left: 12, right: 13, top: 14),
      padding: EdgeInsets.only(left: 14, top: 13, right: 14),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '天天赚钱',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    print('sss');
                  },
                  child: Container(
                      height: 60,
                      // width: screenwith * 0.41,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 46,
                            height: 48,
                            child: Image.network(
                              'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3901429284,1378079784&fm=26&gp=0.jpg',
                            ),
                          ),
                          SizedBox(width: 6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '签到领现金',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '提现至微信零钱',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    print('sss');
                  },
                  child: Container(
                      // width: screenwith * 0.41,
                      child: Row(
                    children: <Widget>[
                      Container(
                        width: 46,
                        height: 48,
                        child: Image.network(
                          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3901429284,1378079784&fm=26&gp=0.jpg',
                        ),
                      ),
                      SizedBox(width: 6),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '签到领现金',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            '提现至微信零钱',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class recommendedtools extends StatefulWidget {
  recommendedtools({Key key}) : super(key: key);

  @override
  _recommendedtoolsState createState() => _recommendedtoolsState();
}

class _recommendedtoolsState extends State<recommendedtools> {
  List recommendedtools = [
    {
      'toolsname1': '客服中心',
      'toolsname2': '平台规则',
      'toolsname3': '邀请得现金',
      'toolsname4': '天天抽奖',
    },
    // {
    //   'toolsname1': '平台规则',
    //   'toolsname2': '邀请得现金',
    //   'toolsname3': '活动报名',
    //   'toolsname4': '租着玩',
    // },
    // {
    //   'toolsname1': '领取中心',
    //   'toolsname2': '活动扫码',
    //   'toolsname3': '天天抽奖',
    //   'toolsname4': '签到送礼',
    // }
  ];
  List<Widget> _recommendedtoolsget() {
    var tempList = recommendedtools.map((value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (value['toolsname1'] == '客服中心') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //导航打开客服中心
                        builder: (context) => CustomerPage()));
              } else if (value['toolsname1'] == '平台规则') {
                print('平台规则');
              } else {
                print('领取中心');
              }
            },
            child: Container(
                height: 54,
                width: 70,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.home),
                      Text(
                        value['toolsname1'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              if (value['toolsname2'] == '平台规则') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewPage(
                            'https://www.baidu.com/', value['toolsname2'])));
                print('平台规则');
              } else if (value['toolsname2'] == '邀请得现金') {
                print('邀请得现金');
              } else {
                _scan();
              }
            },
            child: Container(
                height: 54,
                width: 70,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.home),
                      Text(
                        value['toolsname2'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              if (value['toolsname3'] == '邀请得现金') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewPage(
                            'https://www.baidu.com/', value['toolsname3'])));
                print('邀请得现金');
              } else if (value['toolsname3'] == '活动报名') {
                print('活动报名');
              } else {
                print('天天抽奖');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //导航打开新视图
                        builder: (context) => MySetingPage()));
              }
            },
            child: Container(
                height: 54,
                width: 70,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.home),
                      Text(
                        value['toolsname3'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              if (value['toolsname4'] == '天天抽奖') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewPage(
                            'https://www.baidu.com/', value['toolsname4'])));
                print('天天抽奖');
              } else if (value['toolsname4'] == '租着玩') {
                print('租着玩');
              } else {
                print('签到送礼');
              }
            },
            child: Container(
                height: 54,
                width: 70,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.home),
                      Text(
                        value['toolsname4'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      );
    });
    return tempList.toList();
  }

//扫码回调的信息
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
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      constraints: BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      margin: EdgeInsets.only(left: 12, right: 13, top: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 14, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '推荐工具',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Text(
                          '更多',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff999898)),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Color(0xff999898),
                        )
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(children: this._recommendedtoolsget())
        ],
      ),
    );
  }
}
