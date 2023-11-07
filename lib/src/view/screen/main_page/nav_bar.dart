

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:simple_app/src/view/screen/home/home.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 0; // The currently selected index.

  // Define your pages/screens here.
  final List<Widget> _pages = [
    HomePage(),
    HomePage(),

  ];

  // Function to change the selected index.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
      title: Center(child: Text("Application",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
      actions: [

        SizedBox(
          width: 50,
        ),


      ],
    ),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        shape: CircleBorder(),
        onPressed: () {
          // Add custom action for the floating action button here.
        },
        child: Image.asset("assets/12.png"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,// Display the selected page.
      bottomNavigationBar:  BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/h.png"),
              label: 'হোম',
            ),

            BottomNavigationBarItem(
              icon: Image.asset("assets/n.png"),
              label: 'নোটিফিকেশন',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,

        ),


    );
  }
}


class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: (){
                  Get.to(BottomNavBar());
                },
                child: Image.asset("assets/h.png")),
            label: 'হোম',
          ),

          BottomNavigationBarItem(
            icon: Image.asset("assets/n.png"),
            label: 'নোটিফিকেশন',
          ),
        ],
        showUnselectedLabels: false,
        selectedItemColor: Colors.pink,

    );
  }
}

