import 'package:flutter/material.dart';

class BalanceRechargePage extends StatelessWidget {
  const BalanceRechargePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
  String reacharge = '1000';
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
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      width: width - 70,
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
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
        Chick()
      ],
    );
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
    return
        //  Container(
        //   color: Colors.white,
        //   height: 412,
        //   margin: EdgeInsets.all(10),
        //   child:
        Column(
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
        Container(
          margin: EdgeInsets.only(left: 15, bottom: 10, top: 5),
          child: Row(
            children: [
              Container(
                height: 26,
                width: 26,
                child: Image.network("https://kf.qq.com/img/wechat.png"),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "微信支付",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 5),
          child: Row(
            children: [
              Container(
                height: 26,
                width: 26,
                padding: EdgeInsets.all(2),
                child: Image.network(
                    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1816752600,129898364&fm=26&gp=0.jpg"),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "支付宝支付",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        ExpansionTile(
          leading: Image.network(
            'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3673269788,472516603&fm=26&gp=0.jpg',
            height: 26,
            width: 26,
          ),
          title: Text('银行卡', style: TextStyle(fontSize: 15)),
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
  int radio = 0;
//自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return ListTile(
        leading: SizedBox(
          width: 20,
        ),
        title: Text(
          value["name"] + "(" + value["number"] + ")",
          style: TextStyle(
              fontSize: 14,
              color: this.radio == int.parse(value["val"])
                  ? Colors.blue
                  : Colors.black),
        ),
        trailing: Radio(
            value: int.parse(value["val"]),
            groupValue: radio,
            onChanged: (v) {
              setState(() {
                this.radio = v;
              });
            }),
      );
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
