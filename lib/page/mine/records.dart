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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 40,
          child: Text(
            "2020年3月",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        HomeContent(),
        Container(
          height: 40,
          child: Text(
            "2020年2月",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        HomeContent(),
        Container(
          height: 40,
          child: Text(
            "2020年1月",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        HomeContent(),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  List list = [
    {"item": '游戏点卡', "time": '16:40', "price": '100'},
    {"item": 'QQ会员', "time": '16:40', "price": '50'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'}
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
          style: TextStyle(fontSize: 20, color: Colors.red),
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
