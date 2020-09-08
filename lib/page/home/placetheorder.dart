import 'package:flutter/material.dart';

class PlacetheorderPage extends StatefulWidget {
  PlacetheorderPage({Key key}) : super(key: key);

  @override
  _PlacetheorderPageState createState() => _PlacetheorderPageState();
}

class _PlacetheorderPageState extends State<PlacetheorderPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenwidth = size.width;
    final screenheight = size.height;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 0, // 隐藏阴影
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                '确认订单',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              leading: InkWell(
                child: Icon(
                  Icons.navigate_before,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SafeArea(
              child: Container(
                  height: screenheight,
                  width: double.infinity,
                  child: Expanded(
                    child: Column(children: <Widget>[
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              payattention(),
                              address(),
                              orderdetails(),
                              methodofpayment(),
                              totalpricelist(),
                              SizedBox(height: 30)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 10, top: 7),
                        width: double.infinity,
                        // height: 120,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '合计：¥ 2638.00',
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: 35,
                                width: 100,
                                child: RaisedButton(
                                  onPressed: () {},
                                  color: Colors.red,
                                  child: Center(
                                    child: Text(
                                      '确认下单',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      )
                    ]),
                  )),
            )));
  }
}

class address extends StatefulWidget {
  address({Key key}) : super(key: key);

  @override
  _addressState createState() => _addressState();
}

class _addressState extends State<address> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('我是名称 我是号码'),
                subtitle: Text('我是地址'),
              ),
            ),
          )),
    );
  }
}

class orderdetails extends StatefulWidget {
  orderdetails({Key key}) : super(key: key);

  @override
  _orderdetailsState createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 283,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3059487849,303561658&fm=26&gp=0.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text('我是店名'),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(left: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12)),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3059487849,303561658&fm=26&gp=0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: Text(
                          '商品名称商品名称商品名称名称商品名名品名名称商品名品名名称商品名称商品名名称商品名',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '¥2700.00',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 15),
                color: Colors.red[50],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.red,
                              ),
                              SizedBox(width: 2),
                              Text(
                                '转+',
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '支持验机',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.help_outline,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 200,
                            child: Text(
                              '商品名称商品名称商品名称名称商品名名品名名称商品名品名名称商品名称商品名名称商品名',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              '¥ 39.00',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 15),
                            Container(
                              child: Center(
                                child: Text(
                                  '体验价',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class methodofpayment extends StatefulWidget {
  methodofpayment({Key key}) : super(key: key);

  @override
  _methodofpaymentState createState() => _methodofpaymentState();
}

class _methodofpaymentState extends State<methodofpayment> {
  int _chick = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 195,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Card(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '支付方式',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '在线支付',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          width: 80,
                          child: Center(
                            child: Text(
                              '微信支付',
                              style: TextStyle(
                                  color: this._chick == 1
                                      ? Colors.blue
                                      : Colors.green),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: this._chick == 1
                                    ? Colors.blue
                                    : Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            this._chick = 1;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          width: 80,
                          child: Center(
                            child: Text(
                              '微信信用卡',
                              style: TextStyle(
                                  color: this._chick == 2
                                      ? Colors.blue
                                      : Colors.green),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: this._chick == 2
                                    ? Colors.blue
                                    : Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            this._chick = 2;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          width: 80,
                          child: Center(
                            child: Text(
                              '支付宝支付',
                              style: TextStyle(
                                  color: this._chick == 3
                                      ? Colors.blue
                                      : Colors.green),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: this._chick == 3
                                    ? Colors.blue
                                    : Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            this._chick = 3;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '卖家配送方式',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '快递 ¥ 0.00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '红包',
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '暂无可用红包',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class totalpricelist extends StatefulWidget {
  totalpricelist({Key key}) : super(key: key);

  @override
  _totalpricelistState createState() => _totalpricelistState();
}

class _totalpricelistState extends State<totalpricelist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 145,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '商家总额',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '¥ 2599.00',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '运费（卖家邮寄至平台）',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '+ ¥ 00.00',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '服务费',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '+ ¥ 39.00',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class payattention extends StatefulWidget {
  payattention({Key key}) : super(key: key);

  @override
  _payattentionState createState() => _payattentionState();
}

class _payattentionState extends State<payattention> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.orange[100],
      child: Text(
        '验机服务须知：验机商品将由卖家先寄往平台进行质检，请拒绝卖家私下为您发货。',
        style: TextStyle(fontSize: 12, color: Colors.orange[300]),
      ),
    );
  }
}
