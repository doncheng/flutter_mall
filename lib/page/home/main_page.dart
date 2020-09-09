import 'package:flutter/material.dart';
import 'package:mall/page/home/evaluation.dart';

class MallHomePage extends StatefulWidget {
  MallHomePage({Key key}) : super(key: key);

  @override
  _MallHomePageState createState() => _MallHomePageState();
}

class _MallHomePageState extends State<MallHomePage> {
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfff8f8f8)),
                  margin: EdgeInsets.only(left: 10, right: 15),
                  height: 36,
                  width: sizewidth * 2 / 3,
                  child: Center(
                      child: Container(
                    width: sizewidth / 4,
                    height: 22,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xff8e8e8e),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '苹果11',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff888888)),
                        )
                      ],
                    ),
                  ))),
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
