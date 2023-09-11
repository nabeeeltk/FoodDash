import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/view/shop_owner/home_screen.dart';
import 'package:fooddash/view/splash/splash_screen.dart';
import 'package:fooddash/widget/root_screen.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/shop_owner_model.dart';
import '../../view/auth/ShopeOwner/owner_login.dart';

class ShopOwnerAuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController shopOwnerLoginEmail = TextEditingController();
  TextEditingController shopOwnerPassword = TextEditingController();
  TextEditingController shopOwnerResetEmail = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController shopOtp = TextEditingController();

  var loading = false.obs;

  void checkShopOwnerLoggedIn() async {
    if (auth.currentUser != null) {
      Get.offAll(() => ShopeHomeScreen());
    }
  }

  shopOwnerSignup() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await verifyEmail();
      await addShopOwner();
      

      Get.to(() => ShopeHomeScreen());
      loading.value = false;
    } catch (e) {
      Get.snackbar(backgroundColor: Colors.white, "Error", "$e");
      log("$e");
      loading.value = false;
    }
  }

  addShopOwner() async {
    if (auth.currentUser != null) {
      String userEmail = auth.currentUser?.email ?? "";
      String shopOwnerName = shopName.text;

      if (userEmail.isNotEmpty && shopOwnerName.isNotEmpty) {
        ShopOwnerModel shopOwner =
            ShopOwnerModel(email: userEmail, shopName: shopOwnerName);
        await db
            .collection("shop_owners")
            .doc(auth.currentUser!.uid)
            .collection("profile")
            .add(shopOwner.toMap());
      } else {
        log("Email and shop owner name must not be empty.");
      }
    } else {
      log("User is not authenticated.");
    }
  }

  shopOwnerSignout() async {
    await auth.signOut();
    await _googleSignIn.signOut();
    await Get.to(SplashScren());
  }

  shopOwnerSignin() async {
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
          email: shopOwnerLoginEmail.text, password: shopOwnerPassword.text);
      Get.put( const RootScreen());
      loading.value = false;
    } catch (e) {
      loading.value = false;
      Get.snackbar(
          backgroundColor: Colors.white,
          "Error",
          "Please register or check email: $e");
    }
  }

  verifyEmail() async {
    await auth.currentUser?.sendEmailVerification();

    Get.snackbar("Email", "Sent");
  }

  shopOwnerResetPassword() async {
    loading.value = true;
    try {
      await auth.sendPasswordResetEmail(email: shopOwnerResetEmail.text);
      Get.snackbar("Email", "Sent successfully");
      Get.to(() => OwnerLogin());
      loading.value = false;
    } catch (e) {
      Get.snackbar(backgroundColor: Colors.white, "Error", "$e");
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ShopOwnerModel?> getShopOwner(String userId) async {
    try {
      // Get a reference to the shop owner's profile document
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection("shop_owners")
          .doc(userId)
          .collection("profile")
          .doc("profile_id") // Replace with the actual document ID
          .get();

      // Check if the document exists
      if (snapshot.exists) {
        // Convert the data to a ShopOwnerModel object
        ShopOwnerModel shopOwner = ShopOwnerModel.fromMap(snapshot.data()! as DocumentSnapshot<Object?>);
        return shopOwner;
      } else {
        return null; // Document doesn't exist
      }
    } catch (error) {
      print("Error retrieving shop owner data: $error");
      return null;
    }
  }
}
