// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:simple_app/src/view/screen/home/model/home_model.dart';

// class BlogDetails extends StatelessWidget {
//   BlogDetails({Key? key}) : super(key: key);
//
// var post = Get.arguments;
//
//   @override
//   Widget build(BuildContext context) {
//     print(post.id);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 5,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(Icons.arrow_back_ios)),
//         title: Center(
//             child: Text("Application",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center)),
//         actions: [
//           SizedBox(
//             width: 50,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           SizedBox(
//             child: Image.asset(
//               "assets/Group 92404@3x.png",
//               height: Get.height,
//               width: Get.width,
//               fit: BoxFit.fitWidth,
//             ),
//           ),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: ListView(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(30),
//                   child: Card(
//                     child: Container(
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset(
//                               "assets/25817383_6972652@3x.png",
//                               height: 200,
//                               fit: BoxFit.fitWidth,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Content ID: ${post.id}",
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20),
//                             ),
//                             Text(
//                               "${post.title}",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "User ID:${post.userId}",
//                                   style: TextStyle(
//                                       color: Colors.pink,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(
//                                           color: Colors.pink,
//                                           width: 1,
//                                           style: BorderStyle.solid)),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.copy,
//                                         color: Colors.pink,
//                                         size: 20,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         "লিংক কপি করুন",
//                                         style: TextStyle(
//                                             color: Colors.pink,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 12),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Divider(
//                               color: Colors.pink,
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               "${post.body}",
//                               style: TextStyle(fontSize: 12),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app/src/view/const/text_style.dart';
import 'package:simple_app/src/view/screen/home/model/home_model.dart';
import 'package:simple_app/src/view/screen/main_page/nav_bar.dart';
import 'package:simple_app/src/view/widget/nav_global.dart';

class BlogDetails extends StatelessWidget {
  final String id;
  final String title;
  final String userId;
  final String body;

  BlogDetails(
      {required this.userId,
      required this.title,
      required this.id,
      required this.body,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Center(
          child: Text(
            "Application",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          SizedBox(
            width: 60,
          ),
        ],
      ),
      body: Stack(
        children: [
          buildBackgroundImage(),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: buildPostDetailsCard()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        shape: CircleBorder(),
        onPressed: () {
          // Add custom action for the floating action button here.
        },
        child: Image.asset("assets/12.png"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Display the selected page.

      bottomNavigationBar: BottomNavBarPage(),
    );
  }

  Widget buildBackgroundImage() {
    return SizedBox(
      child: Image.asset(
        "assets/Group 92404@3x.png",
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget buildPostDetailsCard() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/25817383_6972652@3x.png",
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Content ID: ${id ?? ""}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text("${title ?? ""}", style: AppTextStyle.titleTextStyle),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User ID: ${userId ?? ""}",
                        style: AppTextStyle.id,
                      ),
                      buildCopyLinkButton(),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Colors.pink,
                  ),
                  SizedBox(height: 5),
                  Text("${body ?? ""}", style: AppTextStyle.subTextStyle,textAlign: TextAlign.start, ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCopyLinkButton() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.pink,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.copy,
            color: Colors.pink,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "লিংক কপি করুন",
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
