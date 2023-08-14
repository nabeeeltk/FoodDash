import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/owner/add_item_cotroller.dart';
import '../view/food_details_page/food_details.dart';

class FoodItemList extends StatelessWidget {
  final _controller = Get.put(AddNewItemcontrller());
  FoodItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.getMenuItems(),
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
              itemCount: _controller.menuItems.length);
        }
        );
  }
}
