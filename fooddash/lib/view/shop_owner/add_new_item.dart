import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// ignore: must_be_immutable
class AddNewItem extends StatelessWidget {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  final TextEditingController itemDescriptionController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();

  final RxBool isVeg = true.obs; // Default to Veg

  // ignore: unused_field
  File? _image;

  AddNewItem({super.key});

 void chooseImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _image = File(pickedFile.path);
  }
}


  void addItem() {
    // Implement your logic to add the item to Firebase
    // Use the controllers and other data as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.abc,
          color: Colors.white,
        ),
        title: const Text("ADD NEW ITEM"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.restore),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: itemNameController,
                decoration: const InputDecoration(
                  hintText: "Enter new item name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: itemPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter new item Price",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: itemDescriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter new item Description",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ingredientsController,
                decoration: const InputDecoration(
                  hintText: "Ingredients",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Category:"),
                  Radio(
                    value: true,
                    groupValue: isVeg.value,
                    onChanged: (value) => isVeg.value = value as bool,
                  ),
                  const Text("Vegetable"),
                  Radio(
                    value: false,
                    groupValue: isVeg.value,
                    onChanged: (value) => isVeg.value = value as bool,
                  ),
                  const Text("Nonvegetable"),
                ],
              ),
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(color: Colors.grey.shade400),

              child: TextButton(
                onPressed: chooseImage,
                child:const Text("Choose Image",style: TextStyle(color: Colors.black),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange.shade800,
                onPressed: addItem,
                child: const Text(
                  "ADD NEW ITEM",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
