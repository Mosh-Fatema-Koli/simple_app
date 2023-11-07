
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app/src/view/const/text_style.dart';
import 'package:simple_app/src/view/screen/home/controller/home_controller.dart';
import 'package:simple_app/src/view/screen/home/details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app/src/view/screen/home/controller/home_controller.dart';
import 'package:simple_app/src/view/screen/home/details.dart';
import 'package:simple_app/src/view/screen/home/model/home_model.dart';




class PostList extends StatelessWidget {
  PostList({Key? key}) : super(key: key);

  final HomeController postController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        if (postController.posts.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: postController.posts.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final post = postController.posts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/25817383_6972652@3x.png",height: 200,fit:BoxFit.fitWidth,),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Content ID: ${post.id}",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 20),),

                          Text(post.title,style: AppTextStyle.titleTextStyle),
                          Text("User ID: ${post.userId}",style: TextStyle(color: Colors.pink,fontSize: 16),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(onPressed: (){
                                Get.to(BlogDetails(
                                  title: post.title,
                                body: post.body,
                                userId: post.userId.toString(),
                                id: post.id.toString(),));
                              } , child: Text("Read"),color:Colors.pink ,textColor: Colors.white,)

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
