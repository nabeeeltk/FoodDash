import 'package:flutter/material.dart';
import 'package:fooddash/view/UserProfile/user_address.dart';
import 'package:fooddash/view/UserProfile/user_profile_edit.dart';
import 'package:fooddash/view/myOrder/user_orde_page.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(onPressed: (){  Get.back();}, 
        icon:const  Icon(Icons.arrow_back_ios_new,size: 30,)),
        title:const  Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 70,
              backgroundImage:const AssetImage('image/fooddash.jpg'),
              child: IconButton(onPressed: (){}, icon:const Icon(Icons.camera_alt)), // Replace with the user's profile picture
            ),
            const SizedBox(height: 10),
            const Text(
              'User Name', 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'user@example.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              onTap: () {
                Get.to(const EditProfilePage());
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title:const Text('My Orders'),
              onTap: () {
               Get.to(const UserOrderPage());
              },
            ),
          const  Divider(),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment Methods'),
              onTap: () {
               
              },
            ),
           const Divider(),
            ListTile(
              leading: const Icon(Icons.location_on),
              title:const  Text('Shipping Addresses'),
              onTap: () {
               Get.to(const UserAdress());  
              },
            ),
           const  Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
               
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
