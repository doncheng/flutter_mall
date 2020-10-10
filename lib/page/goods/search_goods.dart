import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/bill/search_two.dart';
import 'package:mall/page/home/search.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/entity/goods_entity.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';

/* *
 * 
 * 套用项目原有的搜索页面
 * 
 * **/
class SearchGoodsView extends StatefulWidget {
  @override
  _SearchGoodsViewState createState() => _SearchGoodsViewState();
}

class _SearchGoodsViewState extends State<SearchGoodsView> {
  TextEditingController _editingController = TextEditingController();
  List<String> _keywords;
  List<GoodsEntity> _goods;
  GoodsService _goodsService = GoodsService();
  String selectedValue = '宝贝';
  String text = '苹果19';
  var _page = 1;
  var _limit = 10;
  var _sortName = Strings.SORT_NAME;
  var _orderType = Strings.ASC;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffffff),
        title: Container(
          height: ScreenUtil.instance.setHeight(100.0),
          // color: Color(0xffffffff),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(10.0),
                      bottom: ScreenUtil.instance.setHeight(10.0),
                      right: ScreenUtil.instance.setWidth(20.0)),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    // border: Border.all(
                    //     color: Colors.blue,
                    //     width: ScreenUtil.instance.setWidth(1.0)),
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(40.0)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 55,
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                          child: Row(
                            children: [
                              PopupMenuButton(
                                child: Text(selectedValue,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    )),
                                // tooltip: "长按提示",
                                initialValue: "goods",
                                padding: EdgeInsets.all(0.0),
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuItem<String>>[
                                    PopupMenuItem<String>(
                                      child: Text("宝贝"),
                                      value: "goods",
                                    ),
                                    PopupMenuItem<String>(
                                      child: Text("商家"),
                                      value: "users",
                                    ),
                                  ];
                                },
                                onSelected: (String action) {
                                  switch (action) {
                                    case "goods":
                                      setState(() {
                                        selectedValue = '宝贝';
                                      });
                                      break;
                                    case "users":
                                      setState(() {
                                        selectedValue = '商家';
                                      });
                                      break;
                                  }
                                },
                                onCanceled: () {
                                  print("onCanceled");
                                },
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('oopoop');
                          showSearch(
                              context: context, delegate: SearchBarDelegate());
                        },
                        child: Container(
                            height: 40,
                            width: ScreenUtil.instance.setWidth(200.0),
                            child: Text(
                              "点我进行搜索",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            )
                            // TextField(
                            //   onEditingComplete: _sort,
                            //   controller: _editingController,
                            //   textInputAction: TextInputAction.search,
                            //   style: TextStyle(
                            //       color: Colors.black54,
                            //       fontSize: ScreenUtil.instance.setSp(16.0)),
                            //   decoration: InputDecoration(
                            //     prefixIcon: Icon(
                            //       Icons.search,
                            //       size: 25,
                            //       color: Colors.grey,
                            //     ),
                            //     hintText: text,
                            //     hintStyle: TextStyle(
                            //         color: Colors.grey,
                            //         fontSize: ScreenUtil.instance.setSp(16.0)),
                            //     focusedBorder: UnderlineInputBorder(
                            //       borderSide:
                            //           BorderSide(color: Colors.transparent),
                            //     ),
                            //     enabledBorder: UnderlineInputBorder(
                            //       borderSide:
                            //           BorderSide(color: Colors.transparent),
                            //     ),
                            //   ),
                            // ),
                            ),
                      )
                    ],
                  )),
              InkWell(
                onTap: () {
                  // setState(() {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           //导航打开新视图
                  //           builder: (context) => SearchDemo()));
                  // });
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 45,
                  child: Center(
                    child: Text(
                      '取消',
                      style: TextStyle(fontSize: 16, color: Color(0xffff3e45)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            _sortView(),
            // Container(
            //     height: double.infinity,
            //     // margin:
            //     //     EdgeInsets.only(top: ScreenUtil.instance.setHeight(210.0)),
            //     child: _goods == null || _goods.length == 0
            //         ? EmptyView()
            //         : GridView.builder(
            //             itemCount: _goods.length,
            //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //                 childAspectRatio: 1.0,
            //                 crossAxisSpacing:
            //                     ScreenUtil.instance.setWidth(10.0),
            //                 mainAxisSpacing:
            //                     ScreenUtil.instance.setHeight(10.0),
            //                 crossAxisCount: 2),
            //             itemBuilder: (BuildContext context, int index) {
            //               return getGoodsItemView(_goods[index]);
            //             }))
          ],
        ),
      ),
    );
  }

  List list = [
    {"name": '洗衣机'},
    {"name": '苹果7'},
    {"name": '华为'},
    {"name": 'ps4'},
    {"name": '电瓶车'},
    {"name": '大疆'},
    {"name": '荣耀play'},
    {"name": '三星s10'},
  ];

  //自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return InkWell(
        onTap: () {
          setState(() {
            text = value["name"];
            print(value["name"]);
          });
        },
        child: Container(
          constraints: BoxConstraints(maxHeight: double.infinity),
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Color(0xfff0f0f0)),
          child: Text(
            value["name"],
            style: TextStyle(fontSize: 12),
          ),
        ),
      );
    });
    return tempList.toList();
  }

  Widget _sortView() {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
        height: ScreenUtil.instance.setHeight(157),
        child: Column(
          children: [
            Container(
              height: 22,
              margin: EdgeInsets.only(
                left: 15,
                bottom: 10,
              ),
              width: double.infinity,
              child: Text(
                '推荐搜索',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: Wrap(
                //元素横轴之间的距离
                spacing: 10,
//纵轴的距离
                runSpacing: 10,
                children: _getData(),
              ),
            )
          ],
        ));
  }

  // //点击综合
  // _comprehensive() {
  //   _sortName = Strings.SORT_NAME;
  //   _orderType = Strings.DESC;
  //   _sort();
  // }

  // _priveSort(int type) {
  //   _sortName = Strings.SORT_RETAIL_PRICE;
  //   _orderType = type == 1 ? Strings.ASC : Strings.DESC;
  //   _sort();
  // }

  _sort() {
    FocusScope.of(context).requestFocus(FocusNode()); //隐藏键盘
    var parameters = {
      "keyword": _editingController.text,
      "page": _page,
      "limit": _limit,
      "sort": _sortName,
      "order": _orderType
    };
    _goodsService.getCategoryGoodsListData(parameters, (onSuccessList) {
      setState(() {
        _goods = onSuccessList;
      });
    }, onFail: (error) {
      ToastUtil.showToast(error);
    });
  }

  _searchKeyWords() {
    var parameters = {"keyword": _editingController.text};
    _goodsService.searchGoods(parameters, (success) {
      setState(() {
        _keywords = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
      setState(() {
        _keywords = null;
      });
    });
  }

  _goGooodsDetail(int goodsId) {
    NavigatorUtils.goGoodsDetails(context, goodsId);
  }

  Widget getGoodsItemView(GoodsEntity goodsEntity) {
    return InkWell(
      onTap: () => _goGooodsDetail(goodsEntity.id),
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
            width: ScreenUtil.getInstance().setWidth(640),
            height: ScreenUtil.getInstance().setHeight(920),
            child: Card(
              child: Column(
                children: <Widget>[
                  CachedImageView(
                      double.infinity,
                      ScreenUtil.getInstance().setHeight(200),
                      goodsEntity.picUrl),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(10.0)),
                  ),
                  Text(
                    goodsEntity.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26.0),
                        color: Colors.black54),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(10.0)),
                  ),
                  Text(
                    "¥${goodsEntity.retailPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26.0),
                        color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _keyWordView(String keyword) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
      height: ScreenUtil.instance.setHeight(80.0),
      child: InkWell(
        child: Text(
          keyword,
          style: TextStyle(
              color: Colors.black54, fontSize: ScreenUtil.instance.setSp(26.0)),
        ),
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  var nameList = ["绿皮南瓜", "番茄", "白菜", "胡萝卜", "土豆", "甜菜", "白甜"];
  bool flag; //判断搜索框内输入的内容是否存在于数据列表里
  // 搜索条右侧的按钮执行方法，我们在这里方法里放入一个clear图标。 当点击图片时，清空搜索的内容。
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        }, //搜索值为空
      )
    ];
  }

  // 搜索栏左侧的图标和功能，点击时关闭整个搜索页面
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null) //点击时关闭整个搜索页面
        );
  }

  // 搜索到内容了
  @override
  Widget buildResults(BuildContext context) {
    for (int i = 0; i < nameList.length; i++) {
      if (query == nameList[i]) {
        flag = true;
        break;
      } else {
        flag = false;
      }
    }

    return flag == true
        ? Padding(
            padding: EdgeInsets.all(16),
            child: InkWell(
              child: Text(query),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new TextScreen(s: query),
                    //TextScreen()用于展示我们想要通过搜索到达的页面，
                    //这里用到了构造函数传值。
                  ),
                );
                print('0000');
              },
            ))
        : Center(
            child: Text("没有找到这个蔬菜！！！"),
          );
  }

  // 输入时的推荐及搜索结果
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList =
        // query.isEmpty
        //     ? recentSuggest
        //     :
        searchList.where((input) => input.startsWith(query)).toList();
//判断集合中的字符串是否以搜索框内输入的字符串开头，
//是则返回true，并将筛选出来的结果以list的方式储存在searchList里
    return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              title: RichText(
                //富文本
                text: TextSpan(
                    text: suggestionsList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionsList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) =>
                      new TextScreen(s: suggestionsList[index]),
                ),
              );
              print('kjojojo');
            },
          );
        });
  }
}

class TextScreen extends StatelessWidget {
  final String s;
  TextScreen({Key key, @required this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: AppBar(
        title: Text("搜索结果内容"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(s),
          )),
    );
  }
}
