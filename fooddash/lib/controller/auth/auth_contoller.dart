import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/model/user_model.dart';
import 'package:fooddash/view/auth/user/user_log_in.dart';

import 'package:fooddash/view/home/home_screen.dart';
import 'package:fooddash/view/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userloginemail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userresetemail = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController userOtp = TextEditingController();

  var loading = false.obs;

  void checkUserLoggedIn() async {
    if (auth.currentUser != null) {
      Get.offAll(() => HomeScreen());
    }
  }

  signup() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await verifyemail();
      await adduser();

      Get.to(() => HomeScreen());
      loading.value = false;
    } catch (e) {
      Get.snackbar(backgroundColor: Colors.white, "error", "$e");
      log("$e");
      loading.value = false;
    }
  }

  adduser() async {
  if (auth.currentUser != null) {
    String userEmail = auth.currentUser?.email ?? "";
    String userName = username.text ?? "";

    if (userEmail.isNotEmpty && userName.isNotEmpty) {
      UserModel user = UserModel(email: userEmail, username: userName);
      await db
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection("profile")
          .add(user.tomap());
      
      // The 'toMap()' function should be defined in your 'UserModel' class.
    } else {
      print("Email and username must not be empty.");
    }
  } else {
    print("User is not authenticated.");
  }
}


  signout() async {
    await auth.signOut();
    await _googleSignIn.signOut();
    await Get.to(SplashScren());
  }

  signin() async {
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
          email: userloginemail.text, password: userPassword.text);
      Get.to(HomeScreen());
      loading.value = false;
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        backgroundColor: Colors.white,
        "error", "please register or check email: $e");
    }
  }

  verifyemail() async {
    await auth.currentUser?.sendEmailVerification();

    Get.snackbar("email", "send");
  }

  resetpassword() async {
    loading.value = true;
    try {
      await auth.sendPasswordResetEmail(email: userresetemail.text);
      Get.snackbar("Email", "send successfully");
      Get.to(() => UserSignIn());
      loading.value = false;
    } catch (e) {
      Get.snackbar(backgroundColor: Colors.white,
        "Error", "$e");
      log("$e");
      loading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuth =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken,
        );
        await auth.signInWithCredential(credential);
      }
    } catch (error) {
      log("Google Sign-In Error: $error");
    }
  }
}
