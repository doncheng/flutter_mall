import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:ui';

import 'evaluation.dart';

class SellerPage extends StatelessWidget {
  const SellerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin:
                  EdgeInsets.only(right: ScreenUtil.instance.setWidth(10.0)),
              height: ScreenUtil.instance.setHeight(40.0),
              width: ScreenUtil.instance.setWidth(40.0),
              child: Center(
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        brightness: Brightness.light,
        backgroundColor: Color(0xff7e9cf6),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
      ),
      body: SellerBody(),
    );
  }
}

class SellerBody extends StatefulWidget {
  SellerBody({Key key}) : super(key: key);

  @override
  _SellerBodyState createState() => _SellerBodyState();
}

class _SellerBodyState extends State<SellerBody> {
  double starmun = 3.6;
  int concerns = 1;
  int fens = 78;
  String time = '2019-12-12';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    //   height: ScreenUtil.instance.setHeight(595.0),
    return ListView(
      children: [
        Container(
          height: ScreenUtil.instance.setHeight(230.0),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: ScreenUtil.instance.setHeight(144.0),
                width: double.infinity,
                color: Color(0xff7e9cf6),
                padding: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(25.0),
                    bottom: ScreenUtil.instance.setHeight(68.0)),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        height: ScreenUtil.instance.setHeight(60.0),
                        width: ScreenUtil.instance.setWidth(60.0),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: ScreenUtil.instance.setWidth(60.0),
                      width: ScreenUtil.instance.setWidth(153.0),
                      child: Column(
                        children: [
                          Container(
                            width: ScreenUtil.instance.setWidth(153.0),
                            height: ScreenUtil.instance.setWidth(30.0),
                            child: Text(
                              '蔡师傅工作室 2号店',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(55.0),
                            height: ScreenUtil.instance.setWidth(20.0),
                            margin: EdgeInsets.only(
                              right: ScreenUtil.instance.setWidth(99.0),
                            ),
                            child: Text(
                              '当前在线',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    height: ScreenUtil.instance.setHeight(154.0),
                    width: ScreenUtil.instance.setWidth(350.0),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(85.0),
                        left: ScreenUtil.instance.setWidth(12.0),
                        right: ScreenUtil.instance.setWidth(13.0)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                margin: EdgeInsets.only(
                                    top: ScreenUtil.instance.setHeight(20.0),
                                    left: ScreenUtil.instance.setWidth(20.0),
                                    right: ScreenUtil.instance.setWidth(10.0)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xfff5f5f5),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                height: ScreenUtil.instance.setHeight(22.0),
                                width: ScreenUtil.instance.setWidth(90.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Color(0xff0781ea),
                                    ),
                                    Text(
                                      '实名认证',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff0781ea)),
                                    )
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: ScreenUtil.instance.setHeight(20.0),
                                  // left: ScreenUtil.instance.setWidth(20.0),
                                  // right: ScreenUtil.instance.setWidth(10.0)
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xfff5f5f5),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                height: ScreenUtil.instance.setHeight(22.0),
                                width: ScreenUtil.instance.setWidth(92.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.compare_arrows,
                                      color: Color(0xffff9800),
                                    ),
                                    Text(
                                      '手机好卖家',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffff9800)),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Container(
                          height: ScreenUtil.instance.setHeight(50.0),
                          width: ScreenUtil.instance.setWidth(280.0),
                          margin: EdgeInsets.only(
                              top: ScreenUtil.instance.setHeight(10.0),
                              left: ScreenUtil.instance.setWidth(20.0),
                              right: ScreenUtil.instance.setWidth(45.0)),
                          child: Text(
                            '90后处女座女生，加入440天。不忘初心，方得始终!',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          height: ScreenUtil.instance.setHeight(36.0),
                          width: ScreenUtil.instance.setWidth(350.0),
                          padding: EdgeInsets.only(
                              // top: ScreenUtil.instance.setHeight(14.0),
                              left: ScreenUtil.instance.setWidth(20.0),
                              right: ScreenUtil.instance.setWidth(14.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: ScreenUtil.instance.setHeight(15.0),
                                width: ScreenUtil.instance.setWidth(80.0),
                                child: Center(
                                  child: Text(
                                    '关注$concerns' + '    粉丝$fens',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenUtil.instance.setHeight(32.0),
                                width: ScreenUtil.instance.setWidth(70.0),
                                child: RaisedButton(
                                    color: Colors.red,
                                    child: Text(
                                      '+ 关注',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    onPressed: () {}),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
                    builder: (context) => EvaluationPage()));
          },
          child: Container(
            height: ScreenUtil.instance.setHeight(25.0),
            // width: ScreenUtil.instance.setWidth(60.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: ScreenUtil.instance.setHeight(25.0),
                  width: ScreenUtil.instance.setWidth(73.0),
                  child: Center(
                    child: Text(
                      '交易评价',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: ScreenUtil.instance.setHeight(20.0),
                  width: ScreenUtil.instance.setWidth(70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '全部211',
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff999999)),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: ScreenUtil.instance.setHeight(140.0),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: ScreenUtil.instance.setHeight(136.0),
                width: ScreenUtil.instance.setWidth(188.0),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0),
                        ),
                        height: ScreenUtil.instance.setHeight(75.0),
                        width: ScreenUtil.instance.setWidth(65.0),
                        child: Column(
                          children: [
                            Container(
                              height: ScreenUtil.instance.setHeight(46.0),
                              margin: EdgeInsets.only(
                                  bottom: ScreenUtil.instance.setHeight(6.0)),
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '买到宝贝',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff999999)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenUtil.instance.setWidth(20.0),
                        ),
                        height: ScreenUtil.instance.setHeight(75.0),
                        width: ScreenUtil.instance.setWidth(65.0),
                        child: Column(
                          children: [
                            Container(
                              height: ScreenUtil.instance.setHeight(46.0),
                              margin: EdgeInsets.only(
                                  bottom: ScreenUtil.instance.setHeight(6.0)),
                              child: Center(
                                child: Text(
                                  '319',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '卖出宝贝',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff999999)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xffd7d7d7),
                margin: EdgeInsets.only(
                  top: ScreenUtil.instance.setHeight(46.0),
                  bottom: ScreenUtil.instance.setHeight(46.0),
                ),
                // height: ScreenUtil.instance.setHeight(136.0),
                width: ScreenUtil.instance.setWidth(2.0),
              ),
              Container(
                height: ScreenUtil.instance.setHeight(136.0),
                width: ScreenUtil.instance.setWidth(184.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(30.0),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil.instance.setWidth(20.0),
                        ),
                        XFStarRating(
                          rating: starmun,
                          maxRating: 5,
                          size: 18,
                          selectedColor: Colors.blue,
                          unselectedColor: Colors.white,
                        ),
                        Container(
                          height: ScreenUtil.instance.setHeight(20.0),
                          width: ScreenUtil.instance.setWidth(35.0),
                          child: Center(
                            child: Text(starmun.toString() + '分'),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(5.0)),
                            height: ScreenUtil.instance.setHeight(18.0),
                            width: ScreenUtil.instance.setWidth(18.0),
                            child: Icon(
                              Icons.help,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(6.0),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil.instance.setHeight(20.0),
                          ),
                          height: ScreenUtil.instance.setHeight(20.0),
                          width: ScreenUtil.instance.setWidth(80.0),
                          child: Text(
                            '宝贝描述:' + starmun.toString() + '分',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: ScreenUtil.instance.setHeight(20.0),
                          width: ScreenUtil.instance.setWidth(38.0),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Text(
                              '高',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(6.0),
                    ),
                    Row(
                      children: [
                        Container(
                          height: ScreenUtil.instance.setHeight(20.0),
                          width: ScreenUtil.instance.setWidth(80.0),
                          margin: EdgeInsets.only(
                            left: ScreenUtil.instance.setHeight(20.0),
                          ),
                          child: Text(
                            '沟通态度::' + starmun.toString() + '分',
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: ScreenUtil.instance.setHeight(20.0),
                          width: ScreenUtil.instance.setWidth(38.0),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Text(
                              '高',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: ScreenUtil.instance.setHeight(240.0),
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: ClipOval(
                  child: Image.network(
                    'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  '越***6',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  '买家 丨 ' + time,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                trailing: Container(
                  height: 20,
                  width: 55,
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    '非常满意',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),
              evaluation(),
              Container(
                  height: 20,
                  width: 150,
                  margin: EdgeInsets.only(
                      top: 4, left: ScreenUtil.instance.setWidth(215.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '问问大家的交易感受',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  )),
            ],
          ),
        ),
        Container(
          height: 12,
          width: double.infinity,
          color: Color(0xfff8f8f8),
        ),
        Container(
          height: ScreenUtil.instance.setHeight(90.0),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '累计发布宝贝449件，在架5件',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 450,
          width: double.infinity,
          child: firstPage(),
        )
      ],
    );
  }
}

class evaluation extends StatefulWidget {
  evaluation({Key key}) : super(key: key);

  @override
  _evaluationState createState() => _evaluationState();
}

class _evaluationState extends State<evaluation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(140.0),
      width: double.infinity,
      margin: EdgeInsets.only(
        left: ScreenUtil.instance.setWidth(60.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenUtil.instance.setHeight(25.0),
            width: double.infinity,
            child: Text(
              '东西不错',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: ScreenUtil.instance.setHeight(60.0),
                  width: ScreenUtil.instance.setWidth(60.0),
                  child: Image.network(
                    'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class firstPage extends StatefulWidget {
  firstPage({Key key}) : super(key: key);

  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: ScreenUtil.instance.setHeight(274.0),
              width: ScreenUtil.instance.setWidth(170.0),
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(10.0),
                top: ScreenUtil.instance.setHeight(20.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: ScreenUtil.instance.setHeight(154.0),
                      width: ScreenUtil.instance.setWidth(170.0),
                      child: Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        height: 160,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setWidth(12.0),
                        top: ScreenUtil.instance.setHeight(10.0),
                      ),
                      height: ScreenUtil.instance.setHeight(31.0),
                      width: ScreenUtil.instance.setWidth(139.0),
                      child: Expanded(
                        child: Text(
                          '清末民初回流纯老银壶一套，清末民初回流纯老…',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 15,
                        width: 55,
                        margin: EdgeInsets.only(left: 25, top: 15),
                        child: Center(
                          child: Text(
                            '¥2700',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffff1a22)),
                          ),
                        ),
                      ),
                      Container(
                        height: 18,
                        width: 60,
                        color: Color(0xffffe8e8),
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Center(
                          child: Text(
                            '千万保障',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffff1a22)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 14,
                        width: 70,
                        margin: EdgeInsets.only(left: 25, top: 15),
                        child: Center(
                          child: Text(
                            '深圳 丨 福田',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc8c8c8)),
                          ),
                        ),
                      ),
                      Container(
                        height: 14,
                        width: 44,
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Center(
                          child: Text(
                            '2小时前',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc8c8c8)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(274.0),
              width: ScreenUtil.instance.setWidth(170.0),
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(10.0),
                top: ScreenUtil.instance.setHeight(20.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: ScreenUtil.instance.setHeight(154.0),
                      width: ScreenUtil.instance.setWidth(170.0),
                      child: Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        height: 160,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: ScreenUtil.instance.setWidth(12.0),
                        top: ScreenUtil.instance.setHeight(10.0),
                      ),
                      height: ScreenUtil.instance.setHeight(31.0),
                      width: ScreenUtil.instance.setWidth(139.0),
                      child: Expanded(
                        child: Text(
                          '清末民初回流纯老银壶一套，清末民初回流纯老…',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 15,
                        width: 55,
                        margin: EdgeInsets.only(left: 25, top: 15),
                        child: Center(
                          child: Text(
                            '¥2700',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffff1a22)),
                          ),
                        ),
                      ),
                      Container(
                        height: 18,
                        width: 60,
                        color: Color(0xffffe8e8),
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Center(
                          child: Text(
                            '千万保障',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffff1a22)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 14,
                        width: 70,
                        margin: EdgeInsets.only(left: 25, top: 15),
                        child: Center(
                          child: Text(
                            '深圳 丨 福田',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc8c8c8)),
                          ),
                        ),
                      ),
                      Container(
                        height: 14,
                        width: 44,
                        margin: EdgeInsets.only(right: 15, top: 15),
                        child: Center(
                          child: Text(
                            '2小时前',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc8c8c8)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
