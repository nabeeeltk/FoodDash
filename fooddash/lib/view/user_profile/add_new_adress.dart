import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_adress_controller.dart';
import '../../model/adress_model.dart';

class AddNewAddress extends StatelessWidget {
 AddNewAddress({super.key});
final UserAddressController  _addressController  =Get.put(UserAddressController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const  Text("Add New Adress",style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
                  Padding(

                    padding:const  EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _addressController.name,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding:const  EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _addressController.city,
                      decoration: const InputDecoration(
                        hintText: "City",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _addressController.Adress,
                      decoration:const  InputDecoration(
                        hintText: "Adress",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding:const  EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _addressController.phoneNumber,
                      decoration:const  InputDecoration(
                        hintText: "Phone Number ",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),

            MaterialButton(
  color: Colors.orange,
  child: const Text("ADD", style: TextStyle(color: Colors.white, fontSize: 18)),
  onPressed: () {
    final newAddress = Address(
      name: _addressController.name.text,
      city: _addressController.city.text,
      address: _addressController.Adress.text,
      phoneNumber: _addressController.phoneNumber.text,
    );

    _addressController.addAddress(newAddress);
  },
)



          ]),
        ),
    );
  }
}