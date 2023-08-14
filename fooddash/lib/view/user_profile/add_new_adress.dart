import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
        body: const SingleChildScrollView(
          child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Adress",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  )
          ]),
        ),
    );
  }
}