import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mall/config/routers.dart';
import 'package:mall/config/application.dart';
import 'package:mall/model/user_info.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.setMockInitialValues(
      {}); // set initial values here if desired

  runApp(ChangeNotifierProvider(
    builder: (context) => UserInfoModel(),
    child: MallApp(),
  ));
}

class MallApp extends StatelessWidget {
  MallApp() {
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primaryColor: Color(0xfffe5155),
      ),
    );
  }
}
