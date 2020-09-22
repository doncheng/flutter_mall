import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:ui';

/* ***********
 * 评论
 * ************/
class EvaluationPage extends StatefulWidget {
  EvaluationPage({Key key}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  // double starmun = 4.1;
  String time = '2019-12-12';
  int _chick = 1;
  //模拟网上获取的不同评论
  List evaluationList1 = [
    {
      "head":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=300539781,202866527&fm=26&gp=0.jpg",
      "title": "gfdg越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3377972169,3851046994&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=41492875,80840841&fm=26&gp=0.jpg",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3686341429,1115221234&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3825527476,269867957&fm=26&gp=0.jpg",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2938071793,1717382227&fm=26&gp=0.jpg"
    },
  ];
  List evaluationList2 = [
    {
      "head":
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1812065335,2733388662&fm=26&gp=0.jpg",
      "title": "jsf越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3931334255,3744456938&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1358846947,3130783210&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3271719620,98794636&fm=15&gp=0.jpg",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3271719620,98794636&fm=15&gp=0.jpg"
    },
  ];
  List evaluationList3 = [
    {
      "head":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3618479410,4168353002&fm=26&gp=0.jpg",
      "title": "83越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3618479410,4168353002&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
    {
      "head":
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1184165774,1621872064&fm=26&gp=0.jpg",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1184165774,1621872064&fm=26&gp=0.jpg"
    },
  ];
  List evaluationList4 = [
    {
      "head":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1668854219,2502849905&fm=26&gp=0.jpg",
      "title": "78越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1668854219,2502849905&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
  ];
  List evaluationList5 = [
    {
      "head":
          "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1392593788,1459572734&fm=26&gp=0.jpg",
      "title": "越99***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1262136314,640414401&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
  ];
  List evaluationList6 = [
    {
      "head":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3640180560,1099506620&fm=26&gp=0.jpg",
      "title": "越54***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3640180560,1099506620&fm=26&gp=0.jpg"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
    {
      "head":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png",
      "title": "越***6",
      "subtitle": "买家 丨 ",
      "evaluation": "非常满意",
      "content": "东西不错",
      "image":
          "https://i0.hdslb.com/bfs/archive/31b8d2617cb8d6b01e98425b7eba39ae9f973c20.png"
    },
  ];
  //传入不同评论内容画出不同的column
  List<Widget> _getData(List inlist) {
//循环

    var tempList = inlist.map((value) {
      return Container(
        height: ScreenUtil.instance.setHeight(240.0),
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.network(
                  value["head"],
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                value["title"],
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                value["subtitle"] + time,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              trailing: Container(
                height: 20,
                width: 55,
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  value["evaluation"],
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            ),
            Container(
              height: ScreenUtil.instance.setHeight(140.0),
              width: double.infinity,
              margin: EdgeInsets.only(
                left: ScreenUtil.instance.setWidth(60.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenUtil.instance.setHeight(25.0),
                    width: double.infinity,
                    child: Text(
                      value["content"],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          height: ScreenUtil.instance.setHeight(60.0),
                          width: ScreenUtil.instance.setWidth(60.0),
                          child: Image.network(
                            value["image"],
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                height: 1,
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: ScreenUtil.instance.setWidth(62.0)),
                color: Color(0xffe0e0e0))
          ],
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        title: Text(
          '全部交易评价',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          EvaluationBody(),
          Container(
            height: 30,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 12),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: 101,
                  margin: EdgeInsets.only(right: 14),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        '全部 211',
                        style: TextStyle(
                          fontSize: 10,
                          color: this._chick == 1
                              ? Color(0xffe51c23)
                              : Colors.black,
                        ),
                      ),
                      color:
                          this._chick == 1 ? Color(0xffffe8e8) : Colors.white,
                      onPressed: () {
                        setState(() {
                          this._chick = 1;
                        });
                      }),
                ),
                Container(
                  height: 30,
                  width: 101,
                  margin: EdgeInsets.only(right: 14),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        '来自卖家 4',
                        style: TextStyle(
                          fontSize: 10,
                          color: this._chick == 2
                              ? Color(0xffe51c23)
                              : Colors.black,
                        ),
                      ),
                      color:
                          this._chick == 2 ? Color(0xffffe8e8) : Colors.white,
                      onPressed: () {
                        setState(() {
                          this._chick = 2;
                        });
                      }),
                ),
                Container(
                  height: 30,
                  width: 101,
                  margin: EdgeInsets.only(right: 14),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        '来自买家 217',
                        style: TextStyle(
                          fontSize: 10,
                          color: this._chick == 3
                              ? Color(0xffe51c23)
                              : Colors.black,
                        ),
                      ),
                      color:
                          this._chick == 3 ? Color(0xffffe8e8) : Colors.white,
                      onPressed: () {
                        setState(() {
                          this._chick = 3;
                        });
                      }),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 12),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: 101,
                  margin: EdgeInsets.only(right: 14),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text('非常满意 214',
                          style: TextStyle(
                            fontSize: 10,
                            color: this._chick == 4
                                ? Color(0xffe51c23)
                                : Colors.black,
                          )),
                      color:
                          this._chick == 4 ? Color(0xffffe8e8) : Colors.white,
                      onPressed: () {
                        setState(() {
                          this._chick = 4;
                        });
                      }),
                ),
                Container(
                  height: 30,
                  width: 101,
                  margin: EdgeInsets.only(right: 14),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text('令人失望 4',
                          style: TextStyle(
                            fontSize: 10,
                            color: this._chick == 5
                                ? Color(0xffe51c23)
                                : Colors.black,
                          )),
                      color:
                          this._chick == 5 ? Color(0xffffe8e8) : Colors.white,
                      onPressed: () {
                        setState(() {
                          this._chick = 5;
                        });
                      }),
                ),
                Container(
                  height: 30,
                  width: 101,
                  margin: EdgeInsets.only(right: 14),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text('值得改进 3',
                          style: TextStyle(
                            fontSize: 10,
                            color: this._chick == 6
                                ? Color(0xffe51c23)
                                : Colors.black,
                          )),
                      color:
                          this._chick == 6 ? Color(0xffffe8e8) : Colors.white,
                      onPressed: () {
                        setState(() {
                          this._chick = 6;
                        });
                      }),
                ),
              ],
            ),
          ),
//****************************************//
          SizedBox(
            height: 10,
          ),
          Flexible(
            //根据按键的不同值选择画出不同的列表
            child: ListView(
              children: _chick == 1
                  ? _getData(evaluationList1)
                  : _chick == 2
                      ? _getData(evaluationList2)
                      : _chick == 3
                          ? _getData(evaluationList3)
                          : _chick == 4
                              ? _getData(evaluationList4)
                              : _chick == 5
                                  ? _getData(evaluationList5)
                                  : _getData(evaluationList6),
            ),
          )
        ],
      )),
    );
  }
}

class EvaluationBody extends StatefulWidget {
  EvaluationBody({Key key}) : super(key: key);

  @override
  _EvaluationBodyState createState() => _EvaluationBodyState();
}

class _EvaluationBodyState extends State<EvaluationBody> {
  double starmun = 4.1;
  String time = '2019-12-12';
  int _chick;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 54,
                width: 54,
                margin: EdgeInsets.only(bottom: 36),
                child: ClipOval(
                  child: Image.network(
                    'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=359866086,3060001128&fm=26&gp=0.jpg',
                    height: 54,
                    width: 54,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    width: sizewidth - 80,
                    height: 25,
                    child: Row(
                      children: [
                        Text(
                          '蔡师傅工作室2号店',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: sizewidth - 80,
                      height: 25,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 90,
                            child: Center(
                              child: Text(
                                '收到评价221次',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff999999)),
                              ),
                            ),
                          ),
                          XFStarRating(
                            rating: starmun,
                            maxRating: 5,
                            size: 16,
                            selectedColor: Colors.blue,
                            unselectedColor: Colors.white,
                          ),
                          Container(
                            height: 20,
                            width: 35,
                            child: Center(
                              child: Text(
                                starmun.toString() + '分',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff999999)),
                              ),
                            ),
                          ),
                          Container(
                              height: 18,
                              width: 18,
                              child: Icon(Icons.help_outline,
                                  size: 16, color: Color(0xff999999)))
                        ],
                      )),
                  Container(
                      width: sizewidth - 80,
                      height: 25,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 100,
                            child: Center(
                              child: Text(
                                '宝贝描述:' + starmun.toString() + '分',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff999999)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 20,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Color(0xffbb2312),
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                '高',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 100,
                            margin: EdgeInsets.only(left: 10),
                            child: Center(
                              child: Text(
                                '沟通态度::' + starmun.toString() + '分',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff999999)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 20,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Color(0xffbb2312),
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text(
                                '高',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 12,
          width: double.infinity,
          color: Color(0xfff8f8f8),
        ),
      ],
    );
  }
}

/*
***星星评价***
*/

class XFStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  XFStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.size = 20,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    Widget unselectedImage,
    Widget selectedImage,
    this.count = 5,
  })  : unselectedImage = unselectedImage ??
            Icon(
              Icons.star,
              size: size,
              color: unselectedColor,
            ),
        selectedImage = selectedImage ??
            Icon(
              Icons.star,
              size: size,
              color: selectedColor,
            );

  @override
  _XFStarRatingState createState() => _XFStarRatingState();
}

class _XFStarRatingState extends State<XFStarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: getUnselectImage(),
            mainAxisSize: MainAxisSize.min,
          ),
          Row(
            children: getSelectImage(),
            mainAxisSize: MainAxisSize.min,
          ),
        ],
      ),
    );
  }

  List<Widget> getUnselectImage() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> getSelectImage() {
    //1.计算Star个数和剩余比例等
    double oneVale = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneVale).floor();
    double leftValue = widget.rating - entireCount * oneVale;
    double leftRatio = leftValue / oneVale;

    //2.获取Star
    List<Widget> selectedImages = [];
    for (int i = 0; i < entireCount; i++) {
      selectedImages.add(widget.selectedImage);
    }

    //3.计算
    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: leftRatio * widget.size),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);
    return selectedImages;
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  final double width;

  MyRectClipper({this.width});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}
