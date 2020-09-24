import 'package:flutter/material.dart';
import 'package:mall/page/home/webview.dart';
import 'package:mall/utils/navigator_util.dart';
import 'dart:io';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      // Platform.isAndroid
      Platform.isIOS
          ? NavigatorUtils.goMallMainPage(context)
          : Navigator.push(
              context,
              MaterialPageRoute(
                  //导航打开新视图
                  builder: (context) => webviewPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrangeAccent,
        child: Image.asset(
          "images/splash.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
