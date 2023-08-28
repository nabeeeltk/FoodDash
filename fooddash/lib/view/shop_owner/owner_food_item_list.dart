import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fooddash/view/shop_owner/owner_fd_details.dart';
import 'package:get/get.dart';
import '../../controller/owner/add_item_cotroller.dart';


class OwnerFoodItemList extends StatelessWidget {
  final _controller = Get.put(AddNewItemcontrller());
  OwnerFoodItemList({super.key});
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
                return InkWell(
                  onTap: () {
                    Get.to(OwnerFoodDetailsPage(
                      pitem: item,
                    ));
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            item.imageUrl.toString()),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  item.itemname.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                                ),
                                Text(
                                  item.itemDescription.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("₹ ${item.itemPrice.toString()}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(thickness: 0, color: Colors.black);
              },
              itemCount: _controller.menuItems.length);
        });
  }
}
