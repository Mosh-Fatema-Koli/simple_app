import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:simple_app/src/view/const/local_database.dart';
import 'package:simple_app/src/view/screen/home/model/home_model.dart';

class HomeController extends GetxController{

  HomeModel? homeModel;
  var isLoading = false.obs;
  RxList<HomeModel> posts=<HomeModel>[].obs;



  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        var demoList = responseData.map((x) => HomeModel.fromJson(x)).toList();
        posts.value = demoList.toList();
        print(posts);

        // Delete existing posts from SQLite
        await DatabaseHelper.instance.deleteAllPosts();

        // Save new posts to SQLite
        responseData.forEach((post) {
          DatabaseHelper.instance.insertPost(post);
          print("saved");
        });

      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
