import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/owner/add_item_cotroller.dart';
import '../view/food_details_page/food_details.dart';

class FoodItemList extends StatelessWidget {
          
    final _controller = Get.put(AddNewItemcontrller());
  FoodItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // final name = _controller.menuItems[index];
                return ListTile(
                    horizontalTitleGap: 5,
                    title: const  Text(
                      "Burger Ferguson ",
                      style:
                          TextStyle(fontSize: 18,
                          height: 0,
                           fontWeight: FontWeight.bold,
                           color: Colors.orange),
                    ),
                    subtitle: const Text(
                      "Spicy restaurant  ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
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
                      Get.to( const FoodDetailsPage());
                    },
                    trailing: const Column(
                      children: [
                        Text(
                          "₹300",
                          style: TextStyle(
                            color: Colors.green,
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                    );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                    height: 50, thickness: 0, color: Colors.white);
              },
              itemCount: 2
              // _controller.menuItems.length,
            );
  }
}