import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/controller/auth/auth_contoller.dart';
import 'package:fooddash/controller/user_profile/user_profile_controller.dart';
import 'package:fooddash/view/myOrder/user_orde_page.dart';
import 'package:fooddash/view/my_cart/my_cart.dart';
import 'package:fooddash/view/splash/splash_screen.dart';
import 'package:fooddash/view/user_profile/help_support.dart';
import 'package:fooddash/view/user_profile/user_address.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../payment/track_order_page.dart';

// ignore: must_be_immutable
class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});
  final ctrl = Get.put(Authcontroller);
  User? user = FirebaseAuth.instance.currentUser;
  final UserProfileController _pimage = Get.put(UserProfileController());

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
              Icons.arrow_back_ios_new,
              size: 30,
              color: Colors.white,
            )),
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            FutureBuilder(
              future: _pimage.fetchProfileImageUrl(""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("image/profileimg.png"),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  return CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(snapshot.data.toString()),
                  );
                } else {
                 
                  return  const Text("No data available");
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: TextButton(
                onPressed: () {
                  _pimage.chooseImage();
                },
                child: const Text(
                  "Choose Image",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user!.email.toString(),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help& Support',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const HelpAndSupport());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title:
                  const Text('My Cart', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(MyCart());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title:
                  const Text('My Order', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(OrderStatus());
              },
            ),
            
            const Divider(),
            ListTile(
              leading: const Icon(Icons.library_books_outlined),
              title: const Text('Address Book',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(UserAdress());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(TimelineWidget());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Security &privecy',
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share', style: TextStyle(color: Colors.white)),
              onTap: () {
                Share.share("asdfghjklsdfghjkl;xcvbnm,.xcvbnm,./");
              },
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
