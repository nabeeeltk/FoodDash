import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddash/controller/owner/add_item_cotroller.dart';

import 'package:fooddash/view/user_profile/user_address.dart';

import 'package:get/get.dart';

import '../../controller/car_controller.dart';

import '../food_details_page/food_details.dart';

class MyCart extends StatelessWidget {
  final MyCardController _cardController = Get.put(MyCardController());
  final AddNewItemcontrller _controller = Get.put(AddNewItemcontrller());
   RxInt itemCount = 1.obs;


  MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    double calculateTotalPrice() {
      double totalPrize = 0.0;
      for (var item in _cardController.mycartItems) {
        int itemCount = _cardController.itemCount
            .toInt(); // Get the item count for this specific item
        double itemPrice = double.parse(item.itemPrice.toString());
        totalPrize += itemCount * itemPrice;
      }
      return totalPrize;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                final cartItems = _cardController.mycartItems;
                return Card(
                  elevation: 8,
                  shadowColor: Colors.amber,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = _controller.menuItems[index];
                        log(_controller.menuItems.length.toString());

                        return Obx(
                          () => ListTile(
                            horizontalTitleGap: 5,
                            title: Text(
                              item.itemname.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  height: 0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                            subtitle: Text(
                              item.itemDescription.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                            leading: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          item.imageUrl.toString()),
                                      fit: BoxFit.cover)),
                            ),
                            onTap: () {
                              Get.to(FoodDetailsPage(
                                pitem: item,
                              ));
                            },
                            trailing: Column(
                              children: [
                              
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        _cardController.decreaseItemCount();
                                      },
                                    ),
                                    Text(
                                      _cardController.itemCount.toString(),
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        _cardController.increaseItemCount();
                                      },
                                    ),
                                    Text(
                                      "₹ ${item.itemPrice.toString()}",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 50,
                          color: Colors.black,
                          thickness: 5,
                        );
                      },
                      itemCount: cartItems.length),
                      
                );
              },
            ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade800,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Text(
                      "TOTAL AMOUNT: ${calculateTotalPrice().toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.black,
                      minWidth: 300,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "CHECK OUT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Get.to(UserAdress());
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
