import 'package:flutter/material.dart';

class ProblemPage extends StatelessWidget {
  const ProblemPage({Key key}) : super(key: key);

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
          '常见问题',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ProblemBody(),
    );
  }
}

class ProblemBody extends StatefulWidget {
  ProblemBody({Key key}) : super(key: key);

  @override
  _ProblemBodyState createState() => _ProblemBodyState();
}

class _ProblemBodyState extends State<ProblemBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Text(
            '问题类型',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Container(
          height: 370,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
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
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  height: 42,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('为什么提现没到帐？',
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
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  height: 42,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('如何申请退款？',
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
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  height: 42,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('保证金可以退么？',
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
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  height: 42,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('可以和卖家进行沟通吗？',
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
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  height: 42,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('买的游戏点卡用不了怎么回事？',
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
            ],
          ),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxHeight: double.infinity),
          color: Color(0xfff5f5f5),
          child: TextField(
            maxLines: 10,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
