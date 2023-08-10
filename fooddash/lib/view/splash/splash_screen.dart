import 'package:flutter/material.dart';
import 'package:fooddash/view/OnbordingScreen/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed( const Duration(seconds: 4), () {
    
        Get.to( const OnboardingScreen());
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "image/FoodDashLopg.png",
              width: 250,
            ),
          ),
        const   SizedBox(
            width: 30,
            height: 30,
            child:  LoadingIndicator(
              indicatorType:
                  Indicator.lineScalePulseOutRapid, // Choose your desired indicator type
              colors: [
                Colors.orange,
                Colors.black,

              ],
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }
}
