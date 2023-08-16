// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fooddash/model/review_model.dart';
// import 'package:get/get.dart';

// class ReviewController extends GetxController {
//   var name = ''.obs;
//   var review = ''.obs;

//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   void clearFields() {
//     name.value = '';
//     review.value = '';
//   }

//   Future<void> addReview(ReviewModel review) async {
//     try {
//       await firestore.collection('reviews').add({
//         'username': review.username,
//         'rating': review.rating,
//         'comment': review.comment,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error adding review: $e');
//     }
//   }
// }
