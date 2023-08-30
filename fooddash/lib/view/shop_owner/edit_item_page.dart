import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddash/model/faveraite_model.dart';
import 'package:get/get.dart';

import '../../controller/owner/add_item_cotroller.dart';

class EditItemPage extends StatelessWidget {
  String itemId;

  final _controller = Get.put(AddNewItemcontrller());
  ItemModel? edititem;

  EditItemPage({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    final edititem =
        _controller.menuItems.firstWhere((item) => item.id == itemId);
    _controller.itemNameController.text = edititem!.itemname.toString();
    _controller.itemPriceController.text = edititem!.itemPrice.toString();
    _controller.itemDescriptionController.text =
        edititem!.itemDescription.toString();
    _controller.ingredientsController.text = edititem!.ingredients.toString();

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
                controller: _controller.itemNameController,
                decoration: const InputDecoration(
                  hintText: "",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller.itemPriceController,
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
                controller: _controller.itemDescriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter new item Description",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller.ingredientsController,
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
                  const Text("Category:"),
                  Radio(
                    value: true,
                    groupValue: _controller.isVeg.value,
                    onChanged: (value) =>
                        _controller.isVeg.value = value as bool,
                  ),
                  const Text("Vegetable"),
                  Radio(
                    value: false,
                    groupValue: _controller.isVeg.value,
                    onChanged: (value) =>
                        _controller.isVeg.value = value as bool,
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
                onPressed: _controller.chooseImage,
                child: const Text(
                  "Choose Image",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange.shade800,
                onPressed: () {
                  _controller.editItem(itemId);
                  log(_controller.ingredientsController.text);
                },
                child: const Text(
                  "SAVE CHANGES",
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
