import 'package:get/get.dart';

class MyCardController extends GetxController {
  RxInt itemCount = 1.obs; 
  void increaseItemCount() {
    itemCount++;
    
  }

  void decreaseItemCount() {
    if (itemCount > 1) {
      itemCount--;
    }
  }
}