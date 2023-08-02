 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/car_controller.dart';

Widget buildCard(BuildContext context, BoxConstraints constraints) {
  final MyCardController controller = Get.put(MyCardController());
    return Card(
      color: Colors.grey.shade500,
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: constraints.maxWidth * 0.25,
                  width: constraints.maxWidth * 0.25,
                  decoration: const BoxDecoration(color: Colors.blueGrey),
                ),
              ),
              const Text("Item Name"),
              IconButton(
                onPressed: () => controller.decreaseItemCount(),
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Obx(() => Text(
                    controller.itemCount.toString(),
                    style: const TextStyle(fontSize: 20),
                  )),
              IconButton(
                onPressed: () => controller.increaseItemCount(),
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Prize: #300 ",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.cancel))
            ],
          ),
        ],
      ),
    );
  }