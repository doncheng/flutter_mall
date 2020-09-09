import 'package:flutter/material.dart';

import 'package:mall/constant/string.dart';

import 'package:mall/page/home/mine.dart';
import 'package:mall/page/home/search.dart';

import 'package:mall/page/login/landing.dart';
import 'package:mall/page/mine/jiaohu.dart';

import 'evaluation.dart';
import 'main_page.dart';

class MallMainView extends StatefulWidget {
  @override
  _MallMainViewState createState() => _MallMainViewState();
}

class _MallMainViewState extends State<MallMainView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _list = List();

  @override
  void initState() {
    super.initState();
    _list
      ..add(MallHomePage())
      // ..add(CategoryView())
      ..add(SearchPage())
      // ..add(CartView())
      ..add(landingPage())
      ..add(MineView());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(Strings.HOME),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(Strings.CATEGORY),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(Strings.SHOP_CAR),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(Strings.MINE),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
