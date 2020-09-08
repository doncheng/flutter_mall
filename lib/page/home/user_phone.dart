import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserPhonePage extends StatelessWidget {
  const UserPhonePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        title: Text(
          '绑定手机号',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: PhoneBody(),
    );
  }
}

class PhoneBody extends StatefulWidget {
  PhoneBody({Key key}) : super(key: key);

  @override
  _PhoneBodyState createState() => _PhoneBodyState();
}

class _PhoneBodyState extends State<PhoneBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(20),
          height: 40,
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 0),
          child: TextField(
            style: TextStyle(fontSize: 14, color: Color(0xffbfbfbf)),
            decoration:
                InputDecoration(border: InputBorder.none, hintText: '绑定手机号'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                height: 20,
                width: 150,
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Color(0xffbfbfbf)),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '请输入验证码'),
                ),
              ),
              InkWell(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 10),
                  height: 20,
                  width: 60,
                  child: Center(
                    child: Text(
                      '发送验证码',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ),
                ),
                onTap: () {},
              )
            ],
          )),
        ),
        Container(
          height: 50,
          width: sizewidth - 40,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 52),
          child: RaisedButton(
            color: Color(0xffcf1322),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Text(
              '立即绑定',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              // Fluttertoast.showToast(
              //   msg: "网络连接错误",
              //   toastLength: Toast.LENGTH_SHORT,
              //   gravity: ToastGravity.BOTTOM,
              //   timeInSecForIos: 1,
              //   textColor: Colors.white,
              //   backgroundColor: Colors.yellow

              // );
            },
          ),
        ),
      ],
    );
  }
}
