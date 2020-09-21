import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/page/bill/search_one.dart';

class SearchDemo extends StatefulWidget {
  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  FocusNode _focusNode;
  TextEditingController _controller;
  String _searchText;

  String text;
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

  //自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return InkWell(
        onTap: () {
          setState(() {
            text = value["name"];
            print(value["name"]);
          });
        },
        child: Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Color(0xfff0f0f0)),
          child: Text(
            value["name"],
            style: TextStyle(fontSize: 12),
          ),
        ),
      );
    });
    return tempList.toList();
  }

  Widget _sortView() {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
        height: ScreenUtil.instance.setHeight(157),
        child: Column(
          children: [
            Container(
              height: 22,
              margin: EdgeInsets.only(
                left: 15,
                bottom: 10,
              ),
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
              height: 80,
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
        ));
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new SearchAppBarWidget(
          focusNode: _focusNode,
          controller: _controller,
          elevation: 2.0,
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(150),
          ],
          onEditingComplete: () {
            print('搜索框输入的内容是： ${_controller.text}');
            setState(() {
              _searchText = _controller.text;
            });

            _focusNode.unfocus();
          },
        ),
        body: ListView(
          children: [
            _sortView(),
          ],
        ));
  }
}
