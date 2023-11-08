
import 'package:flutter/material.dart';
import 'package:simple_app/src/view/screen/home/home.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex1 = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex1 = index;
    });
  }

  final List<TabItem> _tabItems = [
    TabItem(icon: "assets/h.png", label: "হোম"),
    TabItem(icon: "assets/n.png", label: "নোটিফিকেশন"),
  ];
  @override

  Widget build(BuildContext context) {


    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      surfaceTintColor: Colors.white,
      elevation: 15,
      notchMargin: 15,
      height: 65,
      shadowColor: Colors.grey,
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
                  height: _selectedIndex1 == index ? 20 : 20,
                  width: _selectedIndex1 == index ? 20 : 25,
                ),
                Text(
                  _selectedIndex1 == index ? tabItem.label : "",
                  style: TextStyle(
                    color:  Colors.pink,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
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