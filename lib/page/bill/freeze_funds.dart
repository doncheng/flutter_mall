import 'package:flutter/material.dart';

/*******
 * 
 * 
 * 资金冻结明细
 * 
 * ********/
class FreezePage extends StatefulWidget {
  FreezePage({Key key}) : super(key: key);

  @override
  _FreezePageState createState() => _FreezePageState();
}

class _FreezePageState extends State<FreezePage> {
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
          '资金冻结明细',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FreezeBody(),
    );
  }
}

class FreezeBody extends StatefulWidget {
  FreezeBody({Key key}) : super(key: key);

  @override
  _FreezeBodyState createState() => _FreezeBodyState();
}

class _FreezeBodyState extends State<FreezeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 32,
              width: 60,
              child: Text(
                '冻结原因',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              height: 32,
              width: 60,
              child: Text(
                '冻结金额',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              height: 32,
              width: 60,
              child: Text(
                '冻结时间',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 32,
              width: 50,
              child: Text(
                '操作',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        HomeContent(),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  List list = [
    {"cause": '交易违规', "amount": '500', "day": '7天', "operation": '申诉'},
    {"cause": '交易违规', "amount": '500', "day": '7天', "operation": '申诉'},
    {"cause": '交易违规', "amount": '500', "day": '7天', "operation": '申诉'},
    {"cause": '交易违规', "amount": '500', "day": '7天', "operation": '申诉'},
    {"cause": '交易违规', "amount": '500', "day": '7天', "operation": '申诉'},
    {"cause": '交易违规', "amount": '500', "day": '7天', "operation": '申诉'},
  ];
//自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return Container(
          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 32,
                    width: 60,
                    child: Center(
                      child: Text(
                        value["cause"],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffCF1322)),
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 60,
                    child: Center(
                      child: Text(
                        value["amount"],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffCF1322)),
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 60,
                    child: Center(
                      child: Text(
                        value["day"],
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffCF1322)),
                      ),
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 60,
                    padding: EdgeInsets.all(3),
                    child: RaisedButton(
                        child: Text(
                          value["operation"],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10),
                        ),
                        color: Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {}),
                  ),
                ],
              ),
              Divider(
                color: Color(0xffd5d5d5),
              )
            ],
          ));
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
