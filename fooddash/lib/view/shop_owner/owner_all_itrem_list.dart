import 'package:flutter/material.dart';
import 'package:fooddash/view/shop_owner/owner_food_item_list.dart';
import 'package:fooddash/widget/search_filtter.dart';

class OwnerAllFoodItem extends StatelessWidget {
  const OwnerAllFoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
            OwnerFoodItemList()

          ],
        ),
      ),
    );
    
  }
}