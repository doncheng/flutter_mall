import 'dart:ui';

import 'package:flutter/material.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('充值'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Expanded(
              child: Column(
        children: [
          Flexible(
            // height: screenHeight - 130,
            // // height: 670,

            child: ListView(
              children: [
                //充值模块
                Amnout(),
                //支付模块
                Pay(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '合计',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
                  height: 35,
                  width: 40,
                  child: Text(
                    "¥50",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  height: 32,
                  width: 80,
                  child: RaisedButton(
                      child: Text(
                        "支付",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      color: Colors.red,
                      onPressed: () {}),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}

class Amnout extends StatefulWidget {
  Amnout({Key key}) : super(key: key);

  @override
  _AmnoutState createState() => _AmnoutState();
}

class _AmnoutState extends State<Amnout> {
  int _chick = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, top: 25, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '魅道充值',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: '请输入充值金额'),
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 50,
              width: 100,
              //margin: EdgeInsets.only(right: 32),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('50元'),
                  color: this._chick == 1 ? Colors.red : Colors.white,
                  onPressed: () {
                    setState(() {
                      this._chick = 1;
                    });
                  }),
            ),
            Container(
              height: 50,
              width: 100,
              //margin: EdgeInsets.only(right: 32),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('200元'),
                  color: this._chick == 2 ? Colors.red : Colors.white,
                  onPressed: () {
                    setState(() {
                      this._chick = 2;
                    });
                  }),
            ),
            Container(
              height: 50,
              width: 100,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('500元'),
                  color: this._chick == 3 ? Colors.red : Colors.white,
                  onPressed: () {
                    setState(() {
                      this._chick = 3;
                    });
                  }),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 100,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('1000元'),
                    color: this._chick == 4 ? Colors.red : Colors.white,
                    onPressed: () {
                      setState(() {
                        this._chick = 4;
                      });
                    }),
              ),
              Container(
                height: 50,
                width: 100,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('1500元'),
                    color: this._chick == 5 ? Colors.red : Colors.white,
                    onPressed: () {
                      setState(() {
                        this._chick = 5;
                      });
                    }),
              ),
              Container(
                height: 50,
                width: 100,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('1998元'),
                    color: this._chick == 6 ? Colors.red : Colors.white,
                    onPressed: () {
                      setState(() {
                        this._chick = 6;
                      });
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Pay extends StatefulWidget {
  Pay({Key key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  var flag = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, top: 25, right: 20),
        child: Column(children: [
          Row(
            children: [
              Text(
                '充值数量',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: '请输入充值数量'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                '充值方式',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.network(
                                "https://kf.qq.com/img/wechat.png"),
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.network(
                                "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=781566647,131809619&fm=15&gp=0.jpg"),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "余额支付",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Radio(
                      value: 1,
                      groupValue: this.flag,
                      onChanged: (v) {
                        setState(() {
                          this.flag = v;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Radio(
                      value: 2,
                      groupValue: this.flag,
                      onChanged: (v) {
                        setState(() {
                          this.flag = v;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Radio(
                      value: 3,
                      groupValue: this.flag,
                      onChanged: (v) {
                        setState(() {
                          this.flag = v;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            color: Color(0xffeeeeee),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ]));
  }
}
