import 'package:flutter/material.dart';

class BalanceRechargePage extends StatelessWidget {
  const BalanceRechargePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '余额充值',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfff0f0f0),
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
                  Text(reacharge,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
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
  int radio = 0;
  String bandcard1 = null;
  String bandcard2 = null;
  String bandcard3 = null;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 412,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Center(
                    child: Text(
                      '充值方式',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              ListTile(
                leading: SizedBox(
                  width: 20,
                ),
                title: Text(
                  "工商银行储蓄卡 (5632）",
                  style: TextStyle(
                      fontSize: 14,
                      color: this.radio == 1 ? Colors.blue : Colors.black),
                ),
                trailing: Radio(
                    value: 1,
                    groupValue: radio,
                    onChanged: (v) {
                      setState(() {
                        this.radio = v;
                      });
                    }),
              ),
              ListTile(
                leading: SizedBox(
                  width: 20,
                ),
                title: Text(
                  "建设银行储蓄卡 (4641）",
                  style: TextStyle(
                      fontSize: 14,
                      color: this.radio == 2 ? Colors.blue : Colors.black),
                ),
                trailing: Radio(
                    value: 2,
                    groupValue: radio,
                    onChanged: (v) {
                      setState(() {
                        this.radio = v;
                      });
                    }),
              ),
              ListTile(
                leading: SizedBox(
                  width: 20,
                ),
                title: Text(
                  "农业银行储蓄卡 (3510）",
                  style: TextStyle(
                      fontSize: 14,
                      color: this.radio == 3 ? Colors.blue : Colors.black),
                ),
                trailing: Radio(
                    value: 3,
                    groupValue: radio,
                    onChanged: (v) {
                      setState(() {
                        this.radio = v;
                      });
                    }),
              ),
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
      ),
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
