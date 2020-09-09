import 'package:flutter/material.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: EvaluationBody(),
    );
  }
}

class EvaluationBody extends StatefulWidget {
  EvaluationBody({Key key}) : super(key: key);

  @override
  _EvaluationBodyState createState() => _EvaluationBodyState();
}

class _EvaluationBodyState extends State<EvaluationBody> {
  double starmun = 3.6;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    return ListView(
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
                                style: TextStyle(fontSize: 13),
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
                              child: Text(starmun.toString()),
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            child: Image.network(
                                'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3668245563,4097734658&fm=26&gp=0.jpg'),
                          )
                        ],
                      )),
                  Container(
                      width: sizewidth - 80,
                      height: 25,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 90,
                            child: Center(
                              child: Text('宝贝描述:' + starmun.toString() + '分'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 20,
                            width: 38,
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
                            width: 90,
                            margin: EdgeInsets.only(left: 20),
                            child: Center(
                              child: Text('沟通态度::' + starmun.toString() + '分'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            height: 20,
                            width: 38,
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
        Categorize(),
      ],
    );
  }
}

class Categorize extends StatefulWidget {
  Categorize({Key key}) : super(key: key);

  @override
  _CategorizeState createState() => _CategorizeState();
}

class _CategorizeState extends State<Categorize> {
  int _chick;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 30,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 12),
            width: double.infinity,
            child: Row(
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
          )
        ],
      ),
    );
  }
}

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
