import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
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
          '官方客服',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: CustomerBody(),
    );
  }
}

class CustomerBody extends StatefulWidget {
  CustomerBody({Key key}) : super(key: key);

  @override
  _CustomerBodyState createState() => _CustomerBodyState();
}

class _CustomerBodyState extends State<CustomerBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 122,
          width: double.infinity,
          child: Center(
              child: Container(
            height: 88,
            width: 211,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                      color: Color(0xffbfbfbf),
                      height: 40,
                      width: 40,
                      child: Image.network(''),
                    ),
                    SizedBox(
                      width: 88,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                      color: Color(0xffbfbfbf),
                      height: 40,
                      width: 40,
                      child: Image.network(''),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 56,
                      child: Text(
                        "我要提现",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Container(
                      height: 20,
                      width: 70,
                      child: Text(
                        "我要催发货",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          width: double.infinity,
          height: sizeheight - 320,
        ),
        Container(
          height: 50,
        )
      ],
    );
  }
}
