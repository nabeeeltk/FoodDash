import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/view/user_profile/user_profile.dart';
import 'package:fooddash/widget/search_filtter.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:fooddash/widget/main_card.dart';
import 'package:fooddash/widget/root_screen.dart';
import 'package:get/get.dart';
import '../food_details_page/all_food_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   User? user = FirebaseAuth.instance.currentUser;
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
                      child: const CircleAvatar(
                        
                        backgroundColor: Colors.orange,
                        
                        radius: 25,
                        child: CircleAvatar(
                          radius: 23,
                            backgroundColor: Colors.black,
                          child:  Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        
                      ),
                      
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                     Text(
                      user!.email.toString(),
                      style:const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                    // IconButton(
                    //     onPressed: () {
                    //       Get.to( const RootScreen());
                    //     },
                    //     icon:const  Icon(Icons.home))
                  ],
                ),
              ),
        SearchWidget(),
       
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
