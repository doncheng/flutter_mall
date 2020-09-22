import 'package:flutter/material.dart';

class BalanceRechargePage extends StatelessWidget {
  const BalanceRechargePage({Key key}) : super(key: key);

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
          '余额充值',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Color(0xfff0f0f0),
      body: BalanceRechargeBody(),
    );
  }
}

class BalanceRechargeBody extends StatefulWidget {
  BalanceRechargeBody({Key key}) : super(key: key);

  @override
  _BalanceRechargeBodyState createState() => _BalanceRechargeBodyState();
}

class _BalanceRechargeBodyState extends State<BalanceRechargeBody> {
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
                          '充值金额',
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
                  //输入金额文本框
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      width: width - 70,
                      child: Center(
                        child: TextField(
                          onChanged: (value) {},
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
        Chick() //点击触发的事件
      ],
    );
  }
}

//支付的模块
class PayMethod extends StatefulWidget {
  PayMethod({Key key}) : super(key: key);

  @override
  _PayMethodState createState() => _PayMethodState();
}

class _PayMethodState extends State<PayMethod> {
  Animation animation;
  int radio = 0;
  int item = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Center(
                  child: Text(
                    '充值方式',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
        Divider(
          color: Color(0xffdddddd),
        ),
        InkWell(
          onTap: () {
            //点击勾选或取消
            setState(() {
              if (item == 1) {
                item = 0;
              } else {
                item = 1;
              }
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 15, bottom: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 26,
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 26,
                        width: 26,
                        child:
                            Image.network("https://kf.qq.com/img/wechat.png"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "微信支付",
                        style: TextStyle(
                            fontSize: 15,
                            color: item == 1 ? Colors.blue : Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.check_circle,
                    color: item == 1 ? Colors.red : Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //点击勾选或取消
            setState(() {
              if (item == 2) {
                item = 0;
              } else {
                item = 2;
              }
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 15, bottom: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 26,
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 26,
                        width: 26,
                        child: Image.network(
                            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1816752600,129898364&fm=26&gp=0.jpg"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "支付宝支付",
                        style: TextStyle(
                            fontSize: 15,
                            color: item == 2 ? Colors.blue : Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.check_circle,
                    color: item == 2 ? Colors.red : Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              //展开银行卡列表
              if (item == 3) {
                item = 0;
              } else {
                item = 3;
              }
            });
          },
          child: Container(
            constraints: BoxConstraints(maxHeight: double.infinity),
            width: double.infinity,
            child: ListTile(
              leading: Image.network(
                'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3673269788,472516603&fm=26&gp=0.jpg',
                height: 26,
                width: 26,
              ),
              title: Text('银行卡', style: TextStyle(fontSize: 15)),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxHeight: double.infinity),
          child: item == 3
              ? Column(
                  children: [
                    BankCard(), //循环列出卡表
                    ListTile(
                      leading: IconButton(
                          icon: Icon(Icons.add_circle), onPressed: () {}),
                      title: Text(
                        "添加银行卡",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                )
              : null,
        ),
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
          '充值',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onPressed: () {
          setState(() {});
        },
      ),
    );
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
