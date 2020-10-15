import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/api/api.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/page/home/dioManger.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/utils/http_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/entity/goods_entity.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';
import 'package:toast/toast.dart';

class SearchGoodsView extends StatefulWidget {
  @override
  _SearchGoodsViewState createState() => _SearchGoodsViewState();
}

class _SearchGoodsViewState extends State<SearchGoodsView> {
  TextEditingController _editingController = TextEditingController();
  List<String> _keywords;
  List<GoodsEntity> _goods;
  GoodsService _goodsService = GoodsService();
  var _page = 1;
  var _limit = 10;
  var _sortName = Strings.SORT_NAME;
  var _orderType = Strings.ASC;
  String hintText = Strings.GOODS_SEARCH_HINT;
  Map<String, dynamic> searchMap;

  List list = [
    {"name": '洗衣机'},
    {"name": '苹果7'},
    {"name": '华为'},
    {"name": 'ps4'},
    {"name": '电瓶车'},
    {"name": '大疆'},
    {"name": '荣耀play'},
    {"name": '母'},
  ];

  //自定义方法
  List<Widget> _getData() {
//循环
    var tempList = list.map((value) {
      return InkWell(
        onTap: () {
          setState(() {
            hintText = value["name"];
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

  @override
  Widget build(BuildContext context) {
    String selectedValue = '宝贝';
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:
          Colors.deepOrangeAccent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 287,
                  height: 36,
                  margin: EdgeInsets.only(
                    top: ScreenUtil.instance.setHeight(10.0),
                    // left: ScreenUtil.instance.setWidth(20.0),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    // border: Border.all(
                    //     color: Colors.blue,
                    //     width: ScreenUtil.instance.setWidth(1.0)),
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.instance.setWidth(100.0)),
                  ),
                  child: Row(children: [
                    Container(
                      height: 40,
                      width: 55,
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: Center(
                        child: Row(
                          children: [
                            PopupMenuButton(
                              //选择宝贝或者商家
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
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 30,
                        width: 200,
                        margin: EdgeInsets.only(top: 5),
                        child: Center(
                          child: TextField(
                            onEditingComplete: _sort,
                            controller: _editingController,
                            textInputAction: TextInputAction.search,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil.instance.setSp(26.0)),
                            decoration: InputDecoration(
                              // prefixIcon: Icon(
                              //   Icons.search,
                              //   size: ScreenUtil.instance.setWidth(50.0),
                              //   color: Colors.deepOrangeAccent,
                              // ),
                              //请输入关键词
                              hintText: hintText,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenUtil.instance.setSp(26.0)),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            // onChanged: (value) {
                            //   setState(() {
                            //     this.hintText = value;
                            //   });

                            //   ///显示指定Map的限定类型
                            //   Map<String, String> parms = {
                            //     'keyword': value,
                            //   };
                            //   Map<String, String> headers = {};
                            //   DioManger.getInstance().get(
                            //       Api.SEARCH_GOODS, parms, headers, (response) {
                            //     Map<String, dynamic> map1 =
                            //         json.decode(response);
                            //     print(map1['data']);
                            //     setState(() {
                            //       this.searchMap = map1;
                            //     });
                            //   }, (error) {
                            //     print('请求搜索结果错误');
                            //     print(error.toString());
                            //   });
                            // },
                          ),
                        )),
                  ]),
                ),

                /// 取消按钮
                InkWell(
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          '取消',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      )),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            // _sortView(),
            Container(
              height: double.infinity,
              margin:
                  EdgeInsets.only(top: ScreenUtil.instance.setHeight(120.0)),
              child:
                  // this.hintText == Strings.GOODS_SEARCH_HINT
                  //     ? recommendedSearch()
                  //     :
                  // : Container(
                  //     color: Colors.red,
                  //     height: 100,
                  //     width: 100,
                  //     child: Text(searchMap['data']),
                  //   )
                  _goods == null || _goods.length == 0
                      ? EmptyView()
                      : GridView.builder(
                          itemCount: _goods.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.0,
                                  crossAxisSpacing:
                                      ScreenUtil.instance.setWidth(10.0),
                                  mainAxisSpacing:
                                      ScreenUtil.instance.setHeight(10.0),
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return getGoodsItemView(_goods[index]);
                          }),
            )
          ],
        ),
      ),
    );
  }

//推荐搜索
  recommendedSearch() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          margin: EdgeInsets.only(left: 15, bottom: 15),
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
          margin: EdgeInsets.only(
            left: 7,
          ),
          height: 80,
          width: double.infinity,
          child: Wrap(
            //元素横轴之间的距离
            spacing: 10,
//纵轴的距离
            runSpacing: 10,
            children: _getData(),
          ),
        ),
      ],
    );
  }

//搜索结果列表
  // searchList() {
  //   return
  // }

  Widget _sortView() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(100.0)),
      height: ScreenUtil.instance.setHeight(100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => _comprehensive(),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              color: Colors.deepOrangeAccent,
                              width: ScreenUtil.instance.setWidth(1.0)))),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.COMPREHENSIVE,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Strings.SEARCH_GOODS_PRICE,
                      style: TextStyle(
                          fontSize: ScreenUtil.instance.setSp(26.0),
                          color: Colors.black54),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(10.0))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () => _priveSort(1),
                          child: Container(
                            height: ScreenUtil.instance.setHeight(50.0),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              size: ScreenUtil.instance.setHeight(30.0),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => _priveSort(2),
                          child: Container(
                            height: ScreenUtil.instance.setHeight(50.0),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: ScreenUtil.instance.setHeight(30.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  //点击综合
  _comprehensive() {
    _sortName = Strings.SORT_NAME;
    _orderType = Strings.DESC;
    _sort();
  }

  _priveSort(int type) {
    _sortName = Strings.SORT_RETAIL_PRICE;
    _orderType = type == 1 ? Strings.ASC : Strings.DESC;
    _sort();
  }

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
