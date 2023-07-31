import 'package:flutter/material.dart';
import 'package:fooddash/view/MyCart/my_cart.dart';
import 'package:get/get.dart';

import '../../controller/food_Quntity_controller.dart';

class FoodDetailsPage extends StatelessWidget {
  FoodDetailsPage({super.key});
  final FoodQuantityController controller = Get.put(FoodQuantityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            )),
        title: const Text("Food Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration:const  BoxDecoration(
                    color: Colors.blueGrey,
                    // image:  DecorationImage(
                    //     image: AssetImage("image/pizza1.jpg"),
                    //     fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(30),bottomStart: Radius.circular(30))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text(
                "pizza calzone european",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
             padding: EdgeInsets.only(left:8.0),
              child: Text(
                "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    label: const Text("4.7")),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delivery_dining,
                      color: Colors.amber,
                    ),
                    label: const Text("free"))
              ],
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {},
                      color: Colors.orange.shade800,
                      child: const Text(
                        "BUY NOW",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Get.to( const MyCart());
                      },
                      color: Colors.orange.shade800,
                      child: const Text(
                        "ADD  TO CART",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
