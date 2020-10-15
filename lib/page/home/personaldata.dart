import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:mall/api/api.dart';
import 'package:mall/event/login_event.dart';
import 'package:mall/page/home/dioManger.dart';
import 'package:mall/page/home/nicknamechange.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:toast/toast.dart';

enum Option { getImageGallery, getImageCamera }

class personaldataPage extends StatefulWidget {
  final String nickName;
  final String imageHeadUrl;
  final String phoneNumber;
  final int gender;
  personaldataPage(
      {Key key,
      this.nickName,
      this.imageHeadUrl,
      this.phoneNumber,
      this.gender})
      : super(key: key);

  @override
  _personaldataPageState createState() => _personaldataPageState(
      nickName: this.nickName,
      imageHeadUrl: this.imageHeadUrl,
      phoneNumber: this.phoneNumber,
      gender: this.gender);
}

class _personaldataPageState extends State<personaldataPage> {
  String sex = '男';
  int gender;
  File _headimagefile;
  dynamic _imagedynamic;
  bool isLogin = false;
  String imageHeadUrl;
  String nickName;
  String phoneNumber;
  String token;
  HttpClient _httpClient = HttpClient();

  _personaldataPageState(
      {this.nickName, this.imageHeadUrl, this.phoneNumber, this.gender});

  //原生交互
  static const String CHINAL_NAME = "example.mall/call_native"; //同步路径
  static const platform = const MethodChannel(CHINAL_NAME);
  String _result = "";

  //相册 图片访问
  final picker = ImagePicker();
  Future getImageGallery() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _headimagefile = File(pickedFile.path);
    });
  }

  Future getImageCamera() async {
    // final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);

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

  uploadUserInformation() {
    print('性别$sex');
    if (this.sex == '男') {
      this.gender = 1;
    } else {
      this.gender = 0;
    }
    var url = Api.UploadUserInformation;
    _httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      //这里添加POST请求Body的ContentType和内容
      //这个是application/x-www-form-urlencoded数据类型的传输方式
      request.headers.contentType =
          ContentType("application", "raw;charset=utf-8");

      request.write(
          "{\"mobile\":\"$phoneNumber\",\"gender\":\"$gender\",\"nickname\":\"$nickName\"}");
      // request.write("mobile=13073078664&gender=0&nickname=我的文档");
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      // print(response.transform(utf8.decoder).join());
      if (response.statusCode == 200) {
        // ignore: unnecessary_statements
        response.transform(utf8.decoder).join().then((String string) async {
          Map<String, dynamic> map = json.decode(string);
          print(map);
          //登录成功回调
          if (map['errno'] == 0) {
            _getUserInfo();
            Navigator.of(context).pop();
          } else {
            Toast.show("系统繁忙 请稍后再试", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          }
        });
      } else {
        print("服务器超时");
      }
    });
  }

  _getUserInfo() async {
    ///显示指定Map的限定类型
    print(this.phoneNumber);
    Map<String, String> parms = {"mobile": this.phoneNumber};
    Map<String, String> headers = {};
    DioManger.getInstance().get(Api.GetUserInformation, parms, headers,
        (response) async {
      Map<String, dynamic> map = json.decode(response);
      print(map);

      if (map['errno'] == 0) {
        loginEventBus.fire(LoginEvent(
          true,
          url:
              'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2117319092,2336640022&fm=26&gp=0.jpg',
          nickName: map['data']['nickname'],
          token: token,
          phoneNumber: this.phoneNumber,
          gender: map['data']['gender'],
        ));
      } else {
        Toast.show("系统繁忙 请稍后再试", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
    }, (error) {
      Toast.show("服务器无响应", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      print(error.toString());
    });
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
                uploadUserInformation();
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
                            Image _imagedynamicImage = Image.memory(
                              _imagedynamic,
                            );
                          });
                        });
                      }
                    : _simpleDialog,
                // onTap: () async {
                //   print('nbhnhbhb');
                //   final pickedFile =
                //       await ImagePicker.pickImage(source: ImageSource.gallery);
                // },
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
                                    child:
                                        // Image.file(
                                        //   File(
                                        //       '/Users/userName/Desktop/myShaoNv.png'),
                                        // ),
                                        Image.memory(
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
                  var namesint = ['', '1', '0'];
                  final picker = CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (position) {
                        setState(() {
                          this.sex = names[position];
                          this.gender = int.parse(namesint[position]);
                          print(gender);
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
                            this.gender == 0 ? '女' : '男',
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
          //       onTap: () => _toUserPhonePage(),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Text(
          //             '手机号',
          //             style: TextStyle(fontSize: 14),
          //           ),
          //           Container(
          //             child: Row(
          //               children: <Widget>[
          //                 Text(
          //                   '更换手机号',
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
