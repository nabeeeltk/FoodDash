import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../payment/payment_page.dart';
import '../my_cart/my_cart.dart';

class FoodDetailsPage extends StatelessWidget {
 const  FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    image:  DecorationImage(
                        image: AssetImage("image/Banner1.jpeg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(30),
                        bottomStart: Radius.circular(30))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "pizza calzone european",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
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
                    label: const Text("free")),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "ingredients",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.Prosciutto e funghi is a pizza variety that is topped with tomato sauce",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
               const  SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                       
                        height: 40,
                        onPressed: () {
                          Get.to(PaymentPage());
                        },
                        color: Colors.black,
                        child: const Text(
                          "BUY NOW",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 40,
                        onPressed: () {
                          showAlert(context, QuickAlertType.success);
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
              ],
            )
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context, QuickAlertType quickAlertType) {
    QuickAlert.show(
      context: context,
      type: quickAlertType,
      text: "",
      confirmBtnColor: Colors.orange.shade800,
      onConfirmBtnTap: () {
        Get.to(MyCart());
      },
    );
  }
}
