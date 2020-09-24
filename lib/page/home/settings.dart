import 'package:flutter/material.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/event/login_event.dart';
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
    // {'rowname': '我的订单', 'iconname': Icons.home},
    // {'rowname': '优惠券', 'iconname': Icons.home},
    // {'rowname': '收藏', 'iconname': Icons.home},
    {'rowname': '地址管理', 'iconname': Icons.home},
    // {'rowname': '我的足迹', 'iconname': Icons.home},
    {'rowname': '反馈', 'iconname': Icons.home},
    {'rowname': '关于我们', 'iconname': Icons.home},
  ];
  List<Widget> _rowget() {
//循环
    var tempList = listData.map((value) {
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
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
    final screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Column(
          children: this._rowget(),
        ),
        SizedBox(height: 100),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: RaisedButton(
            color: Colors.red,
            onPressed: () => _loginOut(),
            child: Text(
              '退出登陆',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  _loginOut() {
    // _userService.loginOut((success) {
    //   loginEventBus.fire(LoginEvent(false));
    // }, (error) {
    //   loginEventBus.fire(LoginEvent(false));
    //   ToastUtil.showToast(error);
    // });
    // Navigator.pop(context);
    loginEventBus.fire(LoginEvent(false));
    Navigator.pop(context);
  }
  // _toOrder() {
  //   NavigatorUtils.goOrder(context);
  // }
}
