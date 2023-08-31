
import 'package:fooddash/model/faveraite_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/wishlist_model.dart';

class WishlistController extends GetxController {
  var wishlist = <ItemModel>[].obs;

  void addToWishlist(Product product) {
    final userId = "user_id";
    final wishlistItem = WishlistItem(product.id, userId);
    wishlist.add(wishlistItem as ItemModel);
    
  }

  //  void removeFromWishlist(Product product) {
  //   wishlist.removeWhere((item) => item.productId == product.id);
    
  //   // Remove from Firebase or perform any other required action
  // }
}