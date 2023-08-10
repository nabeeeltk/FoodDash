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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "image/foodDashlogo2.png",
              width: 250,
            ),
          ),
        const   SizedBox(
            width: 30,
            height: 30,
            child:  LoadingIndicator(
              indicatorType:
                  Indicator. lineScalePulseOutRapid,
              colors: [
                Colors.orange,
                Colors.white,
              ],
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }
}
