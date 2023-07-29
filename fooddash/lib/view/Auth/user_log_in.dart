import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddash/utile/constents.dart';
import 'package:fooddash/view/Auth/forgot_password.dart';
import 'package:fooddash/view/Auth/otp_verification.dart';
import 'package:fooddash/view/Auth/user_sign_up.dart';
import 'package:fooddash/widget/social_media_icon.dart';
import 'package:get/get.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 10, 17),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "Log In",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const Text(
              "Please sign in to your existing account.",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:const  BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30))
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              
              child: Padding(
                padding:const  EdgeInsets.all(8.0),
                child: Column(
                  // Add the children of the container here
                  children: [
                   const  SizedBox(height: 30,),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.blueGrey.shade100,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Enter your email"),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.blueGrey.shade100,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: "Enter your Password"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(const ForgotPassword());
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.orange.shade800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(const OtpVerification());
                        },
                        color: appColor.themcolor,
                        height: 50,
                        minWidth: double.infinity,
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(const UserSignUp());
                          },
                          child:const  Text(
                            "SIGN UP",
                            style: TextStyle(color:appColor.themcolor),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        SocialMediaIcon(
                          imagePath: "image/facebookicon.png",
                          onTap: () {
                            log("open facebook");
                          },
                        ),
                       const  SizedBox(width: 15,),
                        SocialMediaIcon(
                          imagePath: "image/twitericon.png",
                          onTap: () {},
                        ),
                         const  SizedBox(width: 15,),
                        SocialMediaIcon(
                          imagePath: "image/googleicon - Copy.png",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
