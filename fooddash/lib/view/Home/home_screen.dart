import 'package:flutter/material.dart';
import 'package:fooddash/view/UserProfile/user_profile.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:fooddash/widget/main_card.dart';

import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                   Get.to(const UserProfilePage());
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
                    const SizedBox(width: 20,),
                  const  Text("Location",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 18),)
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Hay User",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    cursorHeight: 25,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Search dishes, restaurants,",
                        hintStyle: const TextStyle(fontSize: 18),
                        fillColor: const Color.fromARGB(179, 209, 207, 207),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
              // call  all categorywidget
              // const Padding(
              //   padding: EdgeInsets.only(left: 8),
              //   child: Text(
              //     "All Items",
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //   ),
              // ),
              // const AllCategoryWidget(),

              // //  call all  Restuarent
              // const Padding(
              //   padding: EdgeInsets.only(left: 8),
              //   child: Text(
              //     " All Restaurants",
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //   ),
              // ),
              // const RestuarentWidget(),
              
            CardCarousel(),
           const  SizedBox(height: 10,),
          const   Padding(
              padding:EdgeInsets.all(8.0),
              child: Text("Populer Item", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
          const   FoodItemList()
            ],
          ),
        ),
      ),
    );
  }
}
