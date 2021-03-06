import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/page/home/personaldata.dart';

class nicknamechangePage extends StatefulWidget {
  final String nicknamefrompersonaldataPage;
  nicknamechangePage({Key key, this.nicknamefrompersonaldataPage = '同步昵称'})
      : super(key: key);

  @override
  _nicknamechangePageState createState() =>
      _nicknamechangePageState(this.nicknamefrompersonaldataPage);
}

class _nicknamechangePageState extends State<nicknamechangePage> {
  String nicknamechangePagenickname;
  _nicknamechangePageState(nicknamefrompersonaldataPage) {
    this.nicknamechangePagenickname = nicknamefrompersonaldataPage;
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
                padding: EdgeInsets.only(left: 25),
                onPressed: () => _topersonaldataPage(),
                child: Text(
                  '保存',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
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
                          padding: EdgeInsets.only(top: 4),
                          width: 260,
                          child: Center(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: this.nicknamechangePagenickname,
                                // hintStyle: TextStyle(
                                //     color: Colors.black, fontSize: 14),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  this.nicknamechangePagenickname = value;
                                  // print(this.nicknamechangePagenickname);
                                });
                              },
                            ),
                          ))
                    ],
                  ),
                )),
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

  _topersonaldataPage() {
    // NavigatorUtils.gonicknamechangePage(context);
    Navigator.of(context).pop(this.nicknamechangePagenickname);
  }
}
