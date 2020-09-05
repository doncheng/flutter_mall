import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/utils/shared_preferences_util.dart';
import 'package:mall/widgets/icon_text_arrow.dart';
import 'package:mall/widgets/mall_icon.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/service/user_service.dart';
import 'package:mall/utils/toast_util.dart';

class MineView extends StatefulWidget {
  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  List recommendedtools = [
    {
      'toolsname1': '客服中心',
      'toolsname2': '我的订阅',
      'toolsname3': '我的拼团',
      'toolsname4': '借钱',
    },
    {
      'toolsname1': '平台规则',
      'toolsname2': '邀请得现金',
      'toolsname3': '活动报名',
      'toolsname4': '租着玩',
    },
    {
      'toolsname1': '领取中心',
      'toolsname2': '活动扫码',
      'toolsname3': '天天抽奖',
      'toolsname4': '签到送礼',
    }
  ];
  List<Widget> _recommendedtoolsget() {
    var tempList = recommendedtools.map((value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              height: 60,
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
          Container(
              height: 60,
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
          Container(
              height: 60,
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
          Container(
              height: 60,
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
        ],
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0, // 隐藏阴影
          // tritle: Text(Strings.MINE),
          centerTitle: true,
          backgroundColor: Color(0xffFE5155),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _toSettings(),
            ),
          ]),
      body: ListView(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 293,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 191,
                  color: Color(0xffFE5155),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            size: 54,
                          ),
                          title: Text('李天霸'),
                          subtitle: Text('关注 0｜粉丝 0'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                '11',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '购物车',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '3',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '足迹',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '7',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '红包',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '0',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '账单',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
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
                    // margin: EdgeInsets.only(left: 14, right: 14, top: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white12,
                      // color: Colors.black,
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      onPressed: () => _toPlacetheorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 13,
                  top: 167,
                  child: Container(
                      height: 126,
                      width: double.infinity,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 14, top: 13),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '我的交易',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    Text(
                                      '我发布的',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    Text(
                                      '我卖出的',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    Text(
                                      '我买到的',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    Text(
                                      '我收藏的',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 13),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Container(
              height: 130,
              width: double.infinity,
              padding: EdgeInsets.only(left: 12, right: 13, top: 14),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 14, top: 13),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '天天赚钱',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 58,
                          width: 171,
                          child: ListTile(
                            leading: Image.network(
                              'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3901429284,1378079784&fm=26&gp=0.jpg',
                              width: 45,
                              height: 45,
                            ),
                            title: Text(
                              '签到领现金',
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: Text(
                              '提现至微信零钱',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          height: 58,
                          width: 171,
                          child: ListTile(
                            leading: Image.network(
                              'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3901429284,1378079784&fm=26&gp=0.jpg',
                              width: 45,
                              height: 45,
                            ),
                            title: Text(
                              '签到领现金',
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: Text(
                              '提现至微信零钱',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Container(
              height: 285,
              width: double.infinity,
              padding: EdgeInsets.only(left: 12, right: 13, top: 14),
              child: Card(
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
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff999898)),
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
                      height: 12,
                    ),
                    Column(children: this._recommendedtoolsget())
                  ],
                ),
              )),
        ],
      ),
    );
  }

  _toSettings() {
    NavigatorUtils.goSettings(context);
  }

  _toPlacetheorder() {
    NavigatorUtils.goPlacetheorder(context);
  }
}
