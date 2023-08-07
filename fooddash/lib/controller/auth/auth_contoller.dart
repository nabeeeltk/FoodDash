import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/model/user_model.dart';
import 'package:fooddash/view/Auth/user/user_log_in.dart';

import 'package:fooddash/view/Home/home_screen.dart';
import 'package:get/get.dart';


class Authcontroller extends GetxController{
  FirebaseAuth  auth = FirebaseAuth.instance;
  FirebaseFirestore  db =FirebaseFirestore.instance;

  TextEditingController  email =TextEditingController();
  TextEditingController  password =TextEditingController();
  TextEditingController  userloginemail =TextEditingController();
  TextEditingController  userPassword =TextEditingController();
  TextEditingController  userresetemail =TextEditingController();
    TextEditingController  username =TextEditingController();

   var  loading=false.obs;

  signup()async{
    try{
      loading.value=true;
    await auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
    await verifyemail();
    Get.to(()=>const HomeScreen());
    loading.value=false;
    }catch(e){
      Get.snackbar(
      backgroundColor: Colors.white,
      
        "error", "$e");
      print("$e");
      loading.value=false;
    }
  }

  adduser()async{

    UserModel user = UserModel(
      email: auth.currentUser?.email,
      username: username.text
    );
    await db.collection("user").doc(auth.currentUser?.uid).collection("profile").add(user.tomap());
  }

  signout()async{
    await auth.signOut();
  }
  signin()async{
    loading.value=true;
    try{
          await auth.signInWithEmailAndPassword(email: userloginemail.text, password: userPassword.text);
          Get.to( const HomeScreen());
          loading.value=false;

    }catch(e){
          loading.value=false;
          Get.snackbar("error", "please register or check email");

    }
  }
  verifyemail()async{
    await auth.currentUser?.sendEmailVerification();

    Get.snackbar("email", "send");
  }

  resetpassword()async{
    loading.value=true;
    try{
      await auth.sendPasswordResetEmail(email: userresetemail.text);
      Get.snackbar("Email", "send successfully");
      Get.to(()=>UserSignIn());
      loading.value=false;
    }catch(e){
      Get.snackbar("Error", "$e");
      log("$e");
      loading.value=false;

    }
  }
}