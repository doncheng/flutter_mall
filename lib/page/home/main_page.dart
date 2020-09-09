import 'package:flutter/material.dart';
import 'package:mall/utils/navigator_util.dart';

class MallHomePage extends StatefulWidget {
  MallHomePage({Key key}) : super(key: key);

  @override
  _MallHomePageState createState() => _MallHomePageState();
}

class _MallHomePageState extends State<MallHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xff02347B),
        elevation: 0,
        title: titlerow(),
        centerTitle: true,
      ),
      body: Text('sss'),
    );
  }
}

class titlerow extends StatefulWidget {
  titlerow({Key key}) : super(key: key);

  @override
  _titlerowState createState() => _titlerowState();
}

class _titlerowState extends State<titlerow> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeheight = size.height;
    final sizewidth = size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => _toSearchPage(),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xfff8f8f8)),
              margin: EdgeInsets.only(left: 10),
              height: 36,
              width: sizewidth * 0.7,
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
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff888888),
                          fontWeight: FontWeight.normal),
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
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }

  _toSearchPage() {
    NavigatorUtils.goSearchPage(context);
  }
}
