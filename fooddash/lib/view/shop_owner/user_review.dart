import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/review_controller.dart';

class UserReview extends StatelessWidget {
   UserReview({super.key});
   final reviewctrl= Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("User Review"),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const  Icon(Icons.arrow_back_ios_new)),
        
      ),
      body: ListView.separated(
        
        itemBuilder: (context, index) {
          final review= reviewctrl.reviews[index];
        return  ListTile(
          title: Text(review.comment,style: TextStyle(color: Colors.black),),
          subtitle: Text(review.rating.toString()),
          
        );
      }, separatorBuilder: (context, index) {
      return const  Divider();
      }, itemCount: reviewctrl.reviews.length),
    );
  }
}