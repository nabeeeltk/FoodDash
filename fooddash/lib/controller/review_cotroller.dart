import 'package:get/get.dart';
import '../model/review_model.dart';

class ReviewController extends GetxController {
  RxList<ReviewModel> reviews = <ReviewModel>[].obs;

  void addReview(ReviewModel review) {
    reviews.add(review);
  }
}
