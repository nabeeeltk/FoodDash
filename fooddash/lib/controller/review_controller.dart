import 'package:get/get.dart';

class ReviewController extends GetxController {
  var name = ''.obs;
  var review = ''.obs;

  void clearFields() {
    name.value = '';
    review.value = '';
  }
}