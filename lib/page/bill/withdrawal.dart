import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:mall/utils/navigator_util.dart';

class WithdrawalPage extends StatelessWidget {
  const WithdrawalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        title: Text(
          '提现',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffefefe),
      body: WithdrawalBody(),
    );
  }
}

class WithdrawalBody extends StatefulWidget {
  WithdrawalBody({Key key}) : super(key: key);

  @override
  _WithdrawalBodyState createState() => _WithdrawalBodyState();
}

class _WithdrawalBodyState extends State<WithdrawalBody> {
  final size = window.physicalSize;

  @override
  String withdrawal = '1000';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return ListView(
      children: [
        Container(
          color: Colors.white,
          height: 120,
          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          '提现金额',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              Divider(
                color: Color(0xffdddddd),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      '¥',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      width: width - 70,
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
        PayMethod(),
        Chick(),
      ],
    );
  }
}

class Chick extends StatefulWidget {
  Chick({Key key}) : super(key: key);

  @override
  _ChickState createState() => _ChickState();
}

class _ChickState extends State<Chick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(10, 50, 10, 70),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.red,
        child: Text(
          '提现',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            _toAssets();
          });
        },
      ),
    );
  }

  _toAssets() {
    NavigatorUtils.goAssetsPage(context);
  }
}

class PayMethod extends StatefulWidget {
  PayMethod({Key key}) : super(key: key);

  @override
  _PayMethodState createState() => _PayMethodState();
}

class _PayMethodState extends State<PayMethod> {
  Animation animation;
  int radio = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Row(
              children: [
                Center(
                  child: Text(
                    '提现方式',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
        // Divider(
        //   color: Color(0xffdddddd),
        // ),
        ExpansionTile(
          leading: Image.network(
            'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3673269788,472516603&fm=26&gp=0.jpg',
            height: 26,
            width: 26,
          ),
          title: Text('选择银行卡', style: TextStyle(fontSize: 15)),
          // backgroundColor: Colors.lightBlue,
          initiallyExpanded: false, //默认是否展开
          children: <Widget>[
            BankCard(),
            ListTile(
              leading:
                  IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
              title: Text(
                "添加银行卡",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    )
        // )
        ;
  }
}

class BankCard extends StatefulWidget {
  BankCard({Key key}) : super(key: key);

  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  List list = [
    {"name": '工商银行储蓄卡', "number": '5632', "val": '1'},
    {"name": '建设银行储蓄卡', "number": '4641', "val": '2'},
    {"name": '农业银行储蓄卡', "number": '5874', "val": '3'},
  ];

  int item = 0;
//自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return InkWell(
          onTap: () {
            setState(() {
              item = int.parse(value["val"]);
            });
          },
          child: ListTile(
            leading: SizedBox(
              width: 20,
            ),
            title: Text(
              value["name"] + "(" + value["number"] + ")",
              style: TextStyle(
                  fontSize: 14,
                  color: this.item == int.parse(value["val"])
                      ? Colors.blue
                      : Colors.black),
            ),
            trailing: Icon(
              Icons.check_circle,
              color: this.item == int.parse(value["val"])
                  ? Colors.red
                  : Colors.transparent,
            ),
          ));
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._getData(),
    );
  }
}
