

import 'package:fooddash/view/my_cart/my_cart.dart';
import 'package:get/get.dart';

import '../model/Item_model.dart';

class MyCardController extends GetxController {

   RxList<ItemModel> mycartItems = <ItemModel>[].obs;
  RxInt itemCount = 1.obs;
 
  void  increaseItemCount() {
    itemCount++;
    
  }

  void decreaseItemCount() {
    if (itemCount > 1) {
      itemCount--;
    }
  }
  
  void addItemToCart(ItemModel item) async {
    
      mycartItems.add(item);
      
      await Get.to(MyCart());
   
  }
  
}
