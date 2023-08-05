import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAdress extends StatelessWidget {
  const UserAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           
          children: [
                   const SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      children: [
                         CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                                     ),
                           const SizedBox(width: 20,),
                          const Text("My Address")
                      ],

                     ),
                   ),


          ],
        ),
      ),
    );
  }
}