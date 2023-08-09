import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewItemcontrller extends GetxController{
  FirebaseFirestore itemdb =FirebaseFirestore.instance;
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  final TextEditingController itemDescriptionController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();

  final RxBool isVeg = true.obs; // Default to Veg

  // ignore: unused_field
  File? _image;

 void chooseImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _image = File(pickedFile.path);
  }
}


  void addItem() {
   itemdb.collection('').get();
  }
}