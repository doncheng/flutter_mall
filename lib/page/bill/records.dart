import 'package:flutter/material.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('充值记录'),
          centerTitle: true,
        ),
        body: Record());
  }
}

class Record extends StatefulWidget {
  Record({Key key}) : super(key: key);

  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  var now = DateTime.now();
  var time = TimeOfDay.now();
  int item = 1;
  int item1 = 1;
  int item2 = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (item == 0) {
                item = 1;
              } else {
                item = 0;
              }
            });
          },
          child: item == 0
              ? Column(
                  children: [
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2020年3月",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "2020年3月",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_drop_up)
                    ],
                  ),
                ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          child: item == 1 ? HomeContent() : null,
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (item1 == 0) {
                item1 = 1;
              } else {
                item1 = 0;
              }
            });
          },
          child: item1 == 0
              ? Column(
                  children: [
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2020年2月",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "2020年2月",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_drop_up)
                    ],
                  ),
                ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          child: item1 == 1 ? HomeContent() : null,
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (item2 == 0) {
                item2 = 1;
              } else {
                item2 = 0;
              }
            });
          },
          child: item2 == 0
              ? Column(
                  children: [
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2020年1月",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "2020年1月",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_drop_up)
                    ],
                  ),
                ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          child: item2 == 1 ? HomeContent() : null,
        ),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  List list = [
    {"item": '游戏点卡', "time": '16:40', "price": '+100'},
    {"item": 'QQ会员', "time": '16:40', "price": '-50'},
    {"item": '游戏交易', "time": '16:40', "price": '-1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '-1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'}
  ];
//自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return ListTile(
        leading: Image.network(
            "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=983607208,3903092395&fm=26&gp=0.jpg"),
        title: Text(value["item"]),
        subtitle: Text(value["time"]),
        trailing: Text(
          value["price"],
          style: TextStyle(
              fontSize: 20,
              color: int.parse(value["price"]) > 0 ? Colors.red : Colors.black),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Column(
      children: this._getData(),
    );
  }
}
