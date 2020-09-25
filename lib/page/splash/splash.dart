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
      // Platform.isIOS
      //     ?
      NavigatorUtils.goMallMainPage(context);
      // : Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         //导航打开新视图
      //         builder: (context) => webviewPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Scaffold(
            body: Container(
              color: Colors.deepOrangeAccent,
              child: Image.asset(
                "images/splash.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 80, right: 80),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/icon.png",
                      width: 250,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  '交易呗',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
  }
}
