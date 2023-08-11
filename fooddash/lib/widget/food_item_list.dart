import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/owner/add_item_cotroller.dart';
import '../model/Item_model.dart';
import '../view/food_details_page/food_details.dart';

class FoodItemList extends StatelessWidget {
  final _controller = Get.put(AddNewItemcontrller());
  FoodItemList({super.key});

  @override
  Widget build(BuildContext context) {
    
    // try {
    //   if (_controller.menuItems.isEmpty) {
    //     return const Center(
    //         child: Text("No data", style: TextStyle(color: Colors.white)));
    //   } else {
    //     // Rest of your list view code...
    //   }
    // } catch (e) {
    //   print("Exception occurred: $e");
    //   return const Center(
    //       child:
    //           Text("An error occurred", style: TextStyle(color: Colors.white)));
    // }
    return FutureBuilder(
        future:_controller. getMenuItems(),
        builder: (context, snapshot) {
          return ListView.separated(
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/pizza1.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  onTap: () {
                    Get.to(const FoodDetailsPage());
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
                return const Divider(
                    height: 50, thickness: 0, color: Colors.white);
              },
              itemCount: _controller.menuItems.length);
        });
  }

  
}
