import 'package:get/get.dart';

class FoodQuantityController extends GetxController {
  var quantity = 1.obs;

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
