import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'camera_page.dart';
import 'endangered.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  int _currentIndex = 1;
  final List _children = [
    PlaceholderWidget(Colors.white),
    CameraPage(),
    Endangered(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShutterBug'),
        backgroundColor: Colors.lightBlue,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: "Bug"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dangerous), label: "Endangered")
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
