import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:mall/utils/navigator_util.dart';

class personaldataPage extends StatefulWidget {
  personaldataPage({Key key}) : super(key: key);

  @override
  _personaldataPageState createState() => _personaldataPageState();
}

class _personaldataPageState extends State<personaldataPage> {
  var _imgPath;
  String sex = '男';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人资料编辑'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _openGallery() async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      _imgPath = image;
                    });
                  }
                },
                child: Column(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1789308275,2124804861&fm=26&gp=0.jpg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '点击更换头像',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 36),
          Divider(),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
              child: InkWell(
                onTap: () => _tonicknamechangePage(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '昵称',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '我是名称',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Divider(),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
              child: InkWell(
                onTap: () {
                  var names = ['', '男', '女'];
                  final picker = CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (position) {
                        setState(() {
                          this.sex = names[position];
                        });
                        // print('The position is ${names[position]}');
                      },
                      children: names.map((e) {
                        return Text(e);
                      }).toList());
                  showCupertinoModalPopup(
                      context: context,
                      builder: (cxt) {
                        return Container(
                          height: 200,
                          child: picker,
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '性别',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            this.sex,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Divider(),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
              child: InkWell(
                onTap: () => _toUserPhonePage(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '手机号',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '未绑定',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Divider(),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'QQ号',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '110119120',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Divider(),
        ],
      ),
    );
  }

  _tonicknamechangePage() {
    NavigatorUtils.gonicknamechangePage(context);
  }

  _toUserPhonePage() {
    NavigatorUtils.goUserPhonePage(context);
  }
}
