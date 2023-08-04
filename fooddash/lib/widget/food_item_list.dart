import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/FoodDetailsPage/food_details.dart';

class FoodItemList extends StatelessWidget {
  const FoodItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                    horizontalTitleGap: 5,
                    title: const Text(
                      "Burger Ferguson ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Spicy restaurant  ",
                      style: TextStyle(
                        fontSize: 15,
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
                          "#300",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
              },
              separatorBuilder: (context, index) {
                return const Divider(
                    height: 50, thickness: 0, color: Colors.black);
              },
              itemCount: 5,
            );
  }
}