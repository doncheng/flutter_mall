import 'package:flutter/material.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的资产',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Color(0xfff0f0f0),
      body: AssetsBody(),
    );
  }
}

class AssetsBody extends StatefulWidget {
  AssetsBody({Key key}) : super(key: key);

  @override
  _AssetsBodyState createState() => _AssetsBodyState();
}

class _AssetsBodyState extends State<AssetsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}
