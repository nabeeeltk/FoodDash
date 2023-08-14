import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/controller/auth/auth_contoller.dart';
import 'package:fooddash/view/splash/splash_screen.dart';
import 'package:fooddash/view/user_profile/user_address.dart';
import 'package:fooddash/view/user_profile/user_profile_edit.dart';
import 'package:fooddash/view/myOrder/user_orde_page.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});
  final ctrl = Get.put(Authcontroller);
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
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('image/profileimg.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'User Name',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            const SizedBox(height: 10),
            const Text(
              'user@example.com',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const EditProfilePage());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('My Orders',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const UserOrderPage());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help& Support',
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.library_books_outlined),
              title: const Text('Address Book',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const UserAdress());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const UserAdress());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Security &privecy',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const UserAdress());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.to(const UserAdress());
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
