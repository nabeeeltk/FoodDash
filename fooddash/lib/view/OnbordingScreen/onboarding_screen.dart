import 'package:flutter/material.dart';
import 'package:fooddash/view/OnbordingScreen/onboarding_screen2.dart';
import 'package:get/route_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/bg3.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "All your favorites ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxWidth * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   Text(
                      "Get all your loved foods in one once place,you just place the orer we do the rest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxWidth * 0.03,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.yellow],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                           Get.to(const OnboardingScreen2());
                        },
                        child: const Text(
                          "Start",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      child: Text(
                        "Now delivery to Your Door 24/7",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: constraints.maxWidth * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );}}