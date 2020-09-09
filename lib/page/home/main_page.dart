import 'package:flutter/material.dart';
import 'package:mall/page/home/evaluation.dart';
import 'package:mall/utils/navigator_util.dart';

class MallHomePage extends StatefulWidget {
  MallHomePage({Key key}) : super(key: key);

  @override
  _MallHomePageState createState() => _MallHomePageState();
}

class _MallHomePageState extends State<MallHomePage>
    with SingleTickerProviderStateMixin {
  //定义_tabController
  TabController _tabController;

//组件初始化
  @override
//组件初始化生命周期函数
  void initState() {
// TODO: implement initState
    super.initState();
//定义切换个数
    _tabController = new TabController(length: 2, vsync: this);
//可以添加监听
    _tabController.addListener(() {
      // print(_tabController.index);
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
        // backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xff02347B),
          elevation: 0,
          title: titlerow(),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 48,
              child: Scaffold(
                  backgroundColor: Colors.red,
                  appBar: AppBar(
                    backgroundColor: Color(0xff02347B),
                    bottom: TabBar(
                        //注意，一定要加上
                        controller: this._tabController,
                        //设置能否滚动
                        // isScrollable: true,
                        //指示器颜色，即选择的下面横线的颜色
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        //选中和未选中的文字颜色
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white24,
                        labelStyle: TextStyle(fontSize: 16),
                        tabs: [
                          Tab(
                            text: '首页',
                          ),
                          Tab(
                            text: '视频',
                          ),
                        ]),
                  ),
                  body: TabBarView(
                    //注意记得加上
                    controller: this._tabController,
                    children: <Widget>[
                      ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text('sssss'),
                          )
                        ],
                      ),
                      ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text('aaaaa'),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

class titlerow extends StatefulWidget {
  titlerow({Key key}) : super(key: key);

  @override
  _titlerowState createState() => _titlerowState();
}

class _titlerowState extends State<titlerow> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeheight = size.height;
    final sizewidth = size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => _toSearchPage(),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xfff8f8f8)),
              margin: EdgeInsets.only(left: 10),
              height: 36,
              width: sizewidth * 0.7,
              child: Center(
                  child: Container(
                width: sizewidth / 4,
                height: 22,
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xff8e8e8e),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '苹果11',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff888888),
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ))),
        ),
        InkWell(
          onTap: () {
            setState(() {});
          },
          child: Container(
            height: 36,
            width: 50,
            margin: EdgeInsets.only(left: 15),
            child: Center(
              child: Text(
                '领现金',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }

  _toSearchPage() {
    NavigatorUtils.goSearchPage(context);
  }
}
