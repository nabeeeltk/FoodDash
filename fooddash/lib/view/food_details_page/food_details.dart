import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fooddash/controller/car_controller.dart';
import 'package:fooddash/controller/owner/add_item_cotroller.dart';
import 'package:fooddash/model/review_model.dart';
import 'package:fooddash/view/food_details_page/add_review.dart';
import 'package:fooddash/view/shop_owner/edit_item_page.dart';
import 'package:get/get.dart';
import '../../controller/review_controller.dart';
import '../../model/Item_model.dart';
import '../payment/payment_page.dart';

class FoodDetailsPage extends StatelessWidget {
final ItemModel pitem; // Receive the item data

  final _cartController = Get.put(MyCardController());
  final controller = Get.put(AddNewItemcontrller());

//  final ReviewController _reviewController = Get.put(ReviewController());
  FoodDetailsPage({required this.pitem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(
                      image: NetworkImage(pitem.imageUrl.toString()),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(30),
                      bottomStart: Radius.circular(30))),
                      
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 30,
                        )),
                  ),
                  IconButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(
                            100, 100, 0, 0), 
                        items: [
                          const PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              title: Text('Edit'),
                              leading: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: ListTile(
                              title: Text('Delete'),
                              leading: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'Wish List',
                            child: ListTile(
                              title: Text('Wish List'),
                              leading: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                        elevation: 8.0,
                      ).then((value) {
                        if (value == 'edit') {
                          Get.to(EditItemPage());
                        } else if (value == 'delete') {
                          controller.deleteItem(pitem.id!);
                        } else if (value == 'Wish List') {}
                      });
                    },
                    icon: const Icon(Icons.more_vert,
                        color: Colors.black, size: 30),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              pitem.itemname.toString(),
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              pitem.itemDescription.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddReview(
          // onAddReview: (double rating, String comment) {
          //   // Create a ReviewModel object
          //   ReviewModel review = ReviewModel(
          //     username: 'User', // You can replace with the actual username
          //     rating: rating.toInt(),
          //     comment: comment,
          //   );
          //   // Add the review to the ReviewController
          //   _reviewController.addReview(review);
          // },
        )
                    );
                  },
                  icon: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  label: const Text("4.0")),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delivery_dining,
                    color: Colors.amber,
                  ),
                  label: const Text("free")),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "ingredients",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  pitem.ingredients.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              height: 40,
              onPressed: () {
                Get.to(PaymentPage());
              },
              color: Colors.white,
              child: const Text(
                "BUY NOW",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            MaterialButton(
              height: 40,
              onPressed: () {
                _cartController.addItemToCart(pitem);
                log(pitem.toString());
              },
              color: Colors.orange.shade800,
              child: const Text(
                "ADD TO CART",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
        ],
      ),
   
      );
  }
}
