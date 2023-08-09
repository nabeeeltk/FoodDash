import 'package:flutter/material.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:get/get.dart';

class AllFoodItem extends StatelessWidget {
  const AllFoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(onPressed: (){
          Get.back();
         }, icon:const Icon(Icons.arrow_back_ios,size: 30,)),
      ),
      body: Column(
        children: [
               FoodItemList()
        ],
      ),
    );
  }
}