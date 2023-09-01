import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/view/user_profile/user_address.dart';
import 'package:get/get.dart';
import '../model/adress_model.dart';

class UserAddressController extends GetxController {
  var selectedCheckboxes = <RxBool>[false.obs, false.obs].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<Address> addresses = <Address>[].obs;

  TextEditingController name = TextEditingController();
  TextEditingController Adress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  void handleCheckboxChange(int index, bool value) {
    for (int i = 0; i < selectedCheckboxes.length; i++) {
      if (i == index) {
        selectedCheckboxes[i].value = value;
      } else {
        selectedCheckboxes[i].value = false;
      }
    }
  }

  Future<void> addAddress(Address newAddress) async {
    try {
      await _firestore.collection('addresses').add({
        'name': newAddress.name,
        'city': newAddress.city,
        'address': newAddress.address,
        'phoneNumber': newAddress.phoneNumber,
      });
            
      log('Address added to Firestore');
      fetchAddresses();
      await Get.to(UserAdress()); // Fetch addresses to update the list
      await  Get.snackbar(
          backgroundColor: Colors.white,
          "Sucsessfull", "Address Adedd");
    } catch (error) {
      log('Error adding address to Firestore: $error');
    }
  }

  Future<void> fetchAddresses() async {
    try {
      final querySnapshot = await _firestore.collection('addresses').get();

      addresses.value = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Address(
          id: doc.id,
          name: data['name'] ?? '',
          city: data['city'] ?? '',
          address: data['address'] ?? '',
          phoneNumber: data['phoneNumber'] ?? '',
        );
      }).toList();
        
   
      log('Addresses fetched from Firestore');
    } catch (error) {
      log('Error fetching addresses from Firestore: $error');
    }
  }

  Future<void> deleteAddress(Address address) async {
    try {
      await _firestore.collection('addresses').doc(address.id).delete();
      log('Address deleted from Firestore');

      // After deleting the address, you can update the addresses list.
      await fetchAddresses();
      Get.back();
    } catch (error) {
      log('Error deleting address from Firestore: $error');
    }
  }
  
}
