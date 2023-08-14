import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/view/shop_owner/home_screen.dart';
import 'package:fooddash/widget/root_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/Item_model.dart';

class AddNewItemcontrller extends GetxController {
  FirebaseFirestore itemdb = FirebaseFirestore.instance;
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  final TextEditingController itemDescriptionController =
      TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  RxList<ItemModel> menuItems = <ItemModel>[].obs;
  final RxBool isVeg = true.obs; // Default to Veg

  // ignore: unused_field
  File? _image;
  // String? image;

  void chooseImage() async {
  final pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _image = File(pickedFile.path);
  }
}


  Future<void> addItem() async {
  try {
    String imageUrl = ""; 
    if (_image != null) {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('menu_images/${itemNameController.text}.jpg');
      final UploadTask uploadTask = storageRef.putFile(_image!);
      final TaskSnapshot storageSnapshot =
          await uploadTask.whenComplete(() {});
      imageUrl = await storageSnapshot.ref.getDownloadURL();
      log(imageUrl.toString());
    }

    await itemdb.collection('menuItems').add({
      "itemName": itemNameController.text,
      "itemDescription": itemDescriptionController.text,
      "ingredients": ingredientsController.text,
      "itemPrice": itemPriceController.text,
      "imageUrl": imageUrl, // Update imageUrl
    });

    Get.to( const RootScreen());
  } catch (e) {
    // Handle error
    log('Error adding item: $e');
  }
}
   Future <void> getMenuItems() async {
   try {
      final QuerySnapshot querySnapshot =
          await itemdb.collection('menuItems').get();
      menuItems.value = querySnapshot.docs.map((doc) {
        return ItemModel.fromMap(doc);
      }).toList();
    } catch (e) {
      // Handle error
      log('Error fetching menu items: $e');
    }
  }
   Future<void> deleteItem(String itemId) async {
    try {
      await itemdb.collection('menuItems').doc(itemId).delete();
      log('Item deleted successfully');
    } catch (e) {
      // Handle error
      log('Error deleting item: $e');
    }
  }
   Future<void> editItem(String itemId) async {
    try {
      String imageUrl = "";
      if (_image != null) {
        final Reference storageRef = FirebaseStorage.instance
            .ref()
            .child('menu_images/${itemNameController.text}.jpg');
        final UploadTask uploadTask = storageRef.putFile(_image!);
        final TaskSnapshot storageSnapshot =
            await uploadTask.whenComplete(() {});
        imageUrl = await storageSnapshot.ref.getDownloadURL();
        log(imageUrl.toString());
      }

      await itemdb.collection('menuItems').doc(itemId).update({
        "itemName": itemNameController.text,
        "itemDescription": itemDescriptionController.text,
        "ingredients": ingredientsController.text,
        "itemPrice": itemPriceController.text,
        "imageUrl": imageUrl, // Update imageUrl
      });

      Get.to(const ShopeHomeScreen());
    } catch (e) {
      // Handle error
      log('Error editing item: $e');
    }
  }
}
