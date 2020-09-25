import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MassagePage extends StatefulWidget {
  MassagePage({Key key}) : super(key: key);

  @override
  _MassagePageState createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        title: Text(
          '消息中心',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.message,
            size: 27,
            color: Color(0xff303030),
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      // backgroundColor: Colors.white,
      body: MassageBody(),
    );
  }
}

class MassageBody extends StatefulWidget {
  MassageBody({Key key}) : super(key: key);

  @override
  _MassageBodyState createState() => _MassageBodyState();
}

class _MassageBodyState extends State<MassageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              constraints: BoxConstraints(maxHeight: double.infinity),
              width: 240,
              child: Text(
                '关注微信公众号,通过微信随时接收用户咨询、订单状态',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Color(0xff757575)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  height: 30,
                  width: 80,
                  margin: EdgeInsets.only(top: 5, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffff5555)),
                  child: Center(
                    child: Text(
                      '立即关注',
                      style: TextStyle(fontSize: 14, color: Color(0xffffffff)),
                    ),
                  )),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Flexible(
            child: ListView(
          children: [
            // massag?eList(),
            comments(),
          ],
        ))
      ],
    );
  }
}

class comments extends StatefulWidget {
  comments({Key key}) : super(key: key);

  @override
  _commentsState createState() => _commentsState();
}

class _commentsState extends State<comments> {
  List list2 = [
    {
      "url":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=300539781,202866527&fm=26&gp=0.jpg",
      "title": '蔡师傅工作室2号店',
      "subtitle": '平台验证，这样你我都放心',
      "time": "27分钟前",
      "image":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=41492875,80840841&fm=26&gp=0.jpg",
    },
    {
      "url":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=41492875,80840841&fm=26&gp=0.jpg",
      "title": '蔡师傅工作室2号店',
      "subtitle": '平台验证，这样你我都放心',
      "time": "27分钟前",
      "image":
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3825527476,269867957&fm=26&gp=0.jpg",
    },
    {
      "url":
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3825527476,269867957&fm=26&gp=0.jpg",
      "title": '蔡师傅工作室2号店',
      "subtitle": '平台验证，这样你我都放心',
      "time": "27分钟前",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
    },
  ];
  List<Widget> _getData() {
//循环
    var tempList = list2.map(
      (value) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxHeight: double.infinity),
            margin: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    value['url'],
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: double.infinity),
                        height: 24,
                        margin: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Flexible(
                                child: Container(
                              height: 24,
                              constraints:
                                  BoxConstraints(maxWidth: double.infinity),
                              child: Text(
                                value['title'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                            Icon(
                              Icons.check_circle,
                              color: Color(0xff8bc34a),
                            ),
                            Icon(
                              Icons.person_pin,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil.instance.setWidth(180.0),
                        constraints: BoxConstraints(maxHeight: double.infinity),
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          value['subtitle'] + "\n" + value['time'],
                          maxLines: 2,
                          style:
                              TextStyle(fontSize: 13, color: Color(0xff999999)),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 74,
                    width: 74,
                    child: Image.network(
                      value['image'],
                      height: 74,
                      width: 74,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
