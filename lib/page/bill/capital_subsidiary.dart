import 'package:flutter/material.dart';
import '../mine/records.dart';

class CapitalPage extends StatefulWidget {
  CapitalPage({Key key}) : super(key: key);

  @override
  _CapitalPageState createState() => _CapitalPageState();
}

class _CapitalPageState extends State<CapitalPage>
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
        Record(),
        Record(),
        Record(),
        Record(),
        Record(),
      ]),
    );
  }
}

// class TabBarControllerPage extends StatefulWidget {
//   TabBarControllerPage({Key key}) : super(key: key);

//   @override
//   _TabBarControllerPageState createState() => _TabBarControllerPageState();
// }

// //实现多一个类，即多继承
// class _TabBarControllerPageState extends State<TabBarControllerPage>
//     with SingleTickerProviderStateMixin {
// //定义_tabController
//   TabController _tabController;

// //组件初始化
//   @override
// //组件初始化生命周期函数
//   void initState() {
// // TODO: implement initState
//     super.initState();
// //定义切换个数
//     _tabController = new TabController(length: 5, vsync: this);
// //可以添加监听
//     _tabController.addListener(() {
//       print(_tabController.index);
//     });
//   }

// //组件销毁时的生命周期函数，不写也可以
//   @override
//   void dispose() {
// // TODO: implement dispose
//     super.dispose();
// //controller也销毁
//     _tabController.dispose();
//     print('sile');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           '资金明细',
//           style: TextStyle(fontSize: 20, color: Colors.black),
//         ),
//         centerTitle: true,
//         bottom: TabBar(
// //注意，一定要加上
//             controller: this._tabController,

// //设置能否滚动
//             // isScrollable: true,
// //指示器颜色，即选择的下面横线的颜色
//             indicatorColor: Colors.red,
//             indicatorSize: TabBarIndicatorSize.label,
// //选中和未选中的文字颜色
//             labelColor: Colors.red,
//             unselectedLabelColor: Colors.black,
//             tabs: [
//               Tab(
//                 text: '全部',
//               ),
//               Tab(
//                 text: '充值',
//               ),
//               Tab(
//                 text: '提现',
//               ),
//               Tab(
//                 text: '消费',
//               ),
//               Tab(
//                 text: '收入',
//               ),
//             ]),
//       ),
//       body: TabBarView(controller: this._tabController, children: [
//         Record(),
//         Record(),
//         Record(),
//         Record(),
//         Record(),
//       ]),
//     );
//   }
// }
