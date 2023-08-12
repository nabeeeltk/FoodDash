import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddash/view/onbording_screen/onboarding_screen.dart';
import 'package:fooddash/view/home/home_screen.dart';  // Import your HomeScreen
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../controller/auth/auth_contoller.dart';

class SplashScren extends StatelessWidget {
 SplashScren({Key? key});

    final Authcontroller _authController = Authcontroller();

  @override
  Widget build(BuildContext context) {
    determineDestination();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "image/foodDashlogo2.png",
                width: 250,
              ),
            ),
           const  SizedBox(
              width: 30,
              height: 30,
              child: LoadingIndicator(
                indicatorType: Indicator.lineScalePulseOutRapid,
                colors: [
                  Colors.orange,
                  Colors.white,
                ],
                strokeWidth: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine where to navigate based on user authentication status
void determineDestination() async {
  log("Checking user authentication...");
  await Future.delayed(const Duration(seconds: 4));

  if (_authController.auth.currentUser != null) {
    log("User is authenticated. Navigating to HomeScreen.");
    Get.off(() => HomeScreen());
  } else {
    log("User is not authenticated. Navigating to OnboardingScreen.");
    Get.off(() =>const  OnboardingScreen());
  }
}


 
}
