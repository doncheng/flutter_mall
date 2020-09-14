import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'about_seller.dart';

class GoodsDetails extends StatefulWidget {
  GoodsDetails({Key key}) : super(key: key);

  @override
  _GoodsDetailsState createState() => _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetails> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        actions: [
          Icon(
            Icons.share,
            color: Colors.black,
          ),
          SizedBox(
            width: ScreenUtil.instance.setWidth(14.0),
          ),
          Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
          SizedBox(
            width: ScreenUtil.instance.setWidth(20.0),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
              child: ListView(
            children: [
              toSeller(),
              mainBody(),
            ],
          )),
          Container(
            height: ScreenUtil.instance.setHeight(50.0),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: ScreenUtil.instance.setHeight(45.0),
                  width: ScreenUtil.instance.setWidth(44.0),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(8.0),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.network(
                          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1752460159,226752426&fm=26&gp=0.jpg',
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '想要',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil.instance.setHeight(45.0),
                  width: ScreenUtil.instance.setWidth(44.0),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(8.0),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.network(
                          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1752460159,226752426&fm=26&gp=0.jpg',
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '收藏夹',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(bottom: 7),
                          height: 36,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfffeb60a),
                          ),
                          child: Center(
                            child: Text(
                              '聊一聊',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(bottom: 7),
                          height: 36,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffff5555),
                          ),
                          child: Center(
                            child: Text(
                              '马上买',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class toSeller extends StatefulWidget {
  toSeller({Key key}) : super(key: key);

  @override
  _toSellerState createState() => _toSellerState();
}

class _toSellerState extends State<toSeller> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                //导航打开新视图
                builder: (context) => SellerPage()));
      },
      child: Row(
        children: [
          SizedBox(
            width: ScreenUtil.instance.setWidth(14.0),
          ),
          ClipOval(
            child: Image.network(
              'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
              height: ScreenUtil.instance.setHeight(36.0),
              width: ScreenUtil.instance.setWidth(36.0),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: ScreenUtil.instance.setWidth(138.0),
            height: ScreenUtil.instance.setHeight(24.0),
            margin: EdgeInsets.only(left: 5),
            child: Text(
              '蔡师傅工作室 2号店',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: ScreenUtil.instance.setWidth(50.0),
            height: ScreenUtil.instance.setHeight(15.0),
            margin: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(118.0),
            ),
            child: Text(
              '当前在线',
              style: TextStyle(fontSize: 12, color: Color(0xffc8c8c8)),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

class mainBody extends StatefulWidget {
  mainBody({Key key}) : super(key: key);

  @override
  _mainBodyState createState() => _mainBodyState();
}

class _mainBodyState extends State<mainBody> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 16,
          width: 100,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 3),
                height: 13,
                width: 10,
                child: Text(
                  '¥',
                  style: TextStyle(fontSize: 14, color: Color(0xffff1a22)),
                ),
              ),
              Text(
                '2700',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffff1a22),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 16,
                width: 30,
                child: Text(
                  '包邮',
                  style: TextStyle(fontSize: 13, color: Color(0xffc8c8c8)),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 10),
          height: 30,
          width: 350,
          child: Text(
            '苹果x iPhonex有面容质保一年',
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff101010),
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          height: 30,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, left: 13, right: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 61,
                child: Center(
                  child: Text(
                    '深圳 福田',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Container(
                height: 14,
                width: 85,
                child: Center(
                  child: Text(
                    '查看宝贝位置 >',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 30,
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, left: 13, right: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 200,
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        '服务',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 14),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.check_circle, color: Colors.red),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '转+',
                        style:
                            TextStyle(color: Color(0xffff3e45), fontSize: 12),
                      ),
                      Text(
                        '支持验机',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
        Container(
          height: 25,
          width: double.infinity,
          margin: EdgeInsets.only(top: 13, left: 13, right: 13),
          child: Row(
            children: [
              Container(
                width: 4,
                margin: EdgeInsets.only(top: 4, bottom: 3, right: 10),
                color: Color(0xffff3e45),
              ),
              Text(
                '商品详情',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(left: 12),
              height: 45,
              width: ScreenUtil.instance.setWidth(168.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '颜色:',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                      Text(
                        '银色',
                        style:
                            TextStyle(color: Color(0xff101010), fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '购买渠道:',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                      Text(
                        '其他版本',
                        style:
                            TextStyle(color: Color(0xff101010), fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 12),
              height: 45,
              width: ScreenUtil.instance.setWidth(168.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '容量：',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                      Text(
                        '64G',
                        style:
                            TextStyle(color: Color(0xff101010), fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '拆修情况：',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                      Text(
                        '无拆修',
                        style:
                            TextStyle(color: Color(0xff101010), fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Container(
            height: 125,
            width: double.infinity,
            margin: EdgeInsets.only(top: 26, left: 12, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '苹果X IPhoneX 99新苹果x99新iPhonex 99新苹果x64g苹果x 256g',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  '--------------------------',
                  style: TextStyle(fontSize: 15),
                ),
                Expanded(
                    child: Text(
                  '“认证手机好卖家”金牌老店。仅换oled屏幕，最接近原装的屏幕，有原彩显... 展开',
                  style: TextStyle(fontSize: 15),
                ))
              ],
            )),
        Container(
          height: 25,
          width: double.infinity,
          margin: EdgeInsets.only(top: 13, left: 13, right: 13),
          child: Row(
            children: [
              Text(
                '交易流程',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                height: 20,
                width: 80,
                margin: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(65.0),
                ),
                child: Text(
                  '平台担保交易',
                  style: TextStyle(color: Color(0xff999999), fontSize: 13),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 110,
          width: double.infinity,
          margin: EdgeInsets.only(top: 7, left: 12, right: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 73,
                margin: EdgeInsets.only(top: 29),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Colors.blue,
                    ),
                    Text(
                      '卖家邮寄',
                      style: TextStyle(color: Color(0xff101010), fontSize: 13),
                    ),
                    Text(
                      '至验机中心',
                      style: TextStyle(color: Color(0xff999999), fontSize: 13),
                    )
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 73,
                margin: EdgeInsets.only(top: 29),
                child: Column(
                  children: [
                    Icon(
                      Icons.more_horiz,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 73,
                margin: EdgeInsets.only(top: 29),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Colors.blue,
                    ),
                    Text(
                      '平台验证',
                      style: TextStyle(color: Color(0xff101010), fontSize: 13),
                    ),
                    Text(
                      '出具验证报告',
                      style: TextStyle(color: Color(0xff999999), fontSize: 13),
                    )
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 73,
                margin: EdgeInsets.only(top: 29),
                child: Column(
                  children: [
                    Icon(
                      Icons.more_horiz,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 73,
                margin: EdgeInsets.only(top: 29),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_box,
                      color: Colors.blue,
                    ),
                    Text(
                      '买家确认',
                      style: TextStyle(color: Color(0xff101010), fontSize: 13),
                    ),
                    Text(
                      '平台顺丰邮寄',
                      style: TextStyle(color: Color(0xff999999), fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Seller(),
      ],
    );
  }
}

class Seller extends StatefulWidget {
  Seller({Key key}) : super(key: key);

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: double.infinity,
          margin: EdgeInsets.only(top: 13, left: 13, right: 13),
          child: Row(
            children: [
              Container(
                width: 4,
                margin: EdgeInsets.only(top: 4, bottom: 3, right: 10),
                color: Color(0xffff3e45),
              ),
              Text(
                '关于卖家',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    builder: (context) => SellerPage()));
          },
          child: ListTile(
            leading: ClipOval(
              child: Image.network(
                'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                height: ScreenUtil.instance.setHeight(36.0),
                width: ScreenUtil.instance.setWidth(36.0),
                fit: BoxFit.cover,
              ),
            ),
            title: Container(
              width: ScreenUtil.instance.setWidth(138.0),
              height: ScreenUtil.instance.setHeight(24.0),
              margin: EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Text(
                    '蔡师傅工作室 2号店',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                      height: 18,
                      width: 64,
                      color: Color(0xffff9800),
                      child: Center(
                          child: Text(
                        '金牌卖家',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ))),
                  Icon(
                    Icons.check_circle,
                    color: Color(0xff8bc34a),
                  ),
                  Icon(
                    Icons.person_pin,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            subtitle: Container(
              width: ScreenUtil.instance.setWidth(138.0),
              height: ScreenUtil.instance.setHeight(24.0),
              margin: EdgeInsets.only(left: 5),
              child: Text(
                '90后 处女座 女士 当前在线',
                style: TextStyle(fontSize: 13, color: Color(0xff999999)),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 63,
              padding: EdgeInsets.only(top: 12),
              margin: EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Text(
                    '5',
                    style: TextStyle(
                        color: Color(0xff101010),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '在售宝贝',
                    style: TextStyle(color: Color(0xff999999), fontSize: 13),
                  )
                ],
              ),
            ),
            Container(
              width: 1,
              height: 31,
              margin: EdgeInsets.only(top: 16),
              color: Color(0xffd2d2d2),
            ),
            Container(
              width: 60,
              height: 63,
              padding: EdgeInsets.only(top: 12),
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  Text(
                    '324',
                    style: TextStyle(
                        color: Color(0xff101010),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '累计交易',
                    style: TextStyle(color: Color(0xff999999), fontSize: 13),
                  )
                ],
              ),
            ),
            Container(
              width: 1,
              height: 31,
              margin: EdgeInsets.only(top: 16),
              color: Color(0xffd2d2d2),
            ),
            Container(
              width: 60,
              height: 63,
              padding: EdgeInsets.only(top: 12),
              margin: EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Text(
                    '95%',
                    style: TextStyle(
                        color: Color(0xff101010),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '回复率',
                    style: TextStyle(color: Color(0xff999999), fontSize: 13),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 11,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: ScreenUtil.instance.setHeight(78.0),
                    width: ScreenUtil.instance.setWidth(78.0),
                    child: Image.network(
                      'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: ScreenUtil.instance.setHeight(78.0),
                    width: ScreenUtil.instance.setWidth(78.0),
                    child: Image.network(
                      'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: ScreenUtil.instance.setHeight(78.0),
                    width: ScreenUtil.instance.setWidth(78.0),
                    child: Image.network(
                      'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: ScreenUtil.instance.setHeight(78.0),
                    width: ScreenUtil.instance.setWidth(78.0),
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
        Container(
          height: 25,
          width: double.infinity,
          margin: EdgeInsets.only(top: 13, left: 13, right: 13),
          child: Row(
            children: [
              Container(
                width: 4,
                margin: EdgeInsets.only(top: 4, bottom: 3, right: 10),
                color: Color(0xffff3e45),
              ),
              Text(
                '互动（52）',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: ScreenUtil.instance.setHeight(40.0),
                width: ScreenUtil.instance.setWidth(40.0),
                child: Image.network(
                  'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 40,
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '问问更多细节吧~',
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xff888888)),
                      ),
                    ))),
            Container(
              height: 40,
              width: 80,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfff45455),
              ),
              child: Center(
                child: Text(
                  '留言',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: ScreenUtil.instance.setHeight(40.0),
              width: ScreenUtil.instance.setWidth(40.0),
              child: Image.network(
                'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            '官方小助手 1分钟前',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff999999),
            ),
          ),
          subtitle: Text(
            '特别提示:请千万不要脱离平台进行交易，避免财物损失。谨防通过微信、支付宝加好友进行商品支付、转账、付押金等欺诈行为!',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff101010),
            ),
          ),
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: ScreenUtil.instance.setHeight(40.0),
              width: ScreenUtil.instance.setWidth(40.0),
              child: Image.network(
                'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            '打大西瓜  一天前',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff999999),
            ),
          ),
          subtitle: Text(
            '我这有！低价出',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff101010),
            ),
          ),
        ),
        Container(
          height: 440,
          width: double.infinity,
        ),
        Container(
          height: 25,
          width: double.infinity,
          margin: EdgeInsets.only(top: 13, left: 13, right: 13),
          child: Row(
            children: [
              Text(
                '为您推荐同型号',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
        Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.only(left: 13, top: 15),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        child: Image.network(
                          'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 20,
                          width: 60,
                          color: Color(0xff009688),
                          child: Text(
                            '已出报告',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      child: Text(
                        '小米 红米 Redmi Note7 4+128机身成色很新功能正常屏幕显....',
                        style: TextStyle(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '小米',
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 12),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '128g',
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 12),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '30天质保',
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 12),
                        ),
                      ],
                    ),
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        height: 13,
                        width: 10,
                        child: Text(
                          '¥',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffff1a22)),
                        ),
                      ),
                      Text(
                        '2700 起',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffff1a22),
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '立即查看验机报告',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffb8b8b8),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        Container(
          height: 25,
          width: double.infinity,
          margin: EdgeInsets.only(top: 28, left: 13, right: 13),
          child: Row(
            children: [
              Container(
                width: 4,
                margin: EdgeInsets.only(top: 4, bottom: 3, right: 10),
                color: Color(0xffff3e45),
              ),
              Text(
                '相似商品',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                  height: 274.0,
                  width: 174.0,
                  child: Column(
                    children: [
                      Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        height: 154,
                        width: 1740,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 41,
                        width: 143,
                        margin: EdgeInsets.fromLTRB(12, 10, 19, 10),
                        child: Text(
                          '清末民初回流纯老银壶一套，清末民初回流纯老…',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 15,
                            width: 55,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 13,
                                  width: 10,
                                  child: Text(
                                    '¥',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffff1a22)),
                                  ),
                                ),
                                Text(
                                  '2700 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffff1a22),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffffe8e8)),
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                '千万保障',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xffe51c23)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: ScreenUtil.instance.setWidth(10.0),
                          ),
                          ClipOval(
                            child: Image.network(
                              'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                              height: ScreenUtil.instance.setHeight(22.0),
                              width: ScreenUtil.instance.setWidth(22.0),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(46.0),
                            height: ScreenUtil.instance.setHeight(15.0),
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '北京朝阳',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(49.0),
                            height: ScreenUtil.instance.setHeight(15.0),
                            margin: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(25.0),
                            ),
                            child: Text(
                              '当前在线',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xffc8c8c8)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                  height: 274.0,
                  width: 174.0,
                  child: Column(
                    children: [
                      Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        height: 154,
                        width: 1740,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 41,
                        width: 143,
                        margin: EdgeInsets.fromLTRB(12, 10, 19, 10),
                        child: Text(
                          '清末民初回流纯老银壶一套，清末民初回流纯老…',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 15,
                            width: 55,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 13,
                                  width: 10,
                                  child: Text(
                                    '¥',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffff1a22)),
                                  ),
                                ),
                                Text(
                                  '2700 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffff1a22),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 60,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffffe8e8)),
                            child: Center(
                              child: Text(
                                '千万保障',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xffe51c23)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: ScreenUtil.instance.setWidth(10.0),
                          ),
                          ClipOval(
                            child: Image.network(
                              'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                              height: ScreenUtil.instance.setHeight(22.0),
                              width: ScreenUtil.instance.setWidth(22.0),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(46.0),
                            height: ScreenUtil.instance.setHeight(15.0),
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '北京朝阳',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(49.0),
                            height: ScreenUtil.instance.setHeight(15.0),
                            margin: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(25.0),
                            ),
                            child: Text(
                              '当前在线',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xffc8c8c8)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                  height: 274.0,
                  width: 174.0,
                  child: Column(
                    children: [
                      Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        height: 154,
                        width: 1740,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 41,
                        width: 143,
                        margin: EdgeInsets.fromLTRB(12, 10, 19, 10),
                        child: Text(
                          '清末民初回流纯老银壶一套，清末民初回流纯老…',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 15,
                            width: 55,
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 13,
                                  width: 10,
                                  child: Text(
                                    '¥',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffff1a22)),
                                  ),
                                ),
                                Text(
                                  '2700 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffff1a22),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 60,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffffe8e8)),
                            child: Center(
                              child: Text(
                                '千万保障',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xffe51c23)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: ScreenUtil.instance.setWidth(10.0),
                          ),
                          ClipOval(
                            child: Image.network(
                              'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                              height: ScreenUtil.instance.setHeight(22.0),
                              width: ScreenUtil.instance.setWidth(22.0),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(46.0),
                            height: ScreenUtil.instance.setHeight(15.0),
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '北京朝阳',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: ScreenUtil.instance.setWidth(49.0),
                            height: ScreenUtil.instance.setHeight(15.0),
                            margin: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(25.0),
                            ),
                            child: Text(
                              '当前在线',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xffc8c8c8)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),

            /********/
          ],
        )
        /****/
      ],
    );
  }
}