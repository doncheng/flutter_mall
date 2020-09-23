import 'package:flutter/material.dart';
import 'package:mall/page/home/user_phone.dart';

class MySetingPage extends StatelessWidget {
  const MySetingPage({Key key}) : super(key: key);

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
          '设置',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SetBody(),
    );
  }
}

class SetBody extends StatefulWidget {
  SetBody({Key key}) : super(key: key);

  @override
  _SetBodyState createState() => _SetBodyState();
}

class _SetBodyState extends State<SetBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeheight = size.height;
    final sizewidth = size.width;
    return SafeArea(
        child: Column(
      children: [
        Flexible(
            child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(left: 20, top: 10),
                height: 42,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('个人资料',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.arrow_right),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.5,
              color: Color(0xfff0f0f0),
              margin: EdgeInsets.only(left: 20),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        //导航打开新视图
                        builder: (context) => UserPhonePage()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(left: 20, top: 10),
                height: 42,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('手机号绑定',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.arrow_right),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.5,
              color: Color(0xfff0f0f0),
              margin: EdgeInsets.only(left: 20),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(left: 20, top: 10),
                height: 42,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('修改密码',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.arrow_right),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.5,
              color: Color(0xfff0f0f0),
              margin: EdgeInsets.only(left: 20),
            ),
          ],
        )),
        Container(
          height: 60,
          width: sizewidth - 40,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: RaisedButton(
            color: Color(0xfff0f0f0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Text(
              '退出登录',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
          ),
        ),
      ],
    ));
  }
}
