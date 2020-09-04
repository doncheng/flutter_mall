import 'package:flutter/material.dart';

class WalletCardPage extends StatelessWidget {
  const WalletCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '收款账户管理',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Color(0xfff0f0f0),
      body: CardPackage(),
    );
  }
}

class CardPackage extends StatefulWidget {
  CardPackage({Key key}) : super(key: key);

  @override
  _CardPackageState createState() => _CardPackageState();
}

class _CardPackageState extends State<CardPackage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CardList(),
      ListTile(
        leading: IconButton(icon: Icon(Icons.add), onPressed: () {}),
        title: Text(
          "添加银行卡",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    ]);
  }
}

class CardList extends StatefulWidget {
  CardList({Key key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List list = [
    {"name": '工商银行储蓄卡', "number": '5632', "category": '储蓄卡'},
    {"name": '建设银行储蓄卡', "number": '4641', "category": '信用卡'},
    {"name": '农业银行储蓄卡', "number": '5874', "category": '储蓄卡'},
    {"name": '工商银行储蓄卡', "number": '5632', "category": '储蓄卡'},
    {"name": '建设银行储蓄卡', "number": '4641', "category": '信用卡'},
    {"name": '农业银行储蓄卡', "number": '5874', "category": '储蓄卡'},
  ];

  int i = 0;
//自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      i == 2 ? i = 0 : i++;
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: i == 0 ? Colors.blue : i == 1 ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4093895254,2154682468&fm=26&gp=0.jpg',
                ),
              ),
              title: Text(
                value["name"],
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: Text(
                value["category"],
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                SizedBox(
                  width: 70,
                ),
                Text(
                  '****   ****   ****   ' + value["number"],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._getData(),
    );
  }
}
