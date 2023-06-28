import 'package:flutter/material.dart';
import 'Home/Home.dart';
import 'Friends/Friends.dart';
import 'Marketplace/Marketplace.dart';
import 'Menu/Menu.dart';
import 'Notice/Notice.dart';
import 'Watch/Watch.dart';

class OutLine extends StatefulWidget implements PreferredSizeWidget {
  const OutLine({super.key});

  @override
  State<StatefulWidget> createState() => OutLineState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class OutLineState extends State<OutLine> {

  String orderDocumentInfo = '';

  // 追加 start
  var _currentIndex = 0;
  final _pages = <Widget>[
    // ホーム画面呼び出し
    const Center(
      child: Home(),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.blue.withOpacity(0.3),
      child: const Friends(),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.blue.withOpacity(0.3),
      child: const Watch(),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.blue.withOpacity(0.3),
      child: const Marketplace(),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.blue.withOpacity(0.3),
      child: const Notice(),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.pink.withOpacity(0.3),
      child: const Menu(),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // 追加 end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      // BottomNavigatorBar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '友達',
            backgroundColor: Colors.black,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.tv),
          //   label: 'Watch',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.storefront),
          //   label: 'Marketplace',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications),
          //   label: 'お知らせ',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.menu),
          //   label: 'メニュー',
          // ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}