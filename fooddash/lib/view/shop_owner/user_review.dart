import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/review_controller.dart';

// ignore: must_be_immutable
class UserReview extends StatelessWidget {
   UserReview({super.key});
   final reviewctrl= Get.put(ReviewController());
    User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         backgroundColor: Colors.black,
        title:const  Text("User Review",style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const  Icon(Icons.arrow_back_ios_new,size: 30,color: Colors.white,)),
        
      ),
      body: FutureBuilder(
        future: reviewctrl.getReviews(),
        builder: (context, snapshot) => 
         ListView.separated(
          itemBuilder: (context, index) {
            final review= reviewctrl.reviews[index];
          return  ListTile(
            title: Text(user!.email.toString(),style:const  TextStyle(color: Colors.white,
            fontSize: 15,),),
            subtitle: Text(review.comment,style:const  TextStyle(fontSize: 15,fontWeight:  FontWeight.bold,color: Colors.orange),),
            
          );
        }, separatorBuilder: (context, index) {
        return const  Divider();
        }, itemCount: reviewctrl.reviews.length),
      ),
    );
  }
}