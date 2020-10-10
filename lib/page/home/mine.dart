import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mall/api/api.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/page/bill/my_assets.dart';
import 'package:mall/page/help/customer_service.dart';
import 'package:mall/page/help/set.dart';
import 'package:mall/page/home/personaldata.dart';
import 'package:mall/page/home/settings.dart';
import 'package:mall/page/home/webview_flutter_plus.dart';
import 'package:mall/service/mine_service.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/widgets/flutter_webview_plugin.dart';
import './placetheorder.dart';
import 'dart:convert';
import 'dart:io';

import 'browser.dart';
import 'dioManger.dart';

const APPBAR_SCROLL_OFFSET = 100;

class MineView extends StatefulWidget {
  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  bool isLogin = false;
  var imageHeadUrl;
  var nickName = 'hh';
  var token;
  int mytradingnum1;
  int mytradingnum2;
  int mytradingnum3;
  int mytradingnum4;
  int goodsCount;
  int footprint;
  int favorite;
  int couponCount;

  //创建HttpClient
  HttpClient _httpClient = HttpClient();
  MineService _mineService = MineService();

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
    loginEventBus.on<LoginEvent>().listen(
      (LoginEvent loginEvent) {
        if (loginEvent.isLogin) {
          getMineOrders();
          // getMINE_FOOTPRINT();
          // getCART_LIST();
          // getMINE_COUPON_LIST();
          // getMINE_COLLECT();
          setState(() {
            isLogin = true;
            imageHeadUrl = loginEvent.url;
            nickName = loginEvent.nickName;
            token = loginEvent.token;
          });
          // personalDataBus.fire(PersonalDataEvent(
          //   url: loginEvent.url,
          //   nickName: loginEvent.nickName,
          // ));
        } else {
          setState(() {
            isLogin = false;
          });
        }
      },
    );
  }

//我的订单数据
  void getMineOrders() {
    if (isLogin) {
      ///显示指定Map的限定类型
      Map<String, String> parms = {'showType': '0'};
      Map<String, String> headers = {"X-Litemall-Token": this.token};
      DioManger.getInstance().get(Api.MINE_ORDERS, parms, headers, (response) {
        Map<String, dynamic> map = json.decode(response);
        setState(() {
          mytradingnum1 = map['data']['total'];
          mytradingnum2 = map['data']["pages"];
          mytradingnum3 = map['data']["limit"];
          mytradingnum4 = map['data']["page"];
        });
      }, (error) {
        print('请求我的订单数据错误');
        print(error.toString());
      });
    }
  }

//足迹数据
  void getMINE_FOOTPRINT() {
    if (isLogin) {
      ///显示指定Map的限定类型
      Map<String, String> parms = {};
      Map<String, String> headers = {"X-Litemall-Token": this.token};
      DioManger.getInstance().get(Api.MINE_FOOTPRINT, parms, headers,
          (response) {
        Map<String, dynamic> map = json.decode(response);
        setState(() {
          footprint = map['data']["total"];
        });
      }, (error) {
        print('请求足迹数据错误');
        print(error.toString());
      });
    }
  }

//购物车数据
  void getCART_LIST() {
    if (isLogin) {
      ///显示指定Map的限定类型
      Map<String, String> parms = {};
      Map<String, String> headers = {"X-Litemall-Token": this.token};
      DioManger.getInstance().get(Api.CART_LIST, parms, headers, (response) {
        Map<String, dynamic> map = json.decode(response);
        setState(() {
          goodsCount = map['data']["cartTotal"]['goodsCount'];
        });
      }, (error) {
        print('请求购物车数据错误');
        print(error.toString());
      });
    }
  }

  //收藏夹数据
  void getMINE_COLLECT() {
    if (isLogin) {
      ///显示指定Map的限定类型
      //传递参数
      Map<String, String> parms = {'type': '1'};
      //携带头部
      Map<String, String> headers = {"X-Litemall-Token": this.token};
      DioManger.getInstance().get(Api.MINE_COLLECT, parms, headers, (response) {
        Map<String, dynamic> map = json.decode(response);
        setState(() {
          favorite = map['data']['total'];
        });
      }, (error) {
        print('请求收藏夹数据错误');
        print(error.toString());
      });
    }
  }

  //优惠券数据
  void getMINE_COUPON_LIST() {
    if (isLogin) {
      ///显示指定Map的限定类型
      Map<String, String> parms = {};
      Map<String, String> headers = {"X-Litemall-Token": this.token};
      DioManger.getInstance().get(Api.MINE_COUPON_LIST, parms, headers,
          (response) {
        Map<String, dynamic> map = json.decode(response);
        setState(() {
          couponCount = map['data']['total'];
        });
      }, (error) {
        print('请求优惠券数据错误');
        print(error.toString());
      });
    }
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
                    padding: EdgeInsets.only(top: 40, right: 1),
                    alignment: Alignment.bottomRight,
                    height: 70.0,
                    decoration: BoxDecoration(color: Color(0xffFE5155)),
                    child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 22,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SettingsPage(
                                    isLogin: this.isLogin,
                                    token: this.token,
                                  )));
                        }),
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
                                  // onTap: () => isLogin
                                  //     ? _toPersonalData()
                                  //     : _toLandingPage(),
                                  onTap: () {
                                    if (isLogin) {
                                      // Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .push(new MaterialPageRoute(
                                              builder: (context) =>
                                                  new personaldataPage(
                                                    nickName: this.nickName,
                                                    imageHeadUrl:
                                                        this.imageHeadUrl,
                                                  )))
                                          .then((value) {
                                        setState(() {
                                          value == null
                                              ? this.nickName = this.nickName
                                              : this.nickName = value;
                                        });
                                        // print(value);
                                      });
                                    } else {
                                      _toLandingPage();
                                    }
                                  },
                                  child: isLogin
                                      ? Container(
                                          width: double.infinity,
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
                                          width: double.infinity,
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
                              // shoppingcartfootprint(),
                            ],
                          ),
                        ),
                        // Positioned(
                        //   left: 14,
                        //   right: 14,
                        //   top: 121,
                        //   child: Container(
                        //     width: double.infinity,
                        //     height: 34,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white12,
                        //     ),
                        //     child: FlatButton(
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text(
                        //             '偷偷告诉你，实名认证后宝贝更易卖出哦~',
                        //             style: TextStyle(
                        //               color: Colors.white70,
                        //               fontSize: 12,
                        //             ),
                        //           ),
                        //           Icon(
                        //             Icons.navigate_next,
                        //             color: Colors.white,
                        //           ),
                        //         ],
                        //       ),
                        //       // onPressed: () => _toPlacetheorder(),
                        //       onPressed: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 //导航打开新视图
                        //                 builder: (context) =>
                        //                     PlacetheorderPage()));
                        //       },
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          left: 12,
                          right: 13,
                          // top: 167,
                          top: 121,
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SettingsPage(
                                    isLogin: this.isLogin,
                                    token: this.token,
                                  )));
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toSettings({bool isLogin}) {
    NavigatorUtils.goSettings(context);
  }

  _toPlacetheorder() {
    NavigatorUtils.goPlacetheorder(context);
  }

  _toLandingPage() {
    NavigatorUtils.goLandingfPage(context);
  }

  _toPersonalData({String nickName}) {
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
                isLogin ? '$goodsCount' : '0',
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
                isLogin ? '$footprint' : '0',
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
                isLogin ? '$favorite' : '0',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '收藏夹',
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
                isLogin ? '$couponCount' : '0',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '优惠券',
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
                      width: 60,
                      height: 35,
                      child: Text(
                        isLogin ? '$mytradingnum1' : '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '待付款',
                        textAlign: TextAlign.center,
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
                      width: 60,
                      height: 35,
                      child: Text(
                        isLogin ? '$mytradingnum2' : '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '待发货',
                        textAlign: TextAlign.center,
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
                      width: 60,
                      height: 35,
                      child: Text(
                        isLogin ? '$mytradingnum3' : '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '待收货',
                        textAlign: TextAlign.center,
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
                      width: 60,
                      height: 35,
                      child: Text(
                        isLogin ? '$mytradingnum4' : '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 19,
                      child: Text(
                        '待评价',
                        textAlign: TextAlign.center,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              if (value['toolsname2'] == '平台规则') {
                print('平台规则');
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return Browser(
                    url: "https://flutter-io.cn/",
                    title: "Flutter 中文社区",
                  );
                }));
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
                print('邀请得现金');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewPage(
                            'https://www.baidu.com/', value['toolsname3'])));
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
                print('天天抽奖');
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Webview_flutter_plus(
                    title: '我是跳转传值',
                    url: "https://flutter-io.cn/",
                  ),
                ));
                // Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                //   return Webview_flutter_plus(
                //     url: "https://flutter-io.cn/",
                //     title: "Flutter ",
                //   );
                // }));
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
      padding: EdgeInsets.only(left: 14, top: 13, right: 14),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '推荐工具',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              // InkWell(
              //   onTap: () {
              //     print('222');
              //   },
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         '更多',
              //         style: TextStyle(fontSize: 12, color: Color(0xff999898)),
              //       ),
              //       Icon(
              //         Icons.navigate_next,
              //         color: Color(0xff999898),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(children: this._recommendedtoolsget())
        ],
      ),
    );
  }
}
