import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeheight = size.height;
    final sizewidth = size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xff02347B),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                  decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                  margin: EdgeInsets.only(left: 10, right: 15),
                  height: 36,
                  width: sizewidth * 2 / 3,
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 68,
                          child: ExpansionTile(
                            leading: Image.network(
                              'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3673269788,472516603&fm=26&gp=0.jpg',
                              height: 26,
                              width: 26,
                            ),
                            title: Text('宝贝', style: TextStyle(fontSize: 14)),
                            // backgroundColor: Colors.lightBlue,
                            initiallyExpanded: false, //默认是否展开
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Text('手机'),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Text('手机'),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Text('手机'),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Text('手机'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                height: 36,
                width: 50,
                margin: EdgeInsets.only(left: 15),
                child: Center(
                  child: Text(
                    '领现金',
                    style: TextStyle(fontSize: 15, color: Color(0xffffffff)),
                  ),
                ),
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xff88ffff),
      ),
    );
  }
}
