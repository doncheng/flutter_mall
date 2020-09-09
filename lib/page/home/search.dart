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
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        title: Row(
          children: [
            Container(
                decoration: BoxDecoration(color: Color(0xfff0f0f0)),
                margin: EdgeInsets.only(left: 10, right: 15),
                height: 36,
                width: sizewidth * 2 / 3,
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 68,
                        child: Center(
                          child: Text('宝贝',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ),
                      ),
                      Container(
                        width: sizewidth * 2 / 3 - 68,
                        height: 30,
                        margin: EdgeInsets.only(top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '苹果11'),
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff888888)),
                        ),
                      )
                    ],
                  ),
                )),
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                height: 36,
                width: 50,
                margin: EdgeInsets.only(left: 16),
                child: Center(
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: 15, color: Color(0xffff3e45)),
                  ),
                ),
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SearchBody(),
    );
  }
}

class SearchBody extends StatefulWidget {
  SearchBody({Key key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List list = [
    {"name": '洗衣机'},
    {"name": '苹果7'},
    {"name": '华为'},
    {"name": 'ps4'},
    {"name": '电瓶车'},
    {"name": '大疆'},
    {"name": '荣耀play'},
    {"name": '三星s10'},
  ];
  int radio = 0;
  //自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return Container(
        height: 24,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Color(0xfff0f0f0)),
        child: Text(
          value["name"],
          style: TextStyle(fontSize: 12),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 22,
          margin: EdgeInsets.only(left: 15, bottom: 10),
          width: double.infinity,
          child: Text(
            '推荐搜索',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          height: 60,
          width: double.infinity,
          child: Wrap(
            //元素横轴之间的距离
            spacing: 10,
//纵轴的距离
            runSpacing: 10,
            children: _getData(),
          ),
        )
      ],
    );
  }
}
