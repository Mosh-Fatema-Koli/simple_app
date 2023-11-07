
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app/src/view/screen/home/comphonent/list_post.dart';
import 'package:simple_app/src/view/screen/home/controller/home_controller.dart';
import 'package:simple_app/src/view/screen/home/details.dart';
import 'package:simple_app/src/view/screen/main_page/nav_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController postController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
   children: [
     SizedBox(
       child: Image.asset("assets/Group 92404@3x.png",height: Get.height,width: Get.width,fit:BoxFit.fitWidth,),
     ),
     Positioned(
       top: 0,
       left: 0,
       right: 0,
       bottom: 0,
       child: ListView(
       children: [
        SizedBox(
          height: 10,
        ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
           child: Card(
               child: TextFormField(
             decoration: InputDecoration(
                 border: InputBorder.none,
                 hintText: "Search here...",
                 prefixIcon: (Icon(Icons.search))

             ),
           )),
         ),
           PostList()


       ],
     ),
       ),
   ],
  );



}

}
