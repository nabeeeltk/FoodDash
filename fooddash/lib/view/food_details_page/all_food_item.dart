import 'package:flutter/material.dart';
import 'package:fooddash/widget/Search_filtter.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:get/get.dart';

class AllFoodItem extends StatelessWidget {
  const AllFoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
           const SearchWidget(),
            FoodItemList()],
      ),
    );
  }
}
