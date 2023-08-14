import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddash/controller/owner/add_item_cotroller.dart';
import 'package:fooddash/view/payment/payment_page.dart';

import 'package:get/get.dart';

import '../../controller/car_controller.dart';

import '../food_details_page/food_details.dart';

class MyCart extends StatelessWidget {
  final MyCardController _cardController = Get.put(MyCardController());
  final AddNewItemcontrller  _controller = Get.put(AddNewItemcontrller());
  MyCart({super.key});

  @override
  Widget build(BuildContext context) {
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
           Obx(() {
             final cartItems = _cardController.mycartItems;
            return
             ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = _controller.menuItems[index];
                  log(_controller.menuItems.length.toString());
                  return ListTile(
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
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    leading: Container(
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item.imageUrl.toString()),
                              fit: BoxFit.cover)),
                    ),
                    onTap: () {
                      Get.to( FoodDetailsPage(pitem: item,));
                    },
                    trailing: Column(
                      children: [
                        Text(
                          item.itemPrice.toString(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(thickness: 0, color: Colors.black);
                },
                itemCount: cartItems.length);
           },
              
           ),
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "TOTAL PRIZE :900 ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.orange.shade800,
                      minWidth: 300,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "PLACE ORDER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                       Get.to(PaymentPage()) ;
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
