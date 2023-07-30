import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fooddash/widget/category_widget.dart';
import 'package:fooddash/widget/restuarant_list.dart';

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
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        log("open menu");
                      },
    
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 25,
                        child: const Icon(
                          Icons.menu_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Image.asset("image/fooddash.jpg",width: 100,height: 80,),
                    GestureDetector(
                      onTap: () {
                        log("open menu");
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 25,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
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
              // call  all categorywidget
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "All Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const AllCategoryWidget(),
    
              //  call all  Restuarent 
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  " All Restaurants",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            const RestuarentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
