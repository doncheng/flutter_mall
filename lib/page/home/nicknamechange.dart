import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class nicknamechangePage extends StatefulWidget {
  nicknamechangePage({Key key}) : super(key: key);

  @override
  _nicknamechangePageState createState() => _nicknamechangePageState();
}

class _nicknamechangePageState extends State<nicknamechangePage> {
  _toast() {
    // bgcolor: "#9E9E9E",
    // textcolor: '#ffffff');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xffbfbfbf), //修改颜色
          ),
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            '昵称',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            FlatButton(
                padding: EdgeInsets.only(left: 35),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "网络连接错误",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                  );
                },
                child: Text(
                  '保存',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            changebox(),
            SizedBox(height: 10),
            Container(
                height: 20,
                width: double.infinity,
                margin: EdgeInsets.only(left: 35),
                child: Text(
                  '设置后，其他人将看到你的昵称。',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ))
          ],
        ));
  }
}

class changebox extends StatefulWidget {
  changebox({Key key}) : super(key: key);

  @override
  _changeboxState createState() => _changeboxState();
}

class _changeboxState extends State<changebox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.only(left: 14),
        child: Center(
          child: Row(
            children: <Widget>[
              Text('昵称'),
              SizedBox(width: 26),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 7),
                width: 260,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '我是名称',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 14)),
                ),
              )
            ],
          ),
        ));
  }
}
