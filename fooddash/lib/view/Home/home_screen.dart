import 'package:flutter/material.dart';
import 'package:fooddash/view/user_profile/user_profile.dart';
import 'package:fooddash/widget/Search_filtter.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:fooddash/widget/main_card.dart';
import 'package:fooddash/widget/root_screen.dart';

import 'package:get/get.dart';

import '../../widget/cetagory_button.dart';
import '../food_details_page/all_food_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<String> itemCategory = ["All", "Veg", "Non-Veg"];
  String selectedCategory = "All";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(UserProfilePage());
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 25,
                        child: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "@username",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.to( const RootScreen());
                        },
                        icon:const  Icon(Icons.home))
                  ],
                ),
              ),
            const  SearchWidget(),
             const  SizedBox(
                height: 10,
              ),
              //widget
              CardCarousel(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Populer Item",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to( const AllFoodItem());
                      },
                      child:const  Text("veiw All"))
                ],
              ),
              
              FoodItemList()
            ],
          ),
        ),
      ),
    );
  }
}
