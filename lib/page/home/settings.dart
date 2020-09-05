import 'package:flutter/material.dart';
import 'package:mall/utils/navigator_util.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
      ),
      body: rowget(),
    );
  }
}

class rowget extends StatefulWidget {
  rowget({Key key}) : super(key: key);

  @override
  _rowgetState createState() => _rowgetState();
}

class _rowgetState extends State<rowget> {
  List listData = [
    {'rowname': '我的订单', 'iconname': Icons.home},
    {'rowname': '优惠券', 'iconname': Icons.home},
    {'rowname': '收藏', 'iconname': Icons.home},
    {'rowname': '地址管理', 'iconname': Icons.home},
    {'rowname': '我的足迹', 'iconname': Icons.home},
    {'rowname': '反馈', 'iconname': Icons.home},
    {'rowname': '关于我们', 'iconname': Icons.home},
  ];
  List<Widget> _rowget() {
//循环
    var tempList = listData.map((value) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
            child: InkWell(
              onTap: () {},
              // onTap: () => _toOrder(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(value['iconname']),
                      SizedBox(width: 5),
                      Center(
                        child: Text(
                          value['rowname'],
                          style: TextStyle(color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Divider(),
        ],
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this._rowget(),
    );
  }

  // _toOrder() {
  //   NavigatorUtils.goOrder(context);
  // }
}
