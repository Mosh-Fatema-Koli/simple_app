import 'package:get/get.dart';
import 'package:simple_app/src/view/screen/home/controller/home_controller.dart';
import 'package:simple_app/src/view/screen/home/home.dart';
import 'package:simple_app/src/view/screen/main_page/nav_bar.dart';

class SplashController extends GetxController{

  final HomeController postController = Get.put(HomeController());


  @override
  void onInit() {
    postController.fetchPosts();
    super.onInit();
  }


  jumpPage() async {

    Future.delayed(const Duration(seconds: 3),(){
      Get.offAll(BottomNavBar());

    });
  }

}