import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/controller/auth/owner_auth_controller.dart';
import 'package:fooddash/controller/payment/payment_cotroller.dart';
import 'package:fooddash/view/shop_owner/order_histroy.dart';
import 'package:fooddash/view/shop_owner/user_review.dart';
import 'package:get/get.dart';

import '../splash/splash_screen.dart';

class OwnerProfil extends StatelessWidget {
  OwnerProfil({super.key});
  final PaymentController _paymentController = Get.put(PaymentController());
  final _ctrl =Get.put(ShopOwnerAuthController());
  //  final _controller = Get.put(AddNewItemcontrller());
  // // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(
          Icons.abc,
          color: Colors.orange.shade800,
        ),
        backgroundColor: Colors.orange.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.orange.shade800,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Available Balance",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    FutureBuilder<double>(
                        future: _paymentController.getTotalAmount(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          double availableBalance = snapshot.data ?? 0.0;
                          return Text(
                            availableBalance.toStringAsFixed(2),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Withdraw",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text(
                'Order history',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(OrderHistroy());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.reviews),
              title: const Text('User Review',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(UserReview());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title:
                  const Text('Statics', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(),
           ListTile(
              leading: const Icon(Icons.logout),
              title:
                  const Text('Log Out', style: TextStyle(color: Colors.white)),
              onTap: () async {
                User? user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        icon: const Icon(
                          Icons.warning,
                          size: 50,
                          color: Colors.red,
                        ),
                        title: const Text('Confirm Log Out'),
                        content:
                            const Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              await Get.to(SplashScren());
                            },
                            child: const Text('Log Out',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
