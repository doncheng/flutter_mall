import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/page/home/nicknamechange.dart';
import 'package:mall/utils/navigator_util.dart';

enum Option { getImageGallery, getImageCamera }

class personaldataPage extends StatefulWidget {
  final String nickName;
  final String imageHeadUrl;
  personaldataPage({Key key, this.nickName, this.imageHeadUrl})
      : super(key: key);

  @override
  _personaldataPageState createState() => _personaldataPageState(
      nickName: this.nickName, imageHeadUrl: this.imageHeadUrl);
}

class _personaldataPageState extends State<personaldataPage> {
  String sex = '男';
  File _headimagefile;
  dynamic _imagedynamic;
  bool isLogin = false;
  String imageHeadUrl;
  String nickName;

  _personaldataPageState({this.nickName, this.imageHeadUrl});

  //原生交互
  static const String CHINAL_NAME = "example.mall/call_native"; //同步路径
  static const platform = const MethodChannel(CHINAL_NAME);
  String _result = "";

  //相册 图片访问
  final picker = ImagePicker();
  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _headimagefile = File(pickedFile.path);
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _headimagefile = File(pickedFile.path);
    });
  }

  //选择弹窗
  _simpleDialog() async {
    final option = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择方式'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('相册'),
              onPressed: () {
                Navigator.of(context).pop(Option.getImageGallery);
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('相机'),
              onPressed: () {
                Navigator.of(context).pop(Option.getImageCamera);
              },
            ),
          ],
        );
      },
    );

    switch (option) {
      case Option.getImageGallery:
        getImageGallery();
        break;
      case Option.getImageCamera:
        getImageCamera();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwith = MediaQuery.of(context).size.width;
    // _refreshEvent();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.navigate_before,
            color: Colors.grey,
            size: 36,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        actions: <Widget>[
          FlatButton(
              padding: EdgeInsets.only(left: 25),
              onPressed: () {
                Navigator.of(context).pop(this.nickName);
              },
              child: Text(
                '保存',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ))
        ],
        title: Text(
          '个人资料编辑',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: Platform.isIOS
                    ? () async {
                        String result = await platform
                            .invokeMethod("visitAlbum")
                            .then((value) {
                          setState(() {
                            _imagedynamic = value;
                          });
                        });
                      }
                    : _simpleDialog,
                child: Column(
                  children: <Widget>[
                    _imagedynamic == null && _headimagefile == null
                        ? Container(
                            height: 100,
                            width: 100,
                            child: ClipOval(
                              child: Image.network(
                                this.imageHeadUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: Platform.isIOS
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.memory(
                                      _imagedynamic,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Image.file(
                                    _headimagefile,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                    SizedBox(height: 6),
                    Text(
                      _imagedynamic == null && _headimagefile == null
                          ? '点击更换头像'
                          : ' ',
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
                            this.nickName,
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
                          color: Color(0xfff5f5f5),
                          height: 170,
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
                            '更换手机号',
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
          // Padding(
          //     padding: EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
          //     child: InkWell(
          //       onTap: () {},
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Text(
          //             'QQ号',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           Container(
          //             child: Row(
          //               children: <Widget>[
          //                 Text(
          //                   '110119120',
          //                   style: TextStyle(fontSize: 14, color: Colors.grey),
          //                 ),
          //                 Icon(
          //                   Icons.navigate_next,
          //                   color: Colors.grey,
          //                 ),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     )),
          // Divider(),
        ],
      ),
    );
  }

  _tonicknamechangePage() {
    // NavigatorUtils.gonicknamechangePage(context);
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => nicknamechangePage(
                nicknamefrompersonaldataPage: this.nickName)))
        .then((value) {
      setState(() {
        value == null ? this.nickName = this.nickName : this.nickName = value;
      });
      // print(value);
    });
  }

  _toUserPhonePage() {
    NavigatorUtils.goUserPhonePage(context);
  }
}
