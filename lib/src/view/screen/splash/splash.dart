
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_app/src/view/screen/splash/controller/splash_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {


    final _splashController=Get.put(SplashController());
    _splashController.jumpPage();



    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/Animation - 1699293804840.json', // Replace with the path to your animation file
            width: 200, // Set the width of the animation
            height: 200, // Set the height of the animation
            fit: BoxFit.fill, // Adjust the fit of the animation
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(),
          )
        ],
      ),),

    );
  }
}