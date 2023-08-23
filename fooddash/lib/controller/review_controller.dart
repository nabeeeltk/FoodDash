import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/model/review_model.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {

  TextEditingController reviewcomment = TextEditingController();
  TextEditingController reviewrating = TextEditingController();
  
  var name = ''.obs;
  var review = ''.obs;
  var reviews = <ReviewModel>[].obs; // Add this line to store the retrieved reviews

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    getReviews(); // Call the getReviews function when the controller is initialized
  }

  void clearFields() {
    name.value = '';
    review.value = '';
  }

  Future<void> addReview(ReviewModel review) async {
  try {
    await firestore.collection('reviews').add({
      'username': review.username,
      'rating': review.rating,
      'comment': review.comment, // Make sure this is populated correctly
      'timestamp': FieldValue.serverTimestamp(),
      
    });
    log(review.comment);
     Get.back();
  } catch (e) {
    log('Error adding review: $e');
  }
}


  Future<void> getReviews() async {
    try {
      final querySnapshot = await firestore.collection('reviews').get();
      final List<ReviewModel> fetchedReviews = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ReviewModel(
          username: data['username'],
          rating: data['rating'],
          comment: data['comment'],
        );
      }).toList();
      reviews.assignAll(fetchedReviews);
    } catch (e) {
      log('Error getting reviews: $e');
    }
  }
}
