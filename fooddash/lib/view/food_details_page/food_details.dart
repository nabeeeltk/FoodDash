import 'package:flutter/material.dart';
import 'package:fooddash/view/food_details_page/add_review.dart';

import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../model/Item_model.dart';
import '../payment/payment_page.dart';
import '../my_cart/my_cart.dart';

class FoodDetailsPage extends StatelessWidget {
  final ItemModel pitem; // Receive the item data

  const FoodDetailsPage({required this.pitem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    image: DecorationImage(
                        image: NetworkImage(pitem.imageUrl.toString()),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(30),
                        bottomStart: Radius.circular(30))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        showMenu(
                          context: context,
                          position: const RelativeRect.fromLTRB(
                              100, 100, 0, 0), // Adjust the position as needed
                          items: [
                            const PopupMenuItem(
                              value: 'edit',
                              child: ListTile(
                                title: Text('Edit'),
                                leading: Icon(Icons.edit),
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: ListTile(
                                title: Text('Delete'),
                                leading: Icon(Icons.delete),
                              ),
                            ),
                          ],
                          elevation: 8.0,
                        ).then((value) {
                          if (value == 'edit') {
                            // Handle edit action
                          } else if (value == 'delete') {}
                        });
                      },
                      icon: const Icon(Icons.more_vert,
                          color: Colors.black, size: 30),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                pitem.itemname.toString(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                pitem.itemDescription.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddReview(),
                      );
                    },
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    label: const Text("4.0")),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delivery_dining,
                      color: Colors.amber,
                    ),
                    label: const Text("free")),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "ingredients",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    pitem.ingredients.toString(),
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 40,
                        onPressed: () {
                          Get.to(PaymentPage());
                        },
                        color: Colors.white,
                        child: const Text(
                          "   BUY NOW   ",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 40,
                        onPressed: () {
                          showAlert(context, QuickAlertType.success);
                        },
                        color: Colors.orange.shade800,
                        child: const Text(
                          "ADD  TO CART",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context, QuickAlertType quickAlertType) {
    QuickAlert.show(
      context: context,
      type: quickAlertType,
      text: "",
      confirmBtnColor: Colors.orange.shade800,
      onConfirmBtnTap: () {
        Get.to(MyCart());
      },
    );
  }
}
