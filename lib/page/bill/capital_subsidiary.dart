import 'package:flutter/material.dart';

class CapitalPage extends StatefulWidget {
  CapitalPage({Key key}) : super(key: key);

  @override
  _CapitalPageState createState() => _CapitalPageState();
}

class _CapitalPageState extends State<CapitalPage>
    with SingleTickerProviderStateMixin {
  //定义_tabController
  TabController _tabController;

//TabBar组件初始化
  @override
//组件初始化生命周期函数
  void initState() {
// TODO: implement initState
    super.initState();
//定义切换个数
    _tabController = new TabController(length: 5, vsync: this);
//可以添加监听
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

//组件销毁时的生命周期函数，不写也可以
  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
//controller也销毁
    _tabController.dispose();
    print('sile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        backgroundColor: Colors.white,
        title: Text(
          '资金明细',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        bottom: TabBar(
//注意，一定要加上
            controller: this._tabController,

//设置能否滚动
            // isScrollable: true,
//指示器颜色，即选择的下面横线的颜色
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
//选中和未选中的文字颜色
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: '全部',
              ),
              Tab(
                text: '充值',
              ),
              Tab(
                text: '提现',
              ),
              Tab(
                text: '消费',
              ),
              Tab(
                text: '收入',
              ),
            ]),
      ),
      body: TabBarView(controller: this._tabController, children: [
        //tab页面一
        Record(
          index: 0,
        ),
        //tab页面二
        Record(
          index: 1,
        ),
        Record(
          index: 2,
        ),
        Record(
          index: 3,
        ),
        Record(
          index: 4,
        ),
      ]),
    );
  }
}

class Record extends StatefulWidget {
  final int index;
  Record({Key key, this.index = 1}) : super(key: key);

  @override
  _RecordState createState() => _RecordState(this.index);
}

class _RecordState extends State<Record> {
  var now = DateTime.now();
  var time = TimeOfDay.now();
  int item = 1;
  int item1 = 1;
  int item2 = 1;
  int newindex;
  _RecordState(this.newindex);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              //判断，收起展开动作
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
                          Icon(Icons.arrow_drop_down) //向下
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
                      Icon(Icons.arrow_drop_up) //向上收起
                    ],
                  ),
                ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          child: item == 1 ? HomeContent(newindex) : null, //展开收起动作
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
          child: item1 == 1 ? HomeContent(newindex) : null, //选择传入列表
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
          child: item2 == 1 ? HomeContent(newindex) : null,
        ),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  int listindex;
  HomeContent(this.listindex);

  List list0 = [
    {"item": '游戏点卡', "time": '16:40', "price": '+100'},
    {"item": 'QQ会员', "time": '16:40', "price": '-50'},
    {"item": '游戏交易', "time": '16:40', "price": '-1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '-1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'}
  ];
  List list1 = [
    {"item": '游戏点卡', "time": '16:40', "price": '+100'},
    {"item": '游戏交易', "time": '16:40', "price": '+1500'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1999'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+100'}
  ];
  List list2 = [
    {"item": '游戏点卡', "time": '16:40', "price": '100'},
    {"item": 'QQ会员', "time": '16:40', "price": '50'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'},
    {"item": '游戏交易', "time": '16:40', "price": '1000'}
  ];
  List list3 = [
    {"item": '游戏点卡', "time": '16:40', "price": '-100'},
    {"item": 'QQ会员', "time": '16:40', "price": '-50'},
    {"item": '游戏交易', "time": '16:40', "price": '-1000'},
    {"item": '游戏交易', "time": '16:40', "price": '-15'},
    {"item": '游戏交易', "time": '16:40', "price": '-1680'},
    {"item": '游戏交易', "time": '16:40', "price": '-1000'},
  ];
  List list4 = [
    {"item": '游戏点卡', "time": '16:40', "price": '+100'},
    {"item": 'QQ会员', "time": '16:40', "price": '+550'},
    {"item": '游戏交易', "time": '16:40', "price": '+1800'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
    {"item": '游戏交易', "time": '16:40', "price": '+1000'},
  ];

//自定义方法
  List<Widget> _getData(List list) {
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
      //根据传入内容画出不同列表内容
      children: listindex == 4
          ? this._getData(list4)
          : listindex == 1
              ? this._getData(list1)
              : listindex == 2
                  ? this._getData(list2)
                  : listindex == 3
                      ? this._getData(list3)
                      : this._getData(list0),
    );
  }
}
