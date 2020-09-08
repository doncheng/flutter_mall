import 'package:flutter/material.dart';

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
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            padding: EdgeInsets.only(left: 20),
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
                Divider()
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            padding: EdgeInsets.only(left: 20),
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
                Divider()
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            padding: EdgeInsets.only(left: 20),
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
                Divider()
              ],
            ),
          ),
        ),
        Container(
          height: 60,
          width: sizewidth - 40,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: sizeheight - 400,
          ),
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
        )
      ],
    );
  }
}
