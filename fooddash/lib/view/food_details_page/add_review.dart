import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fooddash/controller/review_controller.dart';
import 'package:get/get.dart';

import '../../model/review_model.dart';

class AddReview extends StatelessWidget {
  final reviewctrl= Get.put(ReviewController());
   AddReview({super.key});
 
  @override
  Widget build(BuildContext context) {
    double userRating = 0.0;

    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Rate this Item',
          style: TextStyle(
              color: Colors.orange, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please rate and review your experience with the Item'),
            const SizedBox(height: 16),
            RatingBar.builder(
              initialRating: userRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                userRating = rating;
              },
            ),
            const SizedBox(
              height: 10,
            ),
             TextField(
              controller: reviewctrl.reviewcomment,
              decoration:const  InputDecoration(
                  hintText: "Write Here", border: OutlineInputBorder()),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () async{
             final review = ReviewModel(
        username: reviewctrl.name.value, // Assuming name is the user's name
        rating: userRating.toInt(),
        comment: reviewctrl.reviewcomment.text
      );
      await reviewctrl.addReview(review);
      log('User rated: $userRating');
      log(reviewctrl.reviewcomment.text);
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                  color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
