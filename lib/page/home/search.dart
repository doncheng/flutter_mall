import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String selectedValue;
  SearchPage({Key key, this.selectedValue = '宝贝'}) : super(key: key);

  @override
  _SearchPageState createState() =>
      _SearchPageState(selectedValue: this.selectedValue);
}

class _SearchPageState extends State<SearchPage> {
  String selectedValue;
  _SearchPageState({this.selectedValue});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeheight = size.height;
    final sizewidth = size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        brightness: Brightness.light,
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xfff0f0f0)),
                // margin: EdgeInsets.only(right: 10),
                height: 36,
                width: sizewidth * 0.65,
                child: Center(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // _showMenu(context);
                        },
                        child: Container(
                          height: 30,
                          width: 68,
                          child: Center(
                            child: PopupMenuButton(
//              icon: Icon(Icons.home),
                              child: Text(selectedValue,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  )),
                              // tooltip: "长按提示",
                              initialValue: "goods",
                              padding: EdgeInsets.all(0.0),
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuItem<String>>[
                                  PopupMenuItem<String>(
                                    child: Text("宝贝"),
                                    value: "goods",
                                  ),
                                  PopupMenuItem<String>(
                                    child: Text("商家"),
                                    value: "users",
                                  ),
                                ];
                              },
                              onSelected: (String action) {
                                switch (action) {
                                  case "goods":
                                    setState(() {
                                      selectedValue = '宝贝';
                                    });
                                    break;
                                  case "users":
                                    setState(() {
                                      selectedValue = '商家';
                                    });
                                    break;
                                }
                              },
                              onCanceled: () {
                                print("onCanceled");
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: sizewidth * 0.2,
                        height: 30,
                        margin: EdgeInsets.only(top: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '苹果11'),
                          style: TextStyle(fontSize: 13),
                        ),
                      )
                    ],
                  ),
                )),
            InkWell(
              onTap: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              },
              child: Container(
                height: 20,
                // width: 50,
                // margin: EdgeInsets.only(left: 16),
                child: Center(
                  child: Text(
                    '取消',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffff3e45),
                        fontWeight: FontWeight.normal),
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

  //自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return InkWell(
        onTap: () {
          setState(() {
            print(value["name"]);
          });
        },
        child: Container(
          height: 24,
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

typedef SearchItemCall = void Function(String item);

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //右侧显示内容 这里放清除按钮
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //左侧显示内容 这里放了返回按钮
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //点击了搜索显示的页面
    return Center(
      child: Text('123'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //点击了搜索窗显示的页面
    return SearchContentView();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}

class SearchContentView extends StatefulWidget {
  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState extends State<SearchContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[SearchBody()],
      ),
    );
  }
}

class SearchItem extends StatefulWidget {
  @required
  final String title;
  const SearchItem({Key key, this.title}) : super(key: key);
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
          print(widget.title);
        },
      ),
      color: Colors.white,
    );
  }
}
