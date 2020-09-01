import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  landingPage({Key key}) : super(key: key);

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  double textfontsize = 12.0;
  double iconsize = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账号登陆'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 52),
            height: 100,
            width: 100,
            child: CircleAvatar(
              child: Icon(Icons.home),
            ),
          ),
          SizedBox(height: 69),
          Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            width: 352,
            height: 45,
            child: RaisedButton(
              color: Colors.red,
              child: Text(
                '手机一键登陆',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 82),
          Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 120,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Text(
                  '其他方式登陆',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Container(
                  width: 120,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 58),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: this.iconsize,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '支付宝',
                    style: TextStyle(
                      fontSize: this.textfontsize,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: this.iconsize,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '微信',
                    style: TextStyle(
                      fontSize: this.textfontsize,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: this.iconsize,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Apple',
                    style: TextStyle(
                      fontSize: this.textfontsize,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: this.iconsize,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '免验证',
                    style: TextStyle(
                      fontSize: this.textfontsize,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
