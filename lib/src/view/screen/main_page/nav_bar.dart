

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_app/src/view/screen/home/home.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<TabItem> _tabItems = [
    TabItem(icon: "assets/h.png", label: "হোম"),
    TabItem(icon: "assets/n.png", label: "নোটিফিকেশন"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#FFFFFF"),
        elevation: 5,
        shadowColor: Colors.grey,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Center(
            child: Text(
              "Application",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
        actions: [
          SizedBox(
            width: 50,
          ),
        ],
      ),
      body: _buildPage(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#D20073"),

        shape: CircleBorder(),
        onPressed: () {
          // Add custom action for the floating action button here.
        },
        child: Image.asset("assets/12.png"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.grey,

        color: Colors.white,
        shape: CircularNotchedRectangle(),
        elevation: 15,
        notchMargin: 15,

        surfaceTintColor: Colors.transparent,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _tabItems.asMap().entries.map((entry) {
            final index = entry.key;
            final tabItem = entry.value;
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                children: [
                  Image.asset(
                    tabItem.icon,
                    height: _selectedIndex == index ? 20 : 23,
                    width: _selectedIndex == index ? 20 : 25,
                  ),
                  Text(
                    _selectedIndex == index ? tabItem.label : "",
                    style: TextStyle(
                      color:  HexColor("#D20073"),
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Center(
          child: Text("নোটিফিকেশন"),
        );
      default:
        return Center(
          child: Text("Invalid Page"),
        );
    }
  }
}

class TabItem {
  final String icon;
  final String label;

  TabItem({required this.icon, required this.label});
}

////////////////////****************************************************



