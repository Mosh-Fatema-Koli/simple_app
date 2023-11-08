
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_app/src/view/const/text_style.dart';
import 'package:simple_app/src/view/screen/home/controller/home_controller.dart';
import 'package:simple_app/src/view/screen/home/details.dart';


class PostList extends StatelessWidget {
  PostList({Key? key}) : super(key: key);

  final HomeController postController = Get.put(HomeController());
  var connectivityResult = Connectivity().checkConnectivity();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
            if(postController.isLoading.value == true){
              return Center(child: CircularProgressIndicator());
            }
             else if (postController.posts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (connectivityResult == ConnectivityResult.none) {
              // No internet connection
              return Center(
                child: Text(
                  "No data available",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }else {
          return ListView.builder(
            itemCount: postController.posts.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final post = postController.posts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Card(
                  surfaceTintColor: Colors.transparent,
                  elevation: 4,  // Change this
                  shadowColor:  Colors.grey,
                  child: Container(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/25817383_6972652@3x.png",height: 190,width:Get.width,fit:BoxFit.fitWidth,)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Content ID: ${post.id}",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 20),),

                          Text(post.title,style: AppTextStyle.titleTextStyle, overflow: TextOverflow.ellipsis,),
                          SizedBox(
                            height: 5,
                          ),
                          Text("User ID: ${post.userId}",style: AppTextStyle.id,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(onPressed: (){
                                Get.to(BlogDetails(
                                  title: post.title,
                                body: post.body,
                                userId: post.userId.toString(),
                                id: post.id.toString(),));
                              } , child: Text("Read"),color:HexColor("#D20073") ,textColor: Colors.white,)

                            ],
                          ),
                        ],
                      )

                  ),
                ),
              );
            },
          );
        }
      },
    );


  }
}
