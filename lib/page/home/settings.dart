import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:toast/toast.dart';

import 'dioManger.dart';

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
    ///显示指定Map的限定类型
    Map<String, String> parms = {};
    Map<String, String> headers = {
      "X-Litemall-Token":
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0aGlzIGlzIGxpdGVtYWxsIHRva2VuIiwiYXVkIjoiTUlOSUFQUCIsImlzcyI6IkxJVEVNQUxMIiwiZXhwIjoxNjAxNDQyMzI5LCJ1c2VySWQiOjEsImlhdCI6MTYwMTQzNTEyOX0.rhn1kgy9ZTcz822_aDuf1qCluCpVOA0Vkgs64VPu1wE'
    };
    DioManger.getInstance().post(Api.LOGIN_OUT, parms, headers, (response) {
      Map<String, dynamic> map = json.decode(response);
      print(map);
      Toast.show("退出登录成功", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);

      loginEventBus.fire(LoginEvent(false));
      Navigator.pop(context);
    }, (error) {
      Toast.show("退出登录失败", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      print(error.toString());
    });
  }
  // _toOrder() {
  //   NavigatorUtils.goOrder(context);
  // }
}
