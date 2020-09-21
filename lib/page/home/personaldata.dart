import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:mall/page/home/nicknamechange.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class personaldataPage extends StatefulWidget {
  final nickname;
  personaldataPage({Key key, this.nickname = '请输入昵称'}) : super(key: key);

  @override
  _personaldataPageState createState() => _personaldataPageState(this.nickname);
}

class _personaldataPageState extends State<personaldataPage> {
  String personaldataPagenicknanme;

  _personaldataPageState(nicknanme) {
    this.personaldataPagenicknanme = nicknanme;
  }

  static const String CHINAL_NAME = "example.mall/call_native"; //同步路径
  static const platform = const MethodChannel(CHINAL_NAME);
  String _result = "";

  File _headimagefile;
  Image _headimage;
  Image _image;
  final picker = ImagePicker();

  Future getImage() async {
    print('oooooooooooooo');

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path) as Image;
    });
  }

  // getImage() async {
  //   print('qqq');
  //   var result = await PhotoManager.requestPermission();

  //   if (result) {
  //     print('sss');
  //   } else {
  //     // fail
  //     /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
  //   }
  // }

  String sex = '男';

  //选择弹窗
  _simpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('你想从'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: () {
                Navigator.pop(context, 'A');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: () {
                Navigator.pop(context, 'B');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: () {
                Navigator.pop(context, 'C');
              },
            ),
          ],
        );
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    final screenwith = MediaQuery.of(context).size.width;
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
                // onTap: getImage,
                onTap: Platform.isIOS
                    ? () async {
                        String result = await platform
                            .invokeMethod("visitAlbum")
                            .then((value) {
                          _image = Image.memory(value);
                          setState(() {
                            _headimage = _image;
                          });
                        });
                      }
                    : getImage,

                // setState(() {
                //   _result = result;
                //   print("_result ---->" + _result);
                //   if (result != null) {
                //     _image = result as File;
                //     // print(result);
                //     // showModalBottomSheet(
                //     //     context: context,
                //     //     builder: (BuildContext context) {
                //     //       return new Container(
                //     //         child: new Center(
                //     //           child: new Text(
                //     //             result,
                //     //             style: new TextStyle(color: Colors.brown),
                //     //             textAlign: TextAlign.center,
                //     //           ),
                //     //         ),
                //     //         height: 40.0,
                //     //       );
                //     //     });
                //   }
                // });

                child: Column(
                  children: <Widget>[
                    _headimage == null
                        ? Icon(Icons.account_circle, size: 100)
                        : ClipOval(
                            child: Platform.isIOS
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    child: _headimage,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(100),
                                    // ),
                                  )
                                : Image.file(
                                    _headimagefile,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                    // Image.network(
                    //     'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1789308275,2124804861&fm=26&gp=0.jpg',
                    //     height: 100,
                    //     width: 100,
                    //     fit: BoxFit.cover,
                    //   ),
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
                            this.personaldataPagenicknanme,
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
    // NavigatorUtils.gonicknamechangePage(context);
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => nicknamechangePage(
                nicknamefrompersonaldataPage: this.personaldataPagenicknanme)))
        .then((value) {
      setState(() {
        value == null
            ? this.personaldataPagenicknanme = this.personaldataPagenicknanme
            : this.personaldataPagenicknanme = value;
      });
      print(value);
    });
  }

  _toUserPhonePage() {
    NavigatorUtils.goUserPhonePage(context);
  }
}
