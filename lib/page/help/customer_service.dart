import 'package:flutter/material.dart';
import 'package:mall/page/help/problem.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('11111');
  }

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
                      child: Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 88,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                      color: Color(0xffbfbfbf),
                      height: 40,
                      width: 40,
                      child: Image.network(
                        'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                        fit: BoxFit.cover,
                      ),
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
            color: Colors.white,
            width: double.infinity,
            height: sizeheight - 320,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            //导航打开新视图
                            builder: (context) => ProblemPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        height: 20,
                        width: 56,
                        child: Text(
                          '常见问题',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 10),
                        height: 20,
                        width: 84,
                        child: Text(
                          '查看所有问题',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffbfbfbf)),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 20),
                    height: 42,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('账号被找回，怎么办？',
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
                    padding: EdgeInsets.only(left: 20),
                    height: 42,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('账号被找回，怎么办？',
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
                    padding: EdgeInsets.only(left: 20),
                    height: 42,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('账号被找回，怎么办？',
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
                    padding: EdgeInsets.only(left: 20),
                    height: 42,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('账号被找回，怎么办？',
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
                    padding: EdgeInsets.only(left: 20),
                    height: 42,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('账号被找回，怎么办？',
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
                    padding: EdgeInsets.only(left: 20),
                    height: 42,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('账号被找回，怎么办？',
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
                  height: sizeheight / 3 - 130,
                  color: Color(0xfff5f5f5),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            )),
        Container(
          height: 50,
          child: Center(
            child: Container(
              height: 20,
              width: 85,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    width: 20,
                    height: 20,
                    color: Colors.green,
                    child: Image.network(
                      'https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text('在线客服')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
