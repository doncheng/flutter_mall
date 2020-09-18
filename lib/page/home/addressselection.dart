import 'package:address_picker/address_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:address_picker/address_picker.dart';

class addressselectionPage extends StatefulWidget {
  addressselectionPage({Key key}) : super(key: key);

  @override
  _addressselectionPageState createState() => _addressselectionPageState();
}

class _addressselectionPageState extends State<addressselectionPage> {
  String a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.navigate_before,
            size: 36,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: Color(0xffbfbfbf), //修改颜色
        ),
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '新增地址',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          FlatButton(
              padding: EdgeInsets.only(left: 35),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '保存',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: 236,
        color: Colors.white,
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.only(left: 15, top: 14, right: 22),
        child: Column(
          children: <Widget>[
            model(classname: '联系人姓名', textfieldhintText: '请输入姓名'),
            Divider(),
            model(classname: '手机号码', textfieldhintText: '请输入手机号码'),
            Divider(),
            model(classname: '邮政编码', textfieldhintText: '请输入邮政编码'),
            Divider(),
            inthearea(),
            Divider(),
            model(classname: '详细地址', textfieldhintText: '请输入详细地址'),
          ],
        ),
      ),
    );
  }
}

class model extends StatefulWidget {
  final String classname;
  final String textfieldhintText;
  model({Key key, this.classname, this.textfieldhintText}) : super(key: key);

  @override
  _modelState createState() => _modelState(
      classname: this.classname, textfieldhintText: this.textfieldhintText);
}

class _modelState extends State<model> {
  String classname;
  String textfieldhintText;
  _modelState({this.classname, this.textfieldhintText});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28,
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                width: 75,
                child: Text(
                  this.classname,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              SizedBox(width: 28),
              Container(
                width: 230,
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: this.textfieldhintText,
                      hintStyle: TextStyle(fontSize: 12)),
                ),
              )
            ],
          ),
        ));
  }
}

class inthearea extends StatefulWidget {
  inthearea({Key key}) : super(key: key);

  @override
  _intheareaState createState() => _intheareaState();
}

class _intheareaState extends State<inthearea> {
  String area = '请选择地区';
  @override
  Widget build(BuildContext context) {
    final screenwith = MediaQuery.of(context).size.width;
    return Container(
        height: 28,
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                width: 75,
                child: Text(
                  '所在地区',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              SizedBox(width: 28),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => BottomSheet(
                            onClosing: () {},
                            builder: (context) => Container(
                                  height: 250.0,
                                  child: AddressPicker(
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                    mode: AddressPickerMode
                                        .provinceCityAndDistrict,
                                    onSelectedAddressChanged: (address) {
                                      // print(
                                      //     '${address.currentProvince.province}');
                                      // print('${address.currentCity.city}');
                                      // print('${address.currentDistrict.area}');
                                      setState(() {
                                        this.area =
                                            address.currentProvince.province +
                                                '  ' +
                                                address.currentCity.city +
                                                '  ' +
                                                address.currentDistrict.area;
                                      });
                                    },
                                  ),
                                )));
                  },
                  child: Container(
                    width: screenwith * 0.62,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // width: 206,
                          child: Text(
                            this.area,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
